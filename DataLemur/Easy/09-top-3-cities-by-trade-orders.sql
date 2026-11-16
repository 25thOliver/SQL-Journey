
-- Problem: Top 3 Cities by Completed Trade Orders
-- Link: https://datalemur.com/questions/completed-trades
-- Topic: INNER JOIN, Filtering, Aggregation, and LIMIT
-- Pattern: Join related tables, filter qualifying records, group, and rank
-- Approach: INNER JOIN users and trades using user_id to associate
--           each trade with the user's city. Filter for completed orders
--           using WHERE, group the results by city, and count the
--           completed orders. Finally, sort by total_orders in descending
--           order and return the top three cities.
-- Complexity: O(T + U) expected for a hash join and aggregation, followed
--              by O(C log C) sorting, where T is trades, U is users,
--              and C is the number of cities with completed orders.
-- What tripped me up: Using LEFT JOIN with a WHERE condition on the right
--                     table eliminates unmatched rows, effectively making
--                     it behave like an INNER JOIN.
-- What I learned: Use INNER JOIN when only matching records are needed.
--                 GROUP BY city calculates orders per city, while
--                 ORDER BY DESC and LIMIT retrieve the top three.

SELECT
    u.city,
    COUNT(t.order_id) AS total_orders
FROM users u 
INNER JOIN trades t 
    ON u.user_id = t.user_id
WHERE status = 'Completed'
GROUP BY u.city
ORDER BY total_orders DESC 
LIMIT 3;
