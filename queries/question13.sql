SELECT size,SUM(unitssold) AS total_units_sold
FROM nike
GROUP BY size
ORDER BY total_units_sold DESC