/*
Problem: 1174. Immediate Food Delivery II
Link: https://leetcode.com/problems/immediate-food-delivery-ii/?envType=study-plan-v2&envId=top-sql-50
Difficulty: Medium
Topic: CTEs, JOINs, Aggregation
Pattern: Find the earliest row per customer, then join back

Approach:
Find each customer's first order, identify immediate orders,
and calculate their percentage.

What tripped me up:
Using MIN() independently on both dates can return values
from different rows.

What I learned:
Find the earliest order date first, then join back to retrieve
the preferred delivery date from that same order.

Complexity:
Depends on the database execution plan, indexes, and data size.
*/

WITH first_order AS(
    SELECT 
        customer_id,
        MIN(order_date) AS order_date
    FROM Delivery
    GROUP BY customer_id
)
SELECT
    ROUND(
        AVG(
            CASE 
                WHEN d.order_date = d.customer_pref_delivery_date
                THEN 1
                ELSE 0
            END
        ) * 100, 2
    ) AS immediate_percentage
FROM Delivery d 
JOIN first_order f 
    ON d.customer_id = f.customer_id
    AND d.order_date = f.order_date;