# investigating the best hospitals
SELECT provider_id, AVG(score) AS score_avg
FROM effective_care_clean
GROUP BY provider_id
ORDER BY score_avg DESC
LIMIT 10;

# getting the highest scoring 10 hospitals for effective care across all procedures
SELECT hospital_clean.hospital_name, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN hospital_clean 
ON effective_care_clean.provider_id = hospital_clean.provider_id
GROUP BY hospital_clean.hospital_name
ORDER BY score_avg DESC
LIMIT 10;

# getting the highest scoring 10 hospitals for readmissions
SELECT hospital_clean.hospital_name, AVG(score) as score_avg 
FROM readmissions_clean
LEFT JOIN hospital_clean
ON readmissions_clean.provider_id = hospital_clean.provider_id
GROUP BY hospital_clean.hospital_name
ORDER BY score_avg DESC
LIMIT 10;

# top 3 scoring measures
SELECT measures_clean.measure_name, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN measures_clean
ON effective_care_clean.measure_id = measures_clean.measure_id
GROUP BY measures_clean.measure_name
ORDER BY score_avg DESC
LIMIT 3;

# bottom 3 scoring procedures
SELECT measures_clean.measure_name, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN measures_clean
ON effective_care_clean.measure_id = measures_clean.measure_id
GROUP BY measures_clean.measure_name
ORDER BY score_avg ASC
LIMIT 4;

# Best hospital at the highest overall scoring procedure (ED_1b)
SELECT hospital_clean.hospital_name, effective_care_clean.measure_id, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN hospital_clean
ON effective_care_clean.provider_id = hospital_clean.provider_id
WHERE effective_care_clean.measure_id = "ED_1b"
GROUP BY hospital_clean.hospital_name, effective_care_clean.measure_id
ORDER BY score_avg DESC
LIMIT 10;

# Best hospital at the lowerst overall scoring procedure (OP_22)
SELECT hospital_clean.hospital_name, effective_care_clean.measure_id, AVG(score) AS score_avg
FROM effective_care_clean
LEFT JOIN hospital_clean
ON effective_care_clean.provider_id = hospital_clean.provider_id
WHERE effective_care_clean.measure_id = "OP_22"
GROUP BY hospital_clean.hospital_name, effective_care_clean.measure_id
ORDER BY score_avg DESC
LIMIT 10;
