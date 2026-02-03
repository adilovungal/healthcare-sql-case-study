/*
Problem 3: Most and least treated diseases per state (2022)

Objective:
For each state, identify:
- most treated disease(s)
- least treated disease(s)
- corresponding treatment counts

Concepts Used:
- Common Table Expressions (CTEs)
- Aggregation
- MAX and MIN
- GROUP_CONCAT to handle ties
*/
WITH DiseaseTreatmentCount AS (SELECT Address.state, Disease.diseaseName, COUNT(Treatment.treatmentID) AS treatment_count
FROM Treatment JOIN Disease ON Treatment.diseaseID = Disease.diseaseID
JOIN Patient ON Treatment.patientID = Patient.patientID
JOIN Person ON Patient.patientID = Person.personID
JOIN Address ON Person.addressID = Address.addressID
WHERE YEAR(Treatment.date) = 2022
GROUP BY Address.state, Disease.diseaseName), StateExtremeCounts AS
(SELECT state, MAX(treatment_count) AS max_treatment_count, MIN(treatment_count) AS min_treatment_count FROM DiseaseTreatmentCount GROUP BY state)
SELECT DiseaseTreatmentCount.state,
GROUP_CONCAT(DISTINCT CASE WHEN DiseaseTreatmentCount.treatment_count = StateExtremeCounts.max_treatment_count THEN DiseaseTreatmentCount.diseaseName END) AS most_treated_diseases,
StateExtremeCounts.max_treatment_count AS most_treated_count,
GROUP_CONCAT(DISTINCT CASE WHEN DiseaseTreatmentCount.treatment_count = StateExtremeCounts.min_treatment_count THEN DiseaseTreatmentCount.diseaseName END ) AS least_treated_diseases,
StateExtremeCounts.min_treatment_count AS least_treated_count

FROM DiseaseTreatmentCount
JOIN StateExtremeCounts ON DiseaseTreatmentCount.state = StateExtremeCounts.state
GROUP BY DiseaseTreatmentCount.state
ORDER BY DiseaseTreatmentCount.state;
DESCRIBE Disease;
ALTER TABLE Disease
CHANGE COLUMN `ï»¿diseaseID` diseaseID INT;