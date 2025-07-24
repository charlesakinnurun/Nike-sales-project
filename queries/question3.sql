SELECT saleschannel,SUM(revenue) AS total_revenue
FROM nike
GROUP BY saleschannel
ORDER BY total_revenue DESC;