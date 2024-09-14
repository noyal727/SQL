# Write your MySQL query statement below
WITH NoTransactions AS (
    SELECT v.visit_id, v.customer_id
    FROM Visits v
    LEFT JOIN Transactions t ON v.visit_id = t.visit_id
    WHERE t.transaction_id IS NULL
)
SELECT customer_id, COUNT(visit_id) AS count_no_trans
FROM NoTransactions
GROUP BY customer_id;

