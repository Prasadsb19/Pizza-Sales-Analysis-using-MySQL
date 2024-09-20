use pizzahut;

-- Join the necessary tables to find the total quantity of each pizza category ordered.
select category, sum(quantity) as total_quantity from pizzas
join order_details 
on pizzas.pizza_id = order_details.pizza_id
join pizza_types 
on pizzas.pizza_type_id = pizza_types.pizza_type_id  
group by category;
/* Ans : 
Classic	14888
Veggie	11649
Supreme	11987
Chicken	11050 */

-- Determine the distribution of orders by hour of the day.
select count(order_id) as orders , hour(time) as hours from orders 
group by hour(time)
order by hour(time) asc; 
/* Ans :
1	9
8	10
1231	11
2520	12
2455	13
1472	14
1468	15
1920	16
2336	17
2399	18
2009	19
1642	20
1198	21
663	22
28	23 */

-- Join relevant tables to find the category-wise distribution of pizzas.
select category, count(quantity) from pizza_types
join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by category;
/* Ans :
Classic	14579
Veggie	11449
Supreme	11777
Chicken	10815 */

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity), 0) as pizzas_ordered_perday from
(select orders.date, sum(order_details.quantity) as quantity from orders
join order_details
on orders.order_id = order_details.order_id
group by date) as total_quantity;
-- Ans : 138

-- Determine the top 3 most ordered pizza types based on revenue.
select name, sum(price*quantity) as revenue from pizzas
join pizza_types 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by name
order by revenue desc
limit 3;
/* Ans:
The Thai Chicken Pizza	43434.25
The Barbecue Chicken Pizza	42768
The California Chicken Pizza	41409.5 */

