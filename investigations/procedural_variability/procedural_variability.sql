# Creating a new table: average scores for each hospital on each procedure
CREATE TABLE procedures AS
SELECT provider_id, measure_id, AVG(score) AS score_avg
FROM effective_care_clean
GROUP BY provider_id, measure_id;


# Calculating the variance in average quality score for each measure across all hospitals
SELECT measures_clean.measure_name, VARIANCE(score_avg) AS variance
FROM procedures
JOIN measures_clean
ON procedures.measure_id = measures_clean.measure_id
GROUP BY measures_clean.measure_name
ORDER BY variance DESC;

# Calculating the highest average scores across hospitals
SELECT measures_clean.measure_name, AVG(score_avg) AS variance
FROM procedures
JOIN measures_clean
ON procedures.measure_id = measures_clean.measure_id
GROUP BY measures_clean.measure_name
ORDER BY variance DESC;