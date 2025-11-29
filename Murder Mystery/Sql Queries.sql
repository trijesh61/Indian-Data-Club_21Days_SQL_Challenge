-- The CEO of TechNova Inc. has been found dead in their office on October 15, 2025, at 9:00 PM.

-- 1. Identify where and when the crime happened
SELECT 
    room AS crime_scene,
    found_time AS time_discovered,
    `description`
FROM evidence
WHERE room = 'CEO Office'
ORDER BY found_time;


-- 2. Analyze who accessed critical areas at the time
SELECT e.employee_id, 
		e.`name`, 
        k.log_id,
        k.room,
        k.entry_time,
        k.exit_time
FROM employees e
JOIN keycard_logs k
ON e.employee_id = k.employee_id
WHERE room = "CEO Office" AND entry_time BETWEEN "2025-10-15 20:30:00" AND "2025-10-15 21:10:00";

-- 3. Cross-check alibis with actual logs
SELECT a.*,
		k.log_id,
        k.room,
        k.entry_time,
        k.exit_time
FROM alibis a
LEFT JOIN keycard_logs k
ON a.employee_id = k.employee_id 
AND a.claim_time BETWEEN k.entry_time and k.exit_time
ORDER BY alibi_id;

-- 4. Investigate suspicious calls made around the time
SELECT 
		c.caller_id,
        e1.`name` AS caller_name,
        c.receiver_id,
        e2.`name` AS receiver_name,
        c.call_time,
        c.duration_sec        
FROM employees e1
LEFT JOIN calls c
ON e1.employee_id = c.caller_id
LEFT JOIN employees e2
on e2.employee_id = c.receiver_id
WHERE c.call_time BETWEEN "2025-10-15 20:50:00" AND "2025-10-15 21:00:00";

-- 5.Match evidence with movements and claims
SELECT e.*,
		k.employee_id,
        es.`name`,
        k.log_id,
        k.entry_time,
        k.exit_time,
        a.claim_time,
        a.claimed_location
FROM evidence e
LEFT JOIN keycard_logs k
ON e.room = k.room
LEFT JOIN employees es
ON k.employee_id = es.employee_id
LEFT JOIN alibis a
ON k.employee_id = a.employee_id
WHERE e.found_time BETWEEN k.entry_time and date_add(k.exit_time, interval 15 minute);



-- Combine all findings to identify the killer
-- CASE SOLVED
-- Findings from keylogs
WITH cte_key AS (
SELECT  
	e.employee_id,
    e.`name`,
    "Keylogs" AS Match_Found_in
FROM employees e
LEFT JOIN keycard_logs k
ON e.employee_id = k.employee_id
WHERE k.room = "CEO Office"
),
-- Findings from calls
cte_calls AS (
SELECT 
	e.employee_id,
    e.`name`,
    "Call logs" AS Match_Found_in
FROM employees e 
LEFT JOIN calls c
ON e.employee_id = c.caller_id
WHERE c.call_time BETWEEN "2025-10-15 20:30:00" AND "2025-10-15 21:10:00"
),
-- Findings from alibis
cte_alibis AS (
SELECT 
	e.employee_id,
    e.`name`,
    "Alibis" AS Match_Found_in
FROM employees e	
LEFT JOIN alibis a
ON e.employee_id = a.employee_id
LEFT JOIN keycard_logs k
ON a.employee_id = k.employee_id
WHERE a.claim_time BETWEEN "2025-10-15 20:30:00" AND "2025-10-15 21:10:00"
AND k.room <> a.claimed_location
),
-- Findings from evidence
cte_evidence AS (
SELECT  
	e.employee_id,
    e.`name`,
    "Evidence" AS Match_Found_in
FROM employees e
LEFT JOIN keycard_logs k
ON e.employee_id = k.employee_id
LEFT JOIN evidence ec
ON k.room = ec.room
WHERE ec.found_time BETWEEN k.entry_time and date_add(k.exit_time, interval 15 minute)
)
SELECT `name` AS killer FROM cte_key
UNION
SELECT `name` AS killer FROM cte_calls
UNION
SELECT `name` AS killer FROM  cte_alibis
UNION
SELECT `name` AS killer FROM cte_evidence;   