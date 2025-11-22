-- 1. Show each patient with their service's average satisfaction as an additional column
SELECT p.*, svw.avg_satisfaction
FROM patients p
LEFT JOIN (
    SELECT service, ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
) svw
ON p.service = svw.service
ORDER BY p.service, p.patient_id;


-- 2. Create a derived table of service statistics and query from it
SELECT *
FROM (
    SELECT 
        service, 
        SUM(patients_admitted) AS total_admitted,
        SUM(patients_refused) AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
        COUNT(DISTINCT week) AS weeks_reported
    FROM services_weekly
    GROUP BY service
) AS service_stats
WHERE total_admitted > 0
ORDER BY total_admitted DESC;

-- 3. Display staff with their service's total patient count
SELECT 
    s.*, 
    COALESCE(pt.total_patients, 0) AS total_patients_service
FROM staff s
LEFT JOIN (
    SELECT service, COUNT(*) AS total_patients
    FROM patients
    GROUP BY service
) pt
ON s.service = pt.service
ORDER BY pt.total_patients DESC, s.staff_name;


