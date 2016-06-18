# Starting HDFS and postgres
/root/start‐hadoop.sh
/data/start_postgres.sh

# Downloading data and putting it in the hospital_compare folder
su - w205
hdfs dfs -mkdir /user/w205/hospital_data
wget https://s3.amazonaws.com/w205hospitaldata/hospitals.csv
wget https://s3.amazonaws.com/w205hospitaldata/effective_care.csv
wget https://s3.amazonaws.com/w205hospitaldata/measures.csv
wget https://s3.amazonaws.com/w205hospitaldata/readmissions.csv
wget https://s3.amazonaws.com/w205hospitaldata/survey_responses.csv
hdfs dfs -mkdir /user/w205/hospital_data/hospitals
hdfs dfs -put hospitals.csv /user/w205/hospital_data/hospitals
hdfs dfs -mkdir /user/w205/hospital_data/effective_care
hdfs dfs -put effective_care.csv /user/w205/hospital_data/effective_care
hdfs dfs -mkdir /user/w205/hospital_data/measures
hdfs dfs -put measures.csv /user/w205/hospital_data/measures
hdfs dfs -mkdir /user/w205/hospital_data/readmissions
hdfs dfs -put readmissions.csv /user/w205/hospital_data/readmissions
hdfs dfs -mkdir /user/w205/hospital_data/survey
hdfs dfs -put survey_responses.csv /user/w205/hospital_data/survey
