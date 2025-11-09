-- Count the number of patients by each service.
SELECT service, COUNT(patient_id) AS No_of_Patients 
FROM patients
GROUP BY service;

-- Calculate the average age of patients grouped by service.
SELECT service, AVG(age) AS AVG_Age_of_Patients 
FROM patients
GROUP BY service;


-- Find the total number of staff members per role.
SELECT role, COUNT(staff_id) AS No_of_Staff_members
FROM staff
GROUP BY role;



-- Daily Challenge :
-- For each hospital service, calculate the total number of patients admitted, total patients refused, 
-- and the admission rate (percentage of requests that were admitted). 
-- Order by admission rate descending.
SELECT
    service,
    SUM(patients_admitted) AS Patients_Admitted,
    SUM(patients_refused) AS Patients_Refused,
    ROUND(
        (SUM(patients_admitted) * 100.0) /
        (SUM(patients_admitted) + SUM(patients_refused)), 2
    ) AS Admission_Rate_Percentage
FROM services_weekly
GROUP BY service
ORDER BY Admission_Rate_Percentage DESC;
