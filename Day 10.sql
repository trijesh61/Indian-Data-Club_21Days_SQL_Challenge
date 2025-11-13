-- 1. Categorize patients as 'High', 'Medium', or 'Low' satisfaction based on their scores
SELECT 
    satisfaction,
    CASE
        WHEN satisfaction >= 80 THEN 'High'
        WHEN satisfaction >= 40 AND satisfaction < 80 THEN 'Medium'
        WHEN satisfaction < 40 THEN 'Low'
    END AS categorize_patients
FROM patients;


-- 2. Label staff roles as 'Medical' or 'Support' based on role type
SELECT 
    role,
    CASE
        WHEN role IN ('doctor', 'nurse') THEN 'Medical'
        ELSE 'Support'
    END AS staff_role_category
FROM staff;


-- 3. Create age groups for patients (0–18, 19–40, 41–65, 65+)
SELECT 
    age,
    CASE
        WHEN age >= 0 AND age <= 18 THEN '0–18'
        WHEN age >= 19 AND age <= 40 THEN '19–40'
        WHEN age >= 41 AND age <= 65 THEN '41–65'
        ELSE '65+'
    END AS age_group
FROM patients;


-- ### Daily Challenge:
-- Create a service performance report showing service name, total patients admitted, and 
-- a performance category based on the following: 
-- 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 'Fair' if >= 65, otherwise 'Needs Improvement'. Order by average satisfaction descending.

SELECT 
    service,
    SUM(patients_admitted) AS total_patients,
    ROUND(AVG(patient_satisfaction), 2) AS avg_satisfaction,
    CASE
        WHEN AVG(patient_satisfaction) >= 85 THEN 'Excellent'
        WHEN AVG(patient_satisfaction) >= 75 THEN 'Good'
        WHEN AVG(patient_satisfaction) >= 65 THEN 'Fair'
        ELSE 'Needs Improvement'
    END AS performance_category
FROM services_weekly
GROUP BY service
ORDER BY avg_satisfaction DESC;