-- 1. Show all staff members and their schedule information
-- Left join ensures staff with no schedule entries are included
SELECT 
    s.staff_id,
    s.staff_name,
    s.role,
    s.service,
    ss.week,
    ss.present
FROM staff s 
LEFT JOIN staff_schedule ss 
    ON ss.staff_id = s.staff_id
ORDER BY 
    s.staff_id, ss.week;
    

-- 2. List all services from services_weekly with their assigned staff
-- Services with no assigned staff are still shown
SELECT 
    sw.service,
    s.staff_id,
    s.staff_name,
    s.role
FROM services_weekly sw 
LEFT JOIN staff s 
    ON s.service = sw.service
ORDER BY 
    sw.service, s.staff_name;


-- 3. Patients and the weekly statistics of their service
-- Patients remain visible even if their service has no weekly data
SELECT 
    p.*,
    sw.week,
    sw.patients_admitted,
    sw.patient_satisfaction,
    sw.staff_morale,
    sw.event
FROM patients p 
LEFT JOIN services_weekly sw 
    ON sw.service = p.service
ORDER BY 
    p.service, p.patient_id;
    

-- Daily Challenge:
-- Staff Utilisation Report
-- Show all staff (even if they have no schedule entries)
-- Count the number of weeks they were present (present = 1)
-- Order the results by weeks present in descending order
SELECT s.staff_id, s.staff_name, s.role, s.service,
SUM(CASE WHEN ss.present = 1 THEN 1 ELSE 0 END) AS weeks_present
FROM staff s
LEFT JOIN staff_schedule ss ON ss.staff_id = s.staff_id
GROUP BY s.staff_id, s.staff_name, s.role, s.service
ORDER BY weeks_present DESC;
