-- Find services that have admitted more than 500 patients in total.
SELECT service,SUM(patients_admitted) AS Total_Patients 
FROM services_weekly
GROUP BY service 
HAVING SUM(patients_admitted)>500; 