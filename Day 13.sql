-- 1. Patients & Staff working in the same service
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    s.staff_name
FROM patients p
INNER JOIN staff s 
    ON p.service = s.service
ORDER BY 
    p.service,
    p.name;
