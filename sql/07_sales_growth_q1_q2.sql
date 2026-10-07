-- 07 · Change in the number of sales between Q1 and Q2 2020
WITH quarters AS (
    SELECT
        COUNT(CASE WHEN date BETWEEN '2020-01-01' AND '2020-03-31' THEN 1 END) AS sales_q1,
        COUNT(CASE WHEN date BETWEEN '2020-04-01' AND '2020-06-30' THEN 1 END) AS sales_q2
    FROM ventes
)
SELECT sales_q1,
       sales_q2,
       ROUND((sales_q2 - sales_q1) * 100.0 / sales_q1, 2) AS growth_pct
FROM quarters;
