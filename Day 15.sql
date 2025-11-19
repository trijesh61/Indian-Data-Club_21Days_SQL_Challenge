-- 1. Join patients, staff, and staff_schedule to show patient service and staff availability
SELECT 
    p.patient_id,
    p.name,
    p.service,
    st.staff_id,
    st.staff_name,
    ss.week,
    ss.present
FROM patients AS p
LEFT JOIN staff AS st
    ON p.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id;


-- 2. Weekly service stats with assigned staff and their schedule status
SELECT 
    sw.*,
    st.staff_id,
    st.staff_name,
    ss.week AS schedule_week,
    ss.present
FROM services_weekly AS sw
LEFT JOIN staff AS st
    ON sw.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id;


-- 3. Show weekly patient admissions along with staff assigned to the service
SELECT 
    sw.patients_admitted,
    st.staff_id,
    st.staff_name,
    st.role,
    st.service
FROM services_weekly AS sw
LEFT JOIN staff AS st
    ON sw.service = st.service;
    
-- Daily Challenge: Create a comprehensive service analysis report for week 20 showing: 
-- service name, total patients admitted that week, total patients refused, average patient satisfaction, 
-- count of staff assigned to service, and count of staff present that week. Order by patients admitted descending.
SELECT 
    sw.service,
    SUM(sw.patients_admitted) AS total_patients,
    SUM(sw.patients_refused) AS total_patients_refused,
    ROUND(AVG(sw.patient_satisfaction), 2) AS avg_patient_satisfaction,
    COUNT(st.staff_id) AS staff_assigned,
    COUNT(DISTINCT CASE WHEN ss.present = 1 THEN ss.staff_id END) AS staff_present_in_week
FROM services_weekly AS sw
LEFT JOIN staff AS st
    ON sw.service = st.service
LEFT JOIN staff_schedule AS ss
    ON st.staff_id = ss.staff_id AND ss.week = 20
WHERE sw.week = 20
GROUP BY 
    sw.service
ORDER BY 
    total_patients DESC;
