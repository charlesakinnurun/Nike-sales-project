SELECT 
    YEAR(Orderdate) AS year,
    MONTH(Orderdate) AS month,
    SUM(Revenue) AS total_revenue
FROM nike
GROUP BY YEAR(Orderdate), MONTH(Orderdate)
ORDER BY year, month;