SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount > 0 AND discount <= 0.25 THEN 'Low Discount (0-25%)'
        WHEN discount > 0.25 AND discount <= 0.50 THEN 'Medium Discount (25-50%)'
        WHEN discount > 0.50 AND discount <= 0.75 THEN 'High Discount (50-75%)'
        ELSE 'Very High Discount (>75%)'
    END AS discount_range,
    AVG(revenue) AS average_revenue,
    AVG(profit) AS average_profit,
    COUNT(*) AS number_of_orders
FROM nike
GROUP BY discount_range
ORDER BY
    CASE
        WHEN discount_range = 'No Discount' THEN 0
        WHEN discount_range = 'Low Discount (0-25%)' THEN 1
        WHEN discount_range = 'Medium Discount (25-50%)' THEN 2
        WHEN discount_range = 'High Discount (50-75%)' THEN 3
        ELSE 4
    END;