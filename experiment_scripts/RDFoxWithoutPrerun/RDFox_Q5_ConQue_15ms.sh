#! /bin/bash


java -jar ISWC2015-CityBench.jar queryDuplicates=1 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt frequency=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar queryDuplicates=2 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt frequency=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
java -jar ISWC2015-CityBench.jar queryDuplicates=5 engine=rdfox startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 query=Q5.txt frequency=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=15
