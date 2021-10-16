#! /bin/bash

java -jar ISWC2015-CityBench.jar query=Q1.txt engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 frequency=1 queryDuplicates=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar query=Q1_20MB.txt engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 frequency=1 queryDuplicates=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar query=Q1_30MB.txt engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 frequency=1 queryDuplicates=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
