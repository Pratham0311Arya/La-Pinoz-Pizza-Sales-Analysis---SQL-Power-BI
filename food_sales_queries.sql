CREATE Database FoodProject;

USE FoodProject;

SELECT * FROM food_sales;

-- Q1 Finding total Revenue
SELECT SUM(total_price) as Revenue 
FROM food_sales;

-- Q2 Finding TotalPizzas Sold
SELECT SUM(Quantity) as TotalPizzaSold 
FROM food_sales;

-- Q3 Finding Total Number Of Orders
SELECT COUNT(DISTINCT Order_id) as PizzaTypes
FROM food_Sales;

-- Q4 Finding Average Order values
SELECT SUM(total_price)/COUNT(DISTINCT order_id)
FROM food_sales;

-- Q5 Finding Average Pizza Ordered/order
SELECT SUM(quantity)/COUNT(DISTINCT order_id)
FROM food_sales;


-- Q7 Finding Total Sales on each week days
SELECT DAYNAME(str_to_date(order_date,'%d-%m-%Y')) as weekdays,
SUM(total_price) from food_sales
GROUP BY weekdays;

-- Q7 Finding Total Orders on each week days
SELECT DAYNAME(str_to_date(order_Date,'%d-%m-%Y')) as weekdays,
COUNT(DISTINCT order_id) as TotalOrders
FROM food_sales
GROUP BY weekdays
ORDER BY TotalOrders DESC;


-- Q8 Finding Total Monthly Sales
SELECT MONTHNAME(str_to_date(order_Date,'%d-%m-%Y')) as Months,
SUM(total_price) from food_sales
GROUP BY Months;

-- Q9 Finding Total Monthly Orders
SELECT MONTHNAME(str_to_date(order_Date,'%d-%m-%Y')) as Months,
COUNT(DISTINCT order_id) as TotalOrders 
FROM food_sales
GROUP BY Months
ORDER BY TotalOrders DESC;

-- Q10 Finding percentage of sales by pizza category
SELECT pizza_category,ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM food_sales),2) as SalesPer
FROM food_sales
GROUP BY pizza_category;


-- Q11 Finding percentage of sales by pizza size
SELECT pizza_size,ROUND(SUM(total_price)*100/(SELECT SUM(total_price) FROM food_sales),2) as SalesPer
FROM food_sales
GROUP BY pizza_size;

-- Q12 Finding top 5 pizza by sales

SELECT pizza_name,SUM(total_price) as Sales
FROM food_sales
GROUP BY pizza_name
ORDER BY Sales DESC
LIMIT 5;

-- Q13 Finding top 5 pizza by orders
SELECT pizza_name,COUNT(DISTINCT order_id) as Orders
FROM food_sales
GROUP BY pizza_name
ORDER BY Orders DESC
LIMIT 5;

-- Q14 Finding bottom 5 pizza by orders
SELECT pizza_name,COUNT(DISTINCT order_id) as Orders
FROM food_sales
GROUP BY pizza_name
ORDER BY Orders
LIMIT 5;

-- Q15 Finding Bottom 5 pizza by sales

SELECT pizza_name,SUM(total_price) as Sales
FROM food_sales
GROUP BY pizza_name
ORDER BY Sales 
LIMIT 5;

-- Q16 Finding top 5 pizza by Quantity

SELECT pizza_name,SUM(Quantity) as Qty
FROM food_sales
GROUP BY pizza_name
ORDER BY Qty DESC
LIMIT 5;

-- Q17 Finding Bottom 5 pizza by Quantity

SELECT pizza_name,SUM(Quantity) as Qty
FROM food_sales
GROUP BY pizza_name
ORDER BY Qty 
LIMIT 5;

-- Q18 Finding Sales on Weekdays and Weekends

SELECT 
    CASE 
        WHEN DAYOFWEEK(str_to_date(order_date,'%d-%m-%Y')) IN (1,7) THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,
ROUND(SUM(total_price),2) AS total_sales
FROM food_sales
GROUP BY day_type;
