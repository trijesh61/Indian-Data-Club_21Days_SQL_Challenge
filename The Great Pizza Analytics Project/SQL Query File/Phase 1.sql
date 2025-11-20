-- Phase 1 : Foundation & Inspection

-- 1. List all unique pizza categories (`DISTINCT`).
select distinct category from pizza_types;

-- 2. Display `pizza_type_id`, `name`, and ingredients, replacing NULL ingredients with `"Missing Data"`. Show first 5 rows.
select pizza_type_id, name,
coalesce(ingredients, 'missing data') as ingredients
from pizza_types
limit 5;

-- 3. Check for pizzas missing a price (`IS NULL`).
select * from pizzas
where price is null;
