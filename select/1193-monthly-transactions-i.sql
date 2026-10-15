-- Link: https://leetcode.com/problems/monthly-transactions-i/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Date Functions, Conditional Aggregation
-- Pattern: GROUP BY multiple columns + conditional SUM
-- Approach: Format the transaction date as YYYY-MM, then aggregate
--           transaction counts and amounts by month and country.
-- Complexity: O(n) as a rough estimate, depending on the execution plan.
-- What tripped me up: Grouping by month alone combines different countries.
-- What I learned: GROUP BY must include every dimension requested in
--                 the result, here month and country.


SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(id) AS trans_count,
    COUNT(IF(state = 'approved', 1, 0)) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(IF(state = 'approve', amount, 0)) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
