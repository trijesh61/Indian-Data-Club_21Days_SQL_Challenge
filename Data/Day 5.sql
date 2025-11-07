-- Count the total number of patients in the hospital.
SELECT COUNT(patient_id) AS Total_patients
FROM patients;



-- Calculate the average satisfaction score of all patients. 
SELECT AVG(satisfaction) AS Average_Satisfaction_Score
FROM patients;


-- Find the minimum and maximum age of patients.
SELECT MIN(age) AS Min_Age, MAX(age) AS Max_Age
FROM patients;


