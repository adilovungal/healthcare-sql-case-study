/*
Problem 4: City-wise patient ratio

Objective:
For cities with 10 or more registered people:
- total registered people
- total patients
- percentage of registered people who are patients

Concepts Used:
- HAVING clause
- CTEs
- LEFT JOIN
- Percentage calculation
*/
WITH RegisteredPeople AS
(SELECT Address.city, COUNT(Person.personID) AS total_registered_people FROM Person JOIN Address ON Person.addressID = Address.addressID
GROUP BY Address.city HAVING COUNT(Person.personID) >= 10),
PatientCount AS 
(SELECT Address.city, COUNT(Patient.patientID) AS total_patients FROM Patient JOIN Person ON Patient.patientID = Person.personID JOIN Address ON Person.addressID = Address.addressID
GROUP BY Address.city)
SELECT RegisteredPeople.city, RegisteredPeople.total_registered_people, IFNULL(PatientCount.total_patients, 0) AS total_patients, ROUND(100.0 * IFNULL(PatientCount.total_patients, 0)
/ RegisteredPeople.total_registered_people,2) AS patient_percentage
FROM RegisteredPeople LEFT JOIN PatientCount ON RegisteredPeople.city = PatientCount.city ORDER BY patient_percentage DESC;
