-- 1: Create a CTE to calculate service statistics, then query from it.
WITH service_stats AS (
    SELECT 
        service,
        SUM(patients_request)   AS total_requested,
        SUM(patients_admitted)  AS total_admitted,
        SUM(patients_refused)   AS total_refused,
        ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction
    FROM services_weekly
    GROUP BY service
)
SELECT * 
FROM service_stats;
