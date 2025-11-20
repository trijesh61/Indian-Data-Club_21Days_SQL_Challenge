-- **Phase 3: Sales Performance**

-- 10. Total quantity of pizzas sold (`SUM`).
select sum(quantity) as total_pizzas_sold
from order_details;

-- 11. Average pizza price (`AVG`).
select round(avg(price),2) as avg_pizza_price
from pizzas;

-- 12. Total order value per order (`JOIN`, `SUM`, `GROUP BY`).
SELECT
o.order_id,
SUM(p.price * od.quantity) AS total_value
FROM orders AS o
JOIN order_details AS od 
ON o.order_id = od.order_id
JOIN pizzas AS p 
ON od.pizza_id = p.pizza_id
GROUP BY o.order_id;

-- 13. Total quantity sold per pizza category (`JOIN`, `GROUP BY`).
SELECT
pt.category,
SUM(od.quantity) AS total_quantity
FROM pizza_types AS pt
JOIN pizzas AS p 
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details AS od 
ON p.pizza_id = od.pizza_id
GROUP BY pt.category;

-- 14. Categories with more than 5,000 pizzas sold (`HAVING`).
SELECT
pt.category,
SUM(od.quantity) AS total_quantity
FROM pizza_types AS pt
JOIN pizzas AS p 
ON pt.pizza_type_id = p.pizza_type_id
JOIN order_details AS od 
ON p.pizza_id = od.pizza_id
GROUP BY pt.category
HAVING SUM(od.quantity) > 5000;

-- 15. Pizzas never ordered (`LEFT/RIGHT JOIN`).
SELECT *
FROM pizzas AS p
LEFT JOIN
pizza_types AS pt
ON p.pizza_type_id = pt.pizza_type_id 
LEFT JOIN order_details AS od
ON p.pizza_id = od.pizza_id
WHERE od.order_id IS NULL;

-- 16. Price differences between different sizes of the same pizza (`SELF JOIN`).
SELECT
p1.pizza_type_id,
(MAX(p2.price) - MIN(p1.price)) AS price_difference
FROM pizzas AS p1
INNER JOIN pizzas AS p2
ON p1.pizza_type_id = p2.pizza_type_id
AND p1.size <> p2.size
GROUP BY p1.pizza_type_id;


