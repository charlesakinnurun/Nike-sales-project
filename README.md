# Introduction
![Nike](assets/Nike-Logo.jpg)
📊 Dive into the world of Nike's sales performance. This project explores the dynamics of various product sales, providing insights into MRP (Maximum Retail Price), Discount_Applied, Revenue, and Profit. It also examines how different factors like Gender_Category, Product_Line, Sales_Channel, and Region impact overall sales success and profitability.
***
🔍 SQL queries? Check them out [here](/queries/):
# Background
Driven by a quest to optimize Nike's sales strategies, this project was born from a desire to pinpoint top-performing products and product lines, identify key metrics impacting profitability, and streamline efforts to maximize revenue and profit. This analysis leverages comprehensive sales data to uncover actionable insights.
## Questions
1. What is the total Revenue generated from sales?
2. What is the average Profit per order?
3. Which Sales_Channel (retail or online) generates more Revenue?
4. What is the total Discount_Applied across all orders?
5. What is the trend of Revenue over time based on Order_Date (e.g., monthly or yearly)?
6. Which Product_Line is the most popular in terms of Units_Sold?
7. What are the top 5 Product_Name by Revenue?
8. What is the total Profit for each Product_Line?
9. What is the average MRP for products in each Product_Line?
10. How many unique Product_Name are there in the dataset?
11. What is the average Units_Sold for each Product_Name?
12. Which Gender_Category has the highest total Revenue?
13. What is the distribution of Units_Sold across different Sizes?
14. How does Discount_Applied affect Revenue and Profit?
15. Are there any Order_ID with negative Profit, and if so, what are their Product_Name and Sales_Channel?
16. Which Region has the highest total Profit?
17. Which Region has the lowest average Profit per order?
18. How does the Revenue vary across different Sales_Channel within each Region?
19. What is the average Units_Sold per Order_Date?
20. What is the total Revenue and Profit for each Gender_Category and Product_Line combination?
# Tools I Used
For my deep dive into the digital advertising strategies, I harnessed the power of several key tools:
- **SQL:** The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **MySQL:** The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code:** My go-to for database management and executing SQL queries.
- **Git & GitHub:** Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.
- **Numpy:** Essential for numerical and scientific computing. It's especially important in data analysis,data science and machine Learning.
- **Pandas:** Essential python library used for data manipulation, analysis, and cleaning.
# Database Creation
```sql
CREATE SCHEMA `nikesales` ;
```
# Table Creation
```sql
CREATE TABLE nike(
    id int,
    gender VARCHAR(255),
    productline VARCHAR(255),
    productname VARCHAR(255),
    size VARCHAR(255),
    unitssold INT,
    mrp DECIMAL(10, 2),
    discount DECIMAL(10, 2),
    revenue DECIMAL(10, 2),
    orderdate DATE,
    saleschannel VARCHAR(255),
    region VARCHAR(255),
    profit DECIMAL(10, 2),
    PRIMARY KEY (id)
)
```
# The Cleaning
```python
import pandas as pd
import numpy as np

# Load data
df = pd.read_csv(r'dataset/Nike_Sales_Uncleaned.csv')

# Standardize date formats
df['Order_Date'] = pd.to_datetime(df['Order_Date'], errors='coerce', dayfirst=False, infer_datetime_format=True)

# Remove duplicates
df = df.drop_duplicates()

# Convert numeric columns
num_cols = ['Units_Sold', 'MRP', 'Discount_Applied', 'Revenue', 'Profit']
for col in num_cols:
    df[col] = pd.to_numeric(df[col], errors='coerce')

# Remove rows with negative or zero Units_Sold (if not returns)
df = df[df['Units_Sold'].fillna(0) > 0]

# Drop rows with missing essential fields
df = df.dropna(subset=['Order_ID', 'Order_Date', 'Product_Name'])

# Fill missing numeric values with 0
df[num_cols] = df[num_cols].fillna(0)

# Standardize categorical columns
cat_cols = ['Gender_Category', 'Product_Line', 'Product_Name', 'Size', 'Sales_Channel', 'Region']
for col in cat_cols:
    df[col] = df[col].astype(str).str.lower().str.strip()
# Save cleaned data
df.to_csv(r'dataset/Nike_Sales_Cleaned.csv', index=False)
print("Data cleaned and saved to dataset/Nike_Sales_Cleaned.csv")
# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:
### 1.What is the total Revenue generated from sales?
```sql
SELECT SUM(revenue) AS total_revenue
FROM nike;
```
### 2. What is the average Profit per order?
```sql
SELECT AVG(profit) AS avg_profit_per_order
FROM nike;
```
### 3. Which Sales_Channel (retail or online) generates more Revenue?
```sql
SELECT saleschannel,SUM(revenue) AS total_revenue
FROM nike
GROUP BY saleschannel
ORDER BY total_revenue DESC;
```
The remaining queries are provided below.
[Queries](/queries/)
# What I Learned
Throughout this adventure, I've turbocharged my SQL toolkit with some serious firepower:
- **🧩 Complex Query Crafting:** Mastered the art of advanced SQL, aggregrating data like a pro and wielding WITH clauses for ninja-level temp table maneuvers.
- **📊 Data Aggregation:** Got cozy with GROUP BY and turned aggregate functions like COUNT() and AVG() into my data-summarizing sidekicks.
- **💡 Analytical Wizardry:** Leveled up my real-world puzzle-solving skills, turning questions into actionable, insightful SQL queries.
# Conclusions
This project, by analyzing the Nike sales data, has provided valuable insights into optimizing sales and product strategies. The findings from this analysis serve as a guide to prioritizing inventory, focusing sales efforts on Product_Lines, Sales_Channels, and Regions that yield the highest Revenue and Profit. Sales managers can better position their products in a competitive market by focusing on high-performing Product_Names, Gender_Categorys, and Sales_Channels that drive Units_Sold and overall Profit. This exploration highlights the importance of continuous data analysis and adaptation to emerging market trends to ensure maximum Revenue and Profit.
