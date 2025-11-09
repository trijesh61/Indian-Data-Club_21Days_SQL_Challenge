-- Count the number of patients by each service.
SELECT service, COUNT(patient_id) AS No_of_Patients 
FROM patients
GROUP BY service;

-- Calculate the average age of patients grouped by service.
SELECT service, AVG(age) AS AVG_Age_of_Patients 
FROM patients
GROUP BY service;


