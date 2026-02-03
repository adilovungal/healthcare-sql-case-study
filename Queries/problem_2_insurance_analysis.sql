create database project_healthcare;
SELECT
  address.state,
  COUNT(*) AS total_treatments,
  SUM(CASE WHEN treatment.claimID IS NULL THEN 1 ELSE 0 END) AS no_insurance_count,
  ROUND(100.0 * SUM(CASE WHEN treatment.claimID IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS pct_without_insurance
FROM Treatment 
JOIN Patient ON treatment.patientID = patient.patientID
JOIN Person ON patient.patientID = person.personID
JOIN Address ON person.addressID = address.addressID
GROUP BY address.state
ORDER BY pct_without_insurance DESC;
