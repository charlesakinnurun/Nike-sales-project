SELECT productline,AVG(mrp) AS avg_mrp
FROM nike
GROUP BY productline
ORDER BY avg_mrp DESC;