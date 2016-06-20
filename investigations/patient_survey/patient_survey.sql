# Investigating correlation between patient surveys and hospital quality

# Base scores for all hospitals on the patient survey (ordered highest to lowest)
SELECT hospital_clean.hospital_name, survey_clean.base_score, survey_clean.consistency_score
FROM survey_clean
LEFT JOIN hospital_clean
ON survey_clean.provider_id = hospital_clean.provider_id
ORDER BY base_score;


# Creating a table with the average quality score for each hospital
DROP TABLE hospital_quality;
CREATE TABLE hospital_quality AS 
SELECT hospital_clean.provider_id, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN hospital_clean 
ON effective_care_clean.provider_id = hospital_clean.provider_id
GROUP BY hospital_clean.provider_id;


#Seeing if base_score from the patient survey and average hospital quality score are correlated
SELECT corr(cast(survey_clean.base_score as int), cast(hospital_quality.score_avg as int))
FROM survey_clean
LEFT JOIN hospital_quality
ON survey_clean.provider_id = hospital_quality.provider_id;
