SELECT * 
FROM blinkit_grocery_data
LIMIT 20;

-- Product Types
SELECT DISTINCT(item_type) AS Unique_products
FROM blinkit_grocery_data;

-- Number of Outlet
SELECT DISTINCT(outlet_identifier) AS outlets_id
FROM blinkit_grocery_data;

-- Total Sales Generated
SELECT SUM(sales) AS total_sales
FROM blinkit_grocery_data;

-- Average Sales by Item Type
SELECT item_type, AVG(sales) AS avg_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_sales DESC;

-- Sales by Item Fat Content
SELECT item_fat_content, SUM(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY item_fat_content;

-- Sales Performance by Outlet Size
SELECT outlet_size, SUM(sales) AS total_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY outlet_size
ORDER BY total_sales DESC;

-- Average Rating by Outlet Type
SELECT outlet_type, AVG(rating) AS avg_rating
FROM blinkit_grocery_data
GROUP BY outlet_type
ORDER BY avg_rating DESC;

-- Impact of Item Visibility on Sales
SELECT item_visibility, AVG(sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY item_visibility
ORDER BY avg_sales DESC;

-- Which Outlet has the Higest Average Sales
SELECT outlet_identifier, Round(AVG(sales), 2) AS average_sales
FROM blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY average_sales DESC;

-- Which outlet location contribute the most to the overall sales
SELECT outlet_location, SUM(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_location
ORDER BY total_sales DESC;

-- Top 5 selling products
SELECT item_type, SUM(sales) AS sales_per_product
FROM blinkit_grocery_data 
GROUP BY item_type
ORDER BY sales_per_product DESC 
LIMIT 5; 

-- How does outlet age affect the sales
SELECT outlet_establishment_year, SUM(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY total_sales DESC;

-- Which item types have the highest average ratings, and how does that relate to sales
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