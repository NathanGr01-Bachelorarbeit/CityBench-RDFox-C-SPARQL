package org.java.aceis.utils.RDFox;

import com.hp.hpl.jena.rdf.model.Statement;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import tech.oxfordsemantic.jrdfox.Prefixes;
import tech.oxfordsemantic.jrdfox.client.DataStoreConnection;
import tech.oxfordsemantic.jrdfox.client.ServerConnection;
import tech.oxfordsemantic.jrdfox.client.StatisticsInfo;
import tech.oxfordsemantic.jrdfox.exceptions.JRDFoxException;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class NamedStream implements Runnable {
    private static final Logger logger = LoggerFactory.getLogger(NamedStream.class);
    private boolean stop = false;
    public String uri;
    public int windowSizeInMilliSeconds;
    public int stepSizeInMilliSeconds;
    public long systemStartTime;
    public ServerConnection serverConnection;

    /*public PriorityBlockingQueue<ReifiedStatement> reifiedStatementsInWindow = new PriorityBlockingQueue<>(100, new Comparator<ReifiedStatement>() {
        @Override
        public synchronized int compare(ReifiedStatement reifiedStatement1, ReifiedStatement reifiedStatement2) {
            if(reifiedStatement1 != null && reifiedStatement2 != null)
                return (int) ((reifiedStatement1.getProperty(RDFoxWrapper.timestampProperty).getLiteral().getLong()) - reifiedStatement2.getProperty(RDFoxWrapper.timestampProperty).getLiteral().getLong());
            else if(reifiedStatement1 == null)
                return (int) (-1 * reifiedStatement2.getProperty(RDFoxWrapper.timestampProperty).getLiteral().getLong());
            else
                return (int) reifiedStatement1.getProperty(RDFoxWrapper.timestampProperty).getLiteral().getLong();
        }
    });*/

    public Map<Statement, Long> statementsInWindow = new ConcurrentHashMap<>();

    //public ConcurrentLinkedDeque<RdfQuadruple> rdfQuadruples = new ConcurrentLinkedDeque<>();

    public NamedStream(String uri, int windowSize, int stepSize, ServerConnection serverConnection) {
        this.uri = uri;
        this.windowSizeInMilliSeconds = windowSize;
        this.stepSizeInMilliSeconds = stepSize;
        this.serverConnection = serverConnection;
    }

    @Override
    public void run() {
        long i = 0;

        while (!stop) {

            i++;
            if (i == 1) {
                systemStartTime = System.currentTimeMillis();
            }

            while (systemStartTime + i * stepSizeInMilliSeconds > System.currentTimeMillis()) {
                waitUntil(systemStartTime + i * stepSizeInMilliSeconds);
            }
            if(!RDFoxWrapper.pause) {
                try (DataStoreConnection dataStoreConnection = serverConnection.newDataStoreConnection(RDFoxWrapper.datastoreName)) {
                    dataStoreConnection.compact();
                } catch (JRDFoxException e) {
                    e.printStackTrace();
                }
            }

            try {
                if(!RDFoxWrapper.pause) {
                    RDFoxWrapper.maintainStreamDatastore(statementsInWindow, systemStartTime + i * stepSizeInMilliSeconds - windowSizeInMilliSeconds, serverConnection, Prefixes.s_emptyPrefixes);
                }
            }
            catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void waitUntil(long targetTime) {
        long millis = targetTime - System.currentTimeMillis();
        if (millis <= 0)
            return;
        try {
            Thread.sleep(millis);
        } catch (InterruptedException ex) {
            ex.printStackTrace();
        }
    }

    public void put(Statement statement) {
        //ReifiedStatement r = statement.createReifiedStatement();
        //r.addLiteral(RDFoxWrapper.timestampProperty, System.currentTimeMillis());
        //reifiedStatementsInWindow.add(r);
        statementsInWindow.put(statement, System.currentTimeMillis());
    }

    public void stop() {
        if (!stop) {
            stop = true;
            logger.info("Stopping namedStream: " + this.uri);
        }
    }

    public int numberOfDifferentEntries(Map<Statement, Long> map1, Map<Statement, Long> map2) {
        int counter = 0;
        for(Statement statement : map1.keySet()) {
            if (!map2.containsKey(statement))
                counter++;
        }
        return counter;
    }
}
