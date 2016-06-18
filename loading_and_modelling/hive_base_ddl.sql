
# creating a full schema for effective_care
DROP TABLE effective_care;
CREATE EXTERNAL TABLE IF NOT EXISTS effective_care
(provider_id INT, hospital_name STRING, address STRING, city STRING, state STRING, zip STRING, county STRING, phone STRING, condition STRING, measure_id INT, measure_name STRING, score INT, sample STRING, footnote STRING, startd DATE, endd DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION "/user/w205/hospital_data/effective_care";

# creating a full schema for measures
DROP TABLE measures;
CREATE EXTERNAL TABLE IF NOT EXISTS measures
(measure_name STRING, measure_id INT, startq STRING, startd DATE, endq STRING, endd DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION "/user/w205/hospital_data/measures";

# creating a full schema for hospitals
DROP TABLE hospitals;
CREATE EXTERNAL TABLE IF NOT EXISTS hospitals
(provider_id INT, hospital_name STRING, address STRING, city STRING, state STRING, zip STRING, county STRING, phone STRING, type STRING, ownership STRING, emergency STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION "/user/w205/hospital_data/hospitals";

# creating a full schema for readmissions
DROP TABLE readmissions;
CREATE EXTERNAL TABLE IF NOT EXISTS readmissions
(provider_id INT, hospital_name STRING, address STRING, city STRING, state STRING, zip STRING, county STRING, phone STRING, measure_name STRING, measure_id INT, compare STRING, denominator INT, score INT, low_est INT, high_est INT, footnote STRING, startd DATE, endd DATE)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION "/user/w205/hospital_data/readmissions";

# creating a full schema for survey responses
DROP TABLE survey;
CREATE EXTERNAL TABLE IF NOT EXISTS survey
(provider_id INT, hospital_name STRING, address STRING, city STRING, state STRING, zip STRING, county STRING, base_score INT, consistency_score INT)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
"separatorChar" = ",",
"quoteChar" = '"',
"escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION "/user/w205/hospital_data/survey";


#SELECT * FROM survey LIMIT 10;
