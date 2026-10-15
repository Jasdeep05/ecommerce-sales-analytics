
-- 1. OVERALL SALES SUMMARY
SELECT
    COUNT(*) AS total_orders,
    SUM("Order_Amount") AS total_revenue,
    SUM("Quantity") AS total_quantity_sold,
    AVG("Order_Amount") AS average_order_value,
    SUM("Profit_Amount") AS total_profit,
    AVG("Profit_Margin_Percent") AS average_profit_margin
FROM "ecommerce";


-- 2. TOP 10 PRODUCTS BY PROFIT

SELECT
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand",
    SUM("Quantity") AS quantity_sold,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit
FROM "ecommerce"
GROUP BY
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand"
ORDER BY total_profit DESC
LIMIT 10;


-- 3. TOP 10 PRODUCTS BY QUANTITY SOLD

SELECT
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand",
    SUM("Quantity") AS quantity_sold,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit
FROM "ecommerce"
GROUP BY
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand"
ORDER BY quantity_sold DESC
LIMIT 10;


-- 4. TOP 10 PRODUCTS BY PROFIT MARGIN

SELECT
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand",
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand"
HAVING SUM("Order_Amount") > 0
ORDER BY profit_margin_percent DESC
LIMIT 10;


-- 5. BOTTOM 10 PRODUCTS BY PROFIT MARGIN

SELECT
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand",
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY
    "Product_ID",
    "Product_Category",
    "Product_Subcategory",
    "Brand"
HAVING SUM("Order_Amount") > 0
ORDER BY profit_margin_percent ASC
LIMIT 10;


-- 6. REVENUE AND PROFIT BY PRODUCT CATEGORY

SELECT
    "Product_Category",
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY "Product_Category"
ORDER BY total_revenue DESC;


-- 7. DISCOUNT ANALYSIS

SELECT
    "Discount_Percent",
    COUNT(*) AS total_orders,
    SUM("Order_Amount") AS total_revenue,
    SUM("Discount_Amount") AS total_discount,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY "Discount_Percent"
ORDER BY "Discount_Percent";


-- 8. CUSTOMER SEGMENT ANALYSIS

SELECT
    "Customer_Segment",
    COUNT(DISTINCT "Customer_ID") AS unique_customers,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent,
    AVG("Order_Amount") AS average_order_value
FROM "ecommerce"
GROUP BY "Customer_Segment";


-- 9. WAREHOUSE REGION ANALYSIS

SELECT
    "Warehouse_Region",
    COUNT(*) AS total_orders,
    SUM("Quantity") AS quantity_sold,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY "Warehouse_Region"
ORDER BY total_profit DESC;


-- 10. PAYMENT METHOD ANALYSIS

SELECT
    "Payment_Method",
    COUNT(*) AS total_orders,
    SUM("Quantity") AS quantity_sold,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS profit_margin_percent
FROM "ecommerce"
GROUP BY "Payment_Method"
ORDER BY total_profit DESC;


-- 11. FINAL OVERALL BUSINESS SUMMARY

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT "Customer_ID") AS total_customers,
    SUM("Quantity") AS total_quantity_sold,
    SUM("Order_Amount") AS total_revenue,
    SUM("Profit_Amount") AS total_profit,
    ROUND(AVG("Order_Amount"), 2) AS average_order_value,
    ROUND(
        (SUM("Profit_Amount") /
        NULLIF(SUM("Order_Amount"), 0)) * 100,
        2
    ) AS overall_profit_margin
FROM "ecommerce";
