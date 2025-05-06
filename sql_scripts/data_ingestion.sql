SELECT * FROM order_details_2023

create TABLE orders as (
 select * from orders_2023
 UNION ALL
 SELECT * FROM orders_2024
 UNION ALL
 SELECT * FROM orders_2025
);

select * from orders;

create TABLE order_details as (
 select * from order_details_2023
 UNION ALL
 SELECT * FROM order_details_2024
 UNION ALL
 SELECT * FROM order_details_2025
);
SELECT * FROM order_details;
select  *from orders

select count(order_id)
from orders
GROUP BY order_id
HAVING COUNT(order_id) > 1;

select * from pizzas;

-- The most ordered pizza type

SELECT pt.name, p.pizza_id,(p.price * od.quantity) as revenue
from pizza_types as pt 
left join pizzas as p                
on p.pizza_type_id = pt.pizza_type_id
left join order_details as od   
on od.pizza_id = p.pizza_id
GROUP BY pt.name, p.pizza_id, p.price, od.quantity
order by revenue desc limit 1;

-- get the total revdenue of the most ordered pizza
SELECT pt.name, SUM(od.quantity * p.price) as revenue
from pizza_types as pt 
left join pizzas as p                
on p.pizza_type_id = pt.pizza_type_id
left join order_details as od   
on od.pizza_id = p.pizza_id
GROUP BY pt.name
order by revenue desc limit 1;

-- which pizza contributed the most revenue each year from 2023 to 2025
SELECT
    pt.name,
    EXTRACT(YEAR FROM order_date::DATE) as YEAR,
    sum(od.quantity * p.price) as total_revenue
from pizza_types as pt
left join pizzas as p                
on p.pizza_type_id = pt.pizza_type_id
left join order_details as od   
on od.pizza_id = p.pizza_id
left join orders as o
on o.order_id = od.order_id
GROUP BY year, name 
order by year, total_revenue desc;
