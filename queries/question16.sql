SELECT region,SUM(profit) AS total_profit
FROM nike
GROUP BY region
ORDER BY total_profit DESC
LIMIT 1;