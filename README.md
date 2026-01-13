# Blinkit Grocery Data Analysis Project
# Project overview

**Project Tittle**: Blinkit Grocery Data

**Level**: Beginner

This project focuses on analyzing Blinkit grocery sales data using SQL to gain insights into product performance, outlet characteristics, and sales trends. The aim of the project is to practice SQL querying skills while answering real-world business questions related to a grocery delivery platform.

## Objectives
- Total and average sales by item type and fat content.
- Identify top-performing outlet type.
- Sales comparison across different outlet size and location.
- Analysis of item visibility and its impact on sales.
- Outlet performance based on establishment year.

## Methodology
### 1. Data Collection
- The dataset was obtained fom an online source.
### 2. Data Cleaning (Excel)
- Corrected inconsistent values in the **Item Fat Content** colunm.
- Replaced missing values in the **Item Weight** colunm using median.
- created a database and table in SQL server.
-  Loaded the cleaned dataset into the SQL database for further analysis.

### 3. Exploratory Data Analysis(EDA)
- Analysed total sales and average sales.
- Identified top-performing outlets and product type.
### 4. Insights and Conclusions
- Summarized key findings from the analysis.
- Derived business insights based on sales and outlet performance.

## Tools 
- Excel (Data Cleaning/Preparation)
- SQL Server (Data Analysis)

## Data Analysis and Findings
The following SQL queries were developed for data exploration and answering specific business problems.

```sql
SELECT * 
FROM blinkit_grocery_data
LIMIT 20;
```
**Product Types**: Identify all unique products.
```sql
SELECT DISTINCT(item_type) AS Unique_products
FROM blinkit_grocery_data;
```
**Number of Outlet**: List out all unique outlet.
```sql
SELECT DISTINCT(outlet_identifier) AS outlets_id
FROM blinkit_grocery_data;
```
**1. What is the total sales generated?**
```sql
SELECT SUM(sales) AS total_sales
FROM blinkit_grocery_data;
```
**2. What is the average sales per product?**
```sql
SELECT item_type, AVG(sales) AS avg_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_sales DESC;
```
**3. Sales Performance by Outlet Size.**
```sql
SELECT outlet_size, SUM(sales) AS total_sales, COUNT(sales) AS total_orders
FROM blinkit_grocery_data
GROUP BY outlet_size;
```
**4. Average Rating by Outlet Type.**
```sql
SELECT outlet_type, AVG(rating) AS avg_rating
FROM blinkit_grocery_data
GROUP BY outlet_type
ORDER BY avg_rating DESC;
```
**5. What's the impact of Item Visibility on the Sales?**
```sql
SELECT item_visibility, AVG(sales) AS avg_sales
FROM blinkit_grocery_data
GROUP BY item_visibility
ORDER BY avg_sales DESC;
```
**6. Which Outlet has the Higest Average Sales?**
```sql
SELECT outlet_identifier, Round(AVG(sales), 2) AS average_sales
FROM blinkit_grocery_data
GROUP BY outlet_identifier
ORDER BY average_sales DESC;
```
**7. Which outlet location contribute the most to the overall sales?**
```sql
SELECT outlet_location, SUM(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_location
ORDER BY total_sales DESC;
```
**8. List the top 5 selling products.**
```sql
SELECT item_type, SUM(sales) AS sales_per_product
FROM blinkit_grocery_data 
GROUP BY item_type
ORDER BY sales_per_product DESC 
LIMIT 5;
```
**9. How does outlet age affect the sales?**
```sql
SELECT outlet_establishment_year, SUM(sales) AS total_sales
FROM blinkit_grocery_data
GROUP BY outlet_establishment_year
ORDER BY total_sales DESC;
```
**10. Which item types have the highest average ratings, and how does that relate to sales?**
```sql
SELECT item_type, ROUND(AVG(rating),2) AS avg_rating, SUM(sales) AS total_sales 
FROM blinkit_grocery_data
GROUP BY item_type
ORDER BY avg_rating DESC;
```
**11. Are heavier item associated with higher or lower sales compared to lighter items?**
```sql
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
```
## Key Insights
- Certain item types and low fat content categories generate higher sales.
- Medium and small outlets tend to perform better in terms of total sales.
- Outlet location and type play a significant role in sales performance.
- Items with better visibility often have higher sales.
- Outlet age doesn't strongly impact sales.

## Recommendation
- Stock more high-performing item types and low-fat content to further increase revenue.
- Focus expansion/marketing on medium and small outlets. Evaluate the larger outlets to understand why sales lag.
- Identify high-performing location and replicate startegy. Also evaluate the low-performing location and adapt/study the demographics demand.
- Since better visibility equals higher sales, place high-demand items in prominent positions and regularly rotate for visibility.
- Track rating and customer feedback to guide product decision.
- Focus less on outlet age and more on operational pratices, location, and item assortment. 

## Conclusion
This project helped strengthen foundational SQL skills while demonstrating how data analysis can be used to extract meaningful business insights from raw grocery sales data. The findings can support decision-making in areas such as inventory management, outlet planning, and product optimization.
