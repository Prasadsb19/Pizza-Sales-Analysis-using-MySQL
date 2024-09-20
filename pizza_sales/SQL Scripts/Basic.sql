create database pizzahut;
use pizzahut;

-- Retrieve the total number of orders placed.
select count(order_id) from orders as total_orders;
-- Ans : 21350

-- Calculate the total revenue generated from pizza sales.
select round(sum(quantity*price)) as total_revenue from order_details
join pizzas 
on pizzas.pizza_id = order_details.pizza_id;
-- Ans : 817860

-- Identify the highest-priced pizza.
select name, price from pizzas
join pizza_types
on pizzas.pizza_type_id = pizza_types.pizza_type_id
order by price desc
limit 1;
-- Ans : The Greek Pizza	35.95

-- Identify the most common pizza size ordered.
select size, count(quantity) as quantity from pizzas
join order_details 
on pizzas.pizza_id = order_details.pizza_id 
group by size
order by quantity desc
limit 1;
-- Ans : L	18526

-- List the top 5 most ordered pizza types along with their quantities.
select name, count(quantity) as quantity from pizzas
join order_details 
on pizzas.pizza_id = order_details.pizza_id
join pizza_types 
on pizzas.pizza_type_id = pizza_types.pizza_type_id  
group by name
order by quantity desc
limit 5;
/* Ans : 
The Classic Deluxe Pizza	2416
The Barbecue Chicken Pizza	2372
The Hawaiian Pizza	2370
The Pepperoni Pizza	2369
The Thai Chicken Pizza	2315 */




