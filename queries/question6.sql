SELECT productline,SUM(unitssold) AS total_units_sold
FROM nike
GROUP BY productline
ORDER BY total_units_sold DESC
LIMIT 1;