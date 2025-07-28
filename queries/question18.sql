SELECT region,saleschannel,SUM(revenue) AS total_revenue
FROM nike
GROUP BY region, saleschannel
ORDER BY region, total_revenue DESC;