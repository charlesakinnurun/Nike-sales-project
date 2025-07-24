SELECT productline,SUM(profit) AS total_proft
FROM nike
GROUP BY productline
ORDER BY total_proft DESC;