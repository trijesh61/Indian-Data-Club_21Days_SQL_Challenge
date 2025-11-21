-- 1. Find patients who are in services with above-average staff count.
SELECT p.patient_id, p.name, p.service, p.satisfaction
FROM patients p
WHERE p.service IN (SELECT service FROM
            (SELECT service, COUNT(*) AS staff_count
            FROM staff
            GROUP BY service) sc
			WHERE sc.staff_count > 
					(SELECT AVG(staff_per_service)
						FROM 
							(SELECT service, COUNT(*) AS staff_per_service
							FROM staff
							GROUP BY service) t)
					);


-- 2. List staff who work in services that had any week with patient satisfaction below 70.
SELECT s.staff_id, s.staff_name, s.role, s.service
FROM staff s
WHERE s.service IN (
  SELECT DISTINCT service
  FROM services_weekly
  WHERE patient_satisfaction < 70
);



