# Amazon Sales Analysis

## Project Overview

This project analyzes an Amazon sales dataset using Excel, SQL, and Tableau.

The objective is to understand sales performance, order behavior, product categories, fulfilment methods, cancellations, customer locations, product sizes, and other business-level patterns.

The project follows an end-to-end data analytics workflow:

**Data Cleaning → Excel Analysis → SQL Analysis → Tableau Dashboard → Business Insights**

---

## Tools Used

- Microsoft Excel
- SQL
- Tableau
- GitHub

---

## Dataset

The project uses an Amazon sales dataset containing order, product, fulfilment, sales, customer location, status, and transaction information.

Important fields include:

- Order ID
- Date
- Status
- Fulfilment
- Sales Channel
- Style
- SKU
- Category
- Size
- Amount
- Ship State
- Ship Country
- B2B

The original dataset contained missing values and an unnecessary `Unnamed` column, which was removed during data cleaning.

---

## Data Cleaning

The dataset was cleaned before analysis.

Main cleaning steps included:

- Removed the unnecessary `Unnamed` column
- Checked missing values
- Examined duplicate/order ID behavior
- Verified unique order count
- Checked categorical fields
- Investigated missing dates
- Prepared the cleaned dataset for SQL and Tableau analysis

---

## SQL Analysis

SQL was used to perform analytical queries including:

- Total number of records
- Unique orders
- Total sales
- Average sales amount
- Cancellation rate
- Sales by category
- Orders by category
- Category cancellation rate
- Fulfilment cancellation rate
- Average order amount by category
- B2B order and sales analysis
- Average order amount by state
- Category sales ranking
- Order status analysis
- Sales by size
- Sales by fulfilment
- Sales by state
- Orders by state
- Category and size analysis
- Category-size ranking
- Sales percentage analysis

The SQL queries are available in:

`sql/sql_queries.sql`

---

## Key Results

### Overall Performance

- Total Sales: **₹78,592,678.30**
- Unique Orders: **120,378**
- Average Order Value: **₹652.88**
- Cancellation Rate: **14.28%**

---

## Category Performance

The highest-selling categories were:

1. Set
2. kurta
3. Western Dress
4. Top
5. Ethnic Dress

The `Set` category generated the highest sales at approximately **₹39.2 million**.

---

## Fulfilment Performance

Amazon fulfilment generated significantly higher sales than Merchant fulfilment.

- Amazon: approximately **₹54.3 million**
- Merchant: approximately **₹24.3 million**

---

## Size Performance

The highest-selling sizes by total sales were:

1. M
2. L
3. XL
4. XXL
5. S

---

## Regional Performance

Maharashtra generated the highest sales among the states included in the analysis, followed by Karnataka and Telangana.

---

## Order Status

The largest order-status groups were:

- Shipped
- Shipped - Delivered to Buyer
- Cancelled
- Shipped - Returned to Seller
- Shipped - Picked Up

---

## Tableau Dashboard

The final Tableau dashboard is titled:

**Amazon Sales Performance Dashboard**

The dashboard presents:

- Total Sales
- Total Orders
- Average Order Value
- Cancellation Rate
- Sales by Category
- Sales by Fulfilment
- Sales by Size
- Top States by Sales
- Order Status
- Category × Size Analysis

---

## Dashboard Preview

![Amazon Sales Performance Dashboard](screenshots/dashboard.png)

---

## Project Structure

```text
amazon-sales-analysis/
│
├── data/
│   └── amazon_sales_cleaned.csv
│
├── excel/
│   └── amazon_sales_analysis.xlsx
│
├── sql/
│   └── sql_queries.sql
│
├── tableau/
│   └── amazon_sales_dashboard.twbx
│
├── screenshots/
│   └── dashboard.png
│
└── README.md


Author: Zain Ul Abideen