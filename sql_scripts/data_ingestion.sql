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