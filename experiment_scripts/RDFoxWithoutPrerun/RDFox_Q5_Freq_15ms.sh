#! /bin/bash

java -jar ISWC2015-CityBench.jar frequency=1 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=600s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar frequency=2 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=600s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar frequency=5 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=300s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar frequency=10 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=120s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar frequency=20 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=60s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar frequency=50 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt duration=50s queryDuplicates=1 rdfoxLicense=./RDFox.lic queryInterval=15
