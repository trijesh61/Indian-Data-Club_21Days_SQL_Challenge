-- Find services that have admitted more than 500 patients in total.
SELECT service,SUM(patients_admitted) AS Total_Patients 
FROM services_weekly
GROUP BY service 
HAVING Total_patients>500; 


-- Show services where average patient satisfaction is below 75
SELECT service,ROUND(AVG(satisfaction),2) AS AVG_Patient_Satisfaction 
FROM patients
GROUP BY service
HAVING AVG_Patient_Satisfaction < 75;



-- List weeks where total staff presence across all services was less than 50.
SELECT week,SUM(present) AS Total_Staff_Present
FROM staff_schedule
GROUP BY week
HAVING Total_Staff_Present < 50;


-- Daily Challenge:
-- Identify services that refused more than 100 patients in total and had an average patient satisfaction below 80.
-- Show service name, total refused, and average satisfaction.
SELECT service,
       SUM(patients_refused) AS Total_patients_refused,
       ROUND(AVG(patient_satisfaction),2) AS Avg_patient_satisfaction
FROM services_weekly
GROUP BY service
HAVING Total_patients_refused > 100
   AND Avg_patient_satisfaction < 80;

