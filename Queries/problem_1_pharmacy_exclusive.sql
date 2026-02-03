/*
Problem 1: Pharmacy-wise hospital-exclusive medicine usage (2022)

Objective:
For each pharmacy, calculate:
- total quantity of medicines prescribed in 2022
- total quantity of hospital-exclusive medicines prescribed in 2022
- percentage of hospital-exclusive medicines

Concepts Used:
- LEFT JOIN
- Conditional aggregation (CASE + SUM)
- NULL handling with IFNULL and NULLIF
- Year-based filtering
*/
SELECT Pharmacy.pharmacyID, Pharmacy.pharmacyName, IFNULL(SUM(Contain.Quantity), 0) AS total_quantity_2022,
IFNULL(SUM(CASE WHEN LOWER(Medicine.hospitalExclusive) = 'y' THEN Contain.Quantity ELSE 0 END),0) AS hospital_exclusive_quantity,
ROUND(100.0 *IFNULL(SUM(CASE WHEN LOWER(Medicine.hospitalExclusive) = 'y' THEN Contain.Quantity ELSE 0 END),0)/
NULLIF(IFNULL(SUM(Contain.Quantity), 0),0),2) AS hospital_exclusive_percentage

FROM Pharmacy
LEFT JOIN Prescription ON Pharmacy.pharmacyID = Prescription.pharmacyID
LEFT JOIN Treatment ON Prescription.treatmentID = Treatment.treatmentID AND YEAR(Treatment.date) = 2022
LEFT JOIN Contain ON Prescription.prescriptionID = Contain.prescriptionID
LEFT JOIN Medicine ON Contain.medicineID = Medicine.medicineID
GROUP BY Pharmacy.pharmacyID,Pharmacy.pharmacyName
ORDER BY hospital_exclusive_percentage DESC;
