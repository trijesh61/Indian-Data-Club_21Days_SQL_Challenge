-- Count the total number of patients in the hospital.
SELECT COUNT(patient_id) AS Total_patients
FROM patients;



-- Calculate the average satisfaction score of all patients. 
SELECT AVG(satisfaction) AS Average_Satisfaction_Score
FROM patients;


-- Find the minimum and maximum age of patients.
SELECT MIN(age) AS Min_Age, MAX(age) AS Max_Age
FROM patients;



-- Day 5 Challange:
-- Calculate the total number of patients admitted, total patients refused, and the average patient satisfaction across all services and weeks.
-- Round the average satisfaction to 2 decimal places.
SELECT 
SUM(patients_admitted) AS Total_Patients_Admitted, 
SUM(patients_refused) AS Total_Patients_Refused,
ROUND(AVG(patient_satisfaction),2) AS AVG_Satisfaction
 FROM services_weekly;
 
 
 