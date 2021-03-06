# Benchmark
CityBench is a java-based benchmarking toolset for RSP engines, currently CQELS, C-SPARQL, RDFox and C-SPARQL2.0 (see https://github.com/NathanGr01-Bachelorarbeit/CityBench-C-SPARQL2/) are supported.

## Prerequisite
* JVM 1.7
* Webserver of your choice (JBoss,Tomcat etc.)
* Java IDE (for debugging and extensions)

## Folders & Files
1. *CQELS_DB*: necessary for CQELS to work;
2. *cqels_query*: sample queries in CQELS syntax;
3. *csparql_query*: sample queries in C-SPARQL syntax;
4. *dataset*: background knowledge base, mostly sensor service repositories, WebGlCity is a folder that can instantly be used under an Apache server (for C-SPARQL experiments);
5. *experiment_scripts*: execution scripts for scalability experiments with RDFox and C-SPARQL;
6. *ontology*: ontologies used;
7. *rdfox_query*: sample queries in RDFox syntax (window information + SPARQL query);
8. *result_log*: output files generated by CityBench, e.g., query latency, result count and memory consumption;
9. *src*: source code;
10. *lib*: libraries used;
11. *streams*: sensor observation raw data in .csv formats, used to generate RDF streams；
12. *EC-log*: logger file output;
13. *citybench.properties*: configuration file loaded by CityBench.
14. *start.sh*: central execution for scalability experiments

## To run
1. Download all resources and source code
2. Provide 'CQELS_DB' folder if you want to run CQELS experiments
3. Provide static data for queries (e.g. via Apache Web Server)
4. Integrate JRDFox.jar into project in order to resolve the Dependencies
5. Import to your Java IDE and run CityBench.java

## Configuration file
* dataset = dataset/[your_sensor_repository_file]  // tell CityBench where to look for static background knowledge.
* ontology = [your_ontology_folder] // tell CityBench where to look for ontologies used.
* streams = [your_streams_folder] // tell CityBench where to look for raw data to simulate sensor streams.
* cqels_query = [your_cqels_queries_folder] // tell CityBench where to look for cqels queries.
* csparql_query = [your_csparql_queries_folder] // tell CityBench where to look for csparql queries.
* rdfox_query = [your_rdfox_queries_folder] // tell CityBench where to look for RDFox queries.

// All paths are relative path to the project root

// Normally if you use the downloaded resources as they are, you would not need to change the default content in the configuration file. The exception is the dataset property: you might want to change the default sensor repositories and use a different repository file (e.g., dataset/simsimrepo-5-10.n3) in order to test the performance of the cqels engine with different KB sizes loaded

## Program Parameters
Acceptable params: 
* rates = (double)x, // sensor stream acceleration rate (based on real world sensor observation intervals)
* queryDuplicates = (int)y, // number of duplicates to run concurrently
* duration = (long)z,  // duration of the test in milliseconds
* startDate = (date in the format of "yyyy-MM-dd'T'HH:mm:ss")a, // start time of the sensor observations used
* endDate = b,  // ending time of the sensor observations used
* frequency = (double)c.  // fixed frequency for sensors, only has effects when rate=1.0
* engine = "cqels" or "csparql" or "rdfox" // engine to test
* query = (String) q // file names of the queries to run (under cqels_query or csparql_query), separate with ","
* rdfoxLicense = (String)path // path to RDFox license-file
* queryInterval = (int)i // tick interval for RDFox SR extension

engine, start and end dates are  mandatory.
Example for commandline execution: java -jar CityBench.jar engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q1.txt duration=600s queryDuplicates=1 frequency=2 rdfoxLicense=./\<RDFoxLicenseFile\> queryInterval=650

## Notice for C-SPARQL tests
Some C-sparql queries needs loading static knowledge bases, those queries contains clauses like " FROM <http://127.0.0.1:9000/WebGlCity/RDF/SensorRepository.rdf> ".

To load such RDF files, deploy the rdf files under "dataset/csparql_web_server/" on your local web server and make sure they are accessible from the url specified in the clause (you can change the url according to your web server configuration).
