select gender,SUM(revenue) AS total_revenue
FROM nike
GROUP BY gender
ORDER BY total_revenue DESC
LIMIT 1;