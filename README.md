# E-Commerce Sales Dashboard

An interactive E-Commerce Sales Dashboard built using Power BI to analyze sales, profit, product performance, customer behavior, and payment methods.

## 📊 Project Overview

This project focuses on analyzing e-commerce sales data and presenting important business insights through an interactive Power BI dashboard.

The project uses two datasets, `Orders` and `Details`, which are connected using `Order ID`.

The analysis covers:

- Sales performance
- Profitability
- Product categories
- Product sub-categories
- Customer-wise sales
- Payment methods
- State-wise sales
- Monthly and quarterly performance

## 🎯 Objectives

- Analyze overall sales and profit performance
- Identify high-performing states
- Analyze quantity sold across product categories
- Understand monthly profit trends
- Analyze customer-wise sales
- Understand payment method preferences
- Identify profitable product sub-categories
- Compare quarterly sales performance

## 🛠️ Tools & Technologies

- Power BI
- Power Query
- DAX
- SQL
- PostgreSQL
- CSV
- Data Modeling
- Data Visualization

## 📂 Dataset

The project uses two datasets:

### Orders

Contains order-level information such as:

- Order ID
- Order Date
- Customer Name
- State

### Details

Contains transaction-level information such as:

- Order ID
- Amount
- Profit
- Quantity
- Category
- Sub-Category
- Payment Mode

The `Orders` and `Details` tables are connected using `Order ID`.

## 🔄 Project Workflow

```text
Orders.csv + Details.csv
          ↓
     Data Cleaning
          ↓
     Data Modeling
          ↓
      SQL Analysis
          ↓
     DAX Measures
          ↓
   Power BI Dashboard
          ↓
    Business Insights
