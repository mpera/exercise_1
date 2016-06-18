#creating the effective_care table
CREATE TABLE effective_care_clean AS
SELECT provider_id, condition, measure_id, score
FROM effective_care;

# creating the measures table
CREATE TABLE measures_clean AS
SELECT measure_name, measure_id
FROM measures;

# creating the hospitals table
CREATE TABLE hospital_clean AS
SELECT provider_id, hospital_name, state, type, ownership
FROM hospitals;

# creating the readmissions table
CREATE TABLE readmissions_clean AS
SELECT provider_id, measure_id, score
FROM readmissions;

# creating the survey response table
CREATE TABLE survey_clean AS
SELECT provider_id, base_score, consistency_score
FROM survey;

#SELECT * FROM survey_clean LIMIT 10;
