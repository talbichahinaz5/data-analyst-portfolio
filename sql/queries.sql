-- Ventes et profit par catégorie
SELECT
  Category,
  ROUND(SUM(Sales), 2) AS total_sales,
  ROUND(SUM(Profit), 2) AS total_profit,
  ROUND(SUM(Profit) / NULLIF(SUM(Sales),0), 4) AS profit_margin
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;

-- Top 10 sous-catégories par profit
SELECT
  "Sub-Category" AS sub_category,
  ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_profit DESC
LIMIT 10;

-- Ventes mensuelles
SELECT
  substr("Order Date", 7, 4) || '-' || substr("Order Date", 4, 2) AS year_month,
  ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY year_month
ORDER BY year_month;
