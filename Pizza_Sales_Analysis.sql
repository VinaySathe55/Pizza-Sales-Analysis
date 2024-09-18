SELECT * FROM pizza.sales;

# Total_Revenue #
SELECT SUM(total_price) AS Total_Revenue FROM pizza.sales;

# Average_Order_Value #
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value FROM pizza.sales;

# Total_Pizza_Sold #
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza.sales;

# Total_Orders #
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza.sales;

# Average_Pizza_Per_Order #
SELECT SUM(quantity) / COUNT(DISTINCT order_id) AS Avg_Pizza_Per_Order FROM pizza.sales;
  
# Daily_Trend_For_Total_Orders #
SELECT DAYNAME(order_date) AS Order_Day, COUNT(DISTINCT order_id) AS Total_orders FROM pizza.sales GROUP BY DAYNAME(order_date);


# Monthly_Trend_For_Total_Orders #
SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza.sales 
GROUP BY MONTHNAME(order_date) 
ORDER BY Total_Orders DESC;

# Percentage_Of_Sales_By_Pizza_Category #
SELECT 
    Pizza_Category, 
    SUM(total_price) AS Total_Sales, 
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza.sales WHERE MONTH(order_date) = 1) AS PCT
FROM 
    pizza.sales
WHERE 
    MONTH(order_date) = 1
GROUP BY 
    Pizza_Category;

# Percetage_Of_Sales_By_Pizza_Size #
SELECT 
    Pizza_Size, 
    SUM(total_price) AS Total_Sales, 
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza.sales) AS PCT
FROM 
    pizza.sales
GROUP BY 
    Pizza_Size
ORDER BY 
   PCT DESC;

# TOP_5_Pizzas_By_Revenue #
SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Revenue DESC 
LIMIT 5;

# Bottom_5_Pizzas_By_Revenue #
SELECT 
    pizza_name, 
    SUM(total_price) AS Total_Revenue 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Revenue ASC 
LIMIT 5;


#TOP_5_Pizzas_By_Quantity
SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Quantity 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Quantity DESC 
LIMIT 5;

#Bottom_5_Pizzas_By_Quantity
SELECT 
    pizza_name, 
    SUM(quantity) AS Total_Quantity 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Quantity ASC 
LIMIT 5;

#TOP_5_Pizzas_By_Orders
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Orders DESC 
LIMIT 5;

#Bottom_5_Pizzas_By_Orders
SELECT 
    pizza_name, 
    COUNT(DISTINCT order_id) AS Total_Orders 
FROM 
    pizza.sales 
GROUP BY 
    Pizza_Name 
ORDER BY 
    Total_Orders ASC 
LIMIT 5;