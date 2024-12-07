WITH cte AS (
    SELECT *,
           SUM(amount) OVER (PARTITION BY card_type ORDER BY CAST("date" AS DATE), CAST("index" AS VARCHAR(255))) AS total_spend
    FROM credit_transactions
)
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY card_type ORDER BY total_spend) AS rn
    FROM cte
    WHERE total_spend >= 1000000
) a
WHERE rn = 1;
