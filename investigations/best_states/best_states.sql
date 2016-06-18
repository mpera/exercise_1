# Investingating which states are models of high-quality care

# Top 10 average quality scores by state
SELECT hospital_clean.state, AVG(score) AS score_avg, COUNT(DISTINCT hospital_clean.provider_id) AS n_hospitals 
FROM effective_care_clean
LEFT JOIN hospital_clean
ON effective_care_clean.provider_id = hospital_clean.provider_id
GROUP BY hospital_clean.state
ORDER BY score_avg DESC
LIMIT 10;

# Bottom 10 average quality scores by state
SELECT hospital_clean.state, AVG(score) AS score_avg, COUNT(DISTINCT hospital_clean.provider_id) AS n_hospitals 
FROM effective_care_clean
LEFT JOIN hospital_clean
ON effective_care_clean.provider_id = hospital_clean.provider_id
GROUP BY hospital_clean.state
ORDER BY score_avg ASC
LIMIT 10;
