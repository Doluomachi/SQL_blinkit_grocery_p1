SELECT COUNT(sales) AS total_sales
FROM blinkit_grocery_data;

-- how many products we have
SELECT DISTINCT(item_type) AS Unique_products
FROM blinkit_grocery_data;

-- how many unique outlet do we have
SELECT DISTINCT(outlet_identifier) AS outlets_id
FROM blinkit_grocery_data;

-- Data Anaysis(Business problems)
-- calculate total sales
SELECT SUM(sales) AS total_sales
FROM blinkit_grocery_data;

-- total sales on each product.
SELECT item_type AS products, SUM(sales) AS net_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY net_sales DESC;

-- which outlet has the higest average sales
SELECT outlet_identifier, Round(AVG(sales), 2) AS average_sales
FROM blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY average_sales DESC;

-- which outlet location contribute the most to the overall sales
SELECT outlet_location, sum(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_location
ORDER BY total_sales DESC;

-- how does outlet_size impact both toatl and average sales.
SELECT outlet_size, ROUND(AVG(sales),2) AS average_sales, SUM(sales) AS total_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY outlet_size;

-- top 5 highest selling products
SELECT item_type, SUM(sales) AS sales_per_product
FROM blinkit_grocery_data 
GROUP BY item_type
ORDER BY sales_per_product DESC 
LIMIT 5; 

-- which outlet has the higest average sales
SELECT outlet_identifier, Round(AVG(sales), 2) AS average_sales
FROM blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY average_sales DESC;

-- which outlet location contribute the most to the overall sales
SELECT outlet_location, sum(sales)
FROM blinkit_grocery_data
GROUP BY outlet_location;

-- how does outlet_size impact both toatl and average sales.
SELECT outlet_size, ROUND(AVG(sales),2) AS average_sales, SUM(sales) AS total_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY outlet_size;

-- top 5 highest selling products
SELECT item_type, SUM(sales) AS total_sales 
FROM blinkit_grocery_data 
GROUP BY item_type
ORDER BY total_sales DESC
LIMIT 5; 

-- which item types have the highest average ratings, and how does that relate to sales
SELECT item_type, ROUND(AVG(rating),2) AS avg_rating, SUM(sales) AS total_sales 
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_rating DESC; 

-- Are heavier item associated with higher or lower sales compared to lighter items?
SELECT 
    CASE 
        WHEN item_weight < 10 THEN 'Light'
        WHEN item_weight BETWEEN 10 AND 20 THEN 'Medium'
        ELSE 'Heavy'
    END AS weight_category,
    
    COUNT(item_identifier) AS total_items,
    ROUND(AVG(sales), 2) AS avg_sales
FROM blinkit_grocery_data
WHERE item_weight IS NOT NULL
GROUP BY weight_category
ORDER BY avg_sales DESC;

-- Average item weight by fat content
SELECT item_fat_content, ROUND(AVG(item_weight), 2) AS avg_weight
FROM blinkit_grocery_data
GROUP BY item_fat_content;

-- Top 5 item by visibility
SELECT item_identifier, item_type, item_visibility
FROM blinkit_grocery_data
ORDER BY item_visibility DESC;

-- Average sales by outlet establishment year.
SELECT outlet_establishment_year, AVG(sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY avg_sales DESC;
