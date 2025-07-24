SELECT productname,SUM(revenue) AS total_revenue
FROM nike
GROUP BY productname
ORDER BY total_revenue DESC
LIMIT 5;