SELECT productname,AVG(unitssold) AS avg_units_sold
FROM nike
GROUP BY productname
ORDER BY avg_units_sold DESC;