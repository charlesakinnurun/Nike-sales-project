SELECT region,AVG(profit) AS average_profit
from nike
GROUP BY region
ORDER BY average_profit ASC
LIMIT 1;