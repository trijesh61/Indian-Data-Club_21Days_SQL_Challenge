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
    
-- 2. Weekly service data joined with staff details
SELECT 
    st.staff_id,
    st.staff_name,
    st.role,
    st.service,
    se.week
FROM staff st
INNER JOIN services_weekly se 
    ON se.service = st.service
ORDER BY 
    st.service,
    se.week;

-- 3. Patient information with staff assigned to their service
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.service,
    s.staff_id,
    s.staff_name,
    s.role
FROM patients p
INNER JOIN staff s 
    ON p.service = s.service
ORDER BY 
    p.service,
    p.name;

-- Daily Challenge:
-- Show patient details with the total number of staff available in their service, Only include patients whose service has more than 5 staff members
-- Order by total staff desc, then patient name asc
SELECT 
    p.patient_id,
    p.name AS patient_name,
    p.age,
    p.service,
    COUNT(s.staff_id) AS total_staff
FROM patients p
INNER JOIN staff s 
    ON p.service = s.service
GROUP BY 
    p.patient_id,
    p.name,
    p.age,
    p.service
HAVING 
    COUNT(s.staff_id) > 5
ORDER BY 
    total_staff DESC,
    p.name ASC;