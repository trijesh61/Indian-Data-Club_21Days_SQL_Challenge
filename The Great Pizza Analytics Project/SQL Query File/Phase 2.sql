-- **Phase 2: Filtering & Exploration**

-- 4. Orders placed on `'2015-01-01'` (`SELECT` + `WHERE`).
select * from orders
where date = '2015-01-01';

-- 5. List pizzas with `price` descending.
select pt.name,
p.price
from pizzas p
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
order by p.price desc;

-- 6. Pizzas sold in sizes `'L'` or `'XL'`.
select pt.name,
p.size
from pizzas p
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id;

-- 7. Pizzas priced between $15.00 and $17.00.
select pt.name,
p.price
from pizzas p
join pizza_types pt
on p.pizza_type_id = pt.pizza_type_id
where p.price between 15.00 and 17.00
order by p.price;

-- 8. Pizzas with `"Chicken"` in the name.
select pt.name
from pizza_types pt
where pt.name like '%chicken%';

-- 9. Orders on `'2015-02-15'` or placed after 8 PM.
select * 
from orders o
join order_details od
on o.order_id = od.order_id
where date = '2015-02-15' and time > '20:00:00'
order by time;