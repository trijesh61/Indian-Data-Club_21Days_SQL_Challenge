-- Count the number of patients by each service.
SELECT service, COUNT(patient_id) AS No_of_Patients 
FROM patients
GROUP BY service;