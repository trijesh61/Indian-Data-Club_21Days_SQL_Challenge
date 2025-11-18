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
    


