# E-commerce Data Analytics Project

## Project Overview

This project focuses on analysing an e-commerce business using MySQL, Python (Pandas) and Power BI.

The objective is to analyse customer information, product performance, orders, revenue and customer purchasing behaviour to generate meaningful business insights.

## Tools & Technologies

- **MySQL** – Database management and SQL analysis
- **Python (Pandas)** – Data cleaning, data merging and analysis
- **Power BI** – Interactive dashboards and data visualization
- **Git & GitHub** – Version control and project management

## Dataset Description

The project uses four CSV datasets:

| Dataset | Description |
|---|---|
| customers.csv | Customer details and city |
| products.csv | Product names, categories and prices |
| orders.csv | Order dates and order status |
| order_details.csv | Products purchased and quantities |

## Database Relationships

- One customer can place multiple orders.
- One order can contain multiple products.
- One product can appear in multiple orders.
- Order Details connects Orders and Products.

## SQL Analysis (MySQL)

Created a database named `ecommerce_analysis` with four related tables.

### SQL Concepts Used

- SELECT and WHERE
- ORDER BY
- GROUP BY and HAVING
- Aggregate functions (COUNT, SUM, AVG)
- INNER JOIN
- Common Table Expressions (CTEs)
- Subqueries
- Window Functions (RANK and DENSE_RANK)

### SQL Analysis Performed

1. Retrieved customer records.
2. Filtered delivered orders.
3. Counted total orders.
4. Analysed customers by city.
5. Identified products costing more than ₹5,000.
6. Calculated revenue by customer.
7. Identified best-selling products.
8. Ranked products by revenue.
9. Ranked customers by spending.
10. Identified customers spending above average.

## Python Analysis (Pandas)

Used Python Pandas to perform data analysis.

### Tasks Performed

- Loaded all four CSV datasets.
- Checked missing values.
- Identified duplicate records.
- Analysed customer distribution by city.
- Analysed product price statistics.
- Merged product and order details.
- Calculated product revenue.
- Merged order status information.
- Filtered delivered orders.
- Calculated revenue by product.
- Exported analysis results into CSV files.

### Python Output Files

- `product_revenue_analysis.csv` – Revenue analysis for all order statuses.
- `delivered_product_revenue_analysis.csv` – Revenue analysis for delivered orders only.

## Power BI Dashboard

Created an interactive dashboard to analyse e-commerce performance.

### Key Performance Indicators (KPIs)

- Total Revenue
- Total Orders
- Total Customers
- Average Order Value

### Visualizations

- Product-wise revenue analysis.
- City-wise revenue analysis.
- Revenue trends by order date.
- Category-wise revenue distribution.
- Customer-wise revenue table.

### Dashboard Filters

- Order Date
- City
- Product Category
- Order Status

Revenue and order measures exclude cancelled orders. Total customer count includes all customers in the dataset.

## Key Business Findings

Based on the Python analysis:

| Metric | Result |
|---|---:|
| Total Customers | 5 |
| Chennai Customers | 3 |
| Bangalore Customers | 2 |
| Hyderabad Customers | 2 |
| Mumbai Customers | 1 |
| Average Product Price | ₹12,140 |
| Highest Revenue Product | Laptop |
| Laptop Revenue (All Orders) | ₹1,35,000 |
| Monitor Revenue (All Orders) | ₹48,000 |
| Total Revenue (All Orders) | ₹2,04,300 |
| Total Delivered Revenue | ₹2,02,800 |

### Business Insights

1. Laptop generated the highest product revenue.
2. Chennai had the highest number of customers.
3. Delivered revenue was ₹2,02,800.
4. Cancelled orders contributed to the difference between overall and delivered revenue.
5. Revenue analysis helps identify high-performing products.

## Project Folder Structure

```text
ecommerce-data-analytics/
│
├── dataset/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   └── order_details.csv
│
├── sql/
│   └── ecommerce_analysis.sql
│
├── python/
│   ├── ecommerce_analysis.py
│   ├── product_revenue_analysis.csv
│   └── delivered_product_revenue_analysis.csv
│
├── powerbi/
│   └── ecommerce_dashboard.pbix
│
└── README.md
```

## Conclusion

This project demonstrates practical data analytics skills using MySQL, Python and Power BI.

It covers database creation, SQL querying, data analysis, data merging, revenue calculations, data visualization and business insights.

The project helped develop practical knowledge of data analytics and business intelligence techniques.
