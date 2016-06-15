# Launching an aws instance 
chmod 400 Pera.pem
ssh -i "Pera.pem" root@ec2-54-164-47-242.compute-1.amazonaws.com

# Mounting the volume
fdisk -­l
mount -t ext4 /dev/xvdf/data

# Starting HDFS and postgres
/root/start‐hadoop.sh
/data/start_postgres.sh

# Downloading data and putting it in the hospital_compare folder
su - w205
hdfs dfs -mkdir /user/w205/hospital_compare
wget https://s3.amazonaws.com/w205hospitaldata/hospitals.csv
wget https://s3.amazonaws.com/w205hospitaldata/effective_care.csv
wget https://s3.amazonaws.com/w205hospitaldata/measures.csv
wget https://s3.amazonaws.com/w205hospitaldata/readmissions.csv
wget https://s3.amazonaws.com/w205hospitaldata/survey_responses.csv
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put measures.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put survey_responses.csv /user/w205/hospital_compare