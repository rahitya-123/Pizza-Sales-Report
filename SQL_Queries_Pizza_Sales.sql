select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales; 

select sum(total_price) / count(distinct order_id) as Average_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizza_Sold  from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select cast(cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_Pizzas_Per_Order from pizza_sales;

select DATENAME(DW,order_date) as order_day,count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(DW,order_date);

select DATENAME(MONTH,order_date) as Month_Name,count(distinct order_id) as total_orders from pizza_sales
group by DATENAME(MONTH,order_date) order by total_orders desc;

select pizza_category,sum(total_price) * 100 / (select sum(total_price) from pizza_sales 
where month(order_date)=1) 
as prcnt_total_sales
from pizza_sales where month(order_date)=1 group by pizza_category;

select pizza_size,cast(sum(total_price) * 100 / (select sum(total_price) from pizza_sales where 
datepart(quarter,order_date)=1) as decimal(10,2))
as prcnt_total_sales
from pizza_sales where datepart(quarter,order_date)=1 group by pizza_size;

select top 5 pizza_name,sum(total_price) as total_sales_of_each_pizza from pizza_sales 
group by pizza_name order by total_sales_of_each_pizza desc;

select top 5 pizza_name,sum(total_price) as total_sales_of_each_pizza from pizza_sales 
group by pizza_name order by total_sales_of_each_pizza asc;

select top 5 pizza_name,sum(quantity) as total_quantity_of_each_pizza from pizza_sales 
group by pizza_name order by total_quantity_of_each_pizza desc;

select top 5 pizza_name,sum(quantity) as total_quantity_of_each_pizza from pizza_sales 
group by pizza_name order by total_quantity_of_each_pizza asc;

select top 5 pizza_name,count(distinct order_id) as total_orders_of_each_pizza from pizza_sales 
group by pizza_name order by total_orders_of_each_pizza desc;