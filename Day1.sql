-- Retrieve all columns from the patients table.
SELECT * FROM patients;

-- Select only the patient_id, name, and age columns from the patients table.
SELECT patient_id,name,age FROM patients;

-- Display the first 10 records from the services_weekly table.
SELECT * FROM services_weekly LIMIT 10;

-- Day 1 Challange:
-- List all unique hospital services available in the hospital.
SELECT distinct service FROM services_weekly;
