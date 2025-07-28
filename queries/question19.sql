SELECT orderdate,AVG(unitssold) AS average_units_sold
FROM nike
GROUP BY orderdate
ORDER BY orderdate;