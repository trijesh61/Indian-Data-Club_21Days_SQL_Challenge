-- Find all patients who are older than 60 years.
SELECT * FROM patients 
WHERE  age>60;

-- Retrieve all staff members who work in the 'emergency' service.
SELECT * FROM staff 
WHERE service="emergency";


-- List all weeks where more than 100 patients requested admission in any service.
SELECT week,patients_request FROM services_weekly
WHERE patients_request>100;



-- Day 2 Challange:
-- Find all patients admitted to 'Surgery' service with a satisfaction score below 70, showing their patient_id, name, age, and satisfaction score.
SELECT patient_id, name, age, satisfaction AS satisfaction_score
FROM patients
WHERE service="surgery" AND satisfaction < 70;



