-- 1. List all unique services in the patients table
SELECT DISTINCT 
    service 
FROM patients;


-- 2. Find all unique staff roles in the hospital
SELECT DISTINCT 
    role 
FROM staff;


-- 3. Get distinct months from the services_weekly table (sorted in ascending order)
SELECT DISTINCT 
    month 
FROM services_weekly 
ORDER BY month ASC;



-- 4. Daily Challenge:
-- Find all unique combinations of service and event type from the services_weekly table
-- Include only those records where event is not NULL and not equal to 'none'
-- Also, show how many times each combination occurs
-- Order the results by occurrence count in descending order

SELECT 
    service,
    event,
    COUNT(*) AS occurrence_count
FROM services_weekly
WHERE event IS NOT NULL 
  AND LOWER(event) <> 'none'
GROUP BY service, event
ORDER BY occurrence_count DESC;
