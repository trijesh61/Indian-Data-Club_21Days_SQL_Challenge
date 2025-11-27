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


-- 2: Use multiple CTEs to break down a complex query into logical steps.
WITH service_stats AS (
    SELECT 
        service,
        SUM(patients_request)   AS total_patients_request,
        SUM(patients_admitted)  AS total_patients_admitted,
        SUM(patients_refused)   AS total_patients_refused,
        ROUND(AVG(patient_satisfaction), 2) AS average_patient_satisfaction
    FROM services_weekly
    GROUP BY service
),
cte_rates AS (
    SELECT 
        service,
        ROUND(total_patients_admitted * 1.0 / total_patients_request, 2) AS admission_rate,
        ROUND(total_patients_refused  * 1.0 / total_patients_request, 2) AS refusal_rate,
        RANK() OVER (ORDER BY total_patients_admitted DESC) AS ranking
    FROM service_stats
)
SELECT *
FROM cte_rates;
