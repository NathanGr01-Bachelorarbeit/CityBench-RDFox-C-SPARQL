# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_Back_15ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_Back_650ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_ConQue_15ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_ConQue_650ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_Freq_15ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_Freq_650ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_ConQue_15ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_ConQue_650ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_Freq_15ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_Freq_650ms.sh
# ./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q10_MulStr_15ms.sh
./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q10_MulStr_650ms.sh
./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_ConQue_15ms.sh
./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q1_ConQue_650ms.sh
./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_ConQue_15ms.sh
./experiment_scripts/RDFoxWithoutPrerun/RDFox_Q5_ConQue_650ms.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q1_Back.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q1_ConQue.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q1_Freq.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q5_ConQue.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q5_Freq.sh
# ./experiment_scripts/CSPARQL/CSPARQL_Q10_MulStr.sh
java -jar ISWC2015-CityBenchNormal.jar query=Q10_8.txt engine=csparql startDate=2014-08-11T11:00:00 endDate=2014-08-31T11:00:00 frequency=2 queryDuplicates=1 duration=600s rdfoxLicense=./RDFox.lic queryInterval=650