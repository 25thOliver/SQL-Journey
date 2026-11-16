
-- Problem: Laptop vs. Mobile Viewership
-- Link: https://datalemur.com/questions/laptop-mobile-viewership
-- Topic: Conditional Aggregation
-- Pattern: Aggregate multiple categories using SUM(CASE WHEN ...)
-- Approach: Use conditional aggregation to count viewership records.
--           The first CASE expression counts laptop views, while the
--           second counts both tablet and phone views as mobile views.
--           SUM adds the resulting 1s and 0s to produce the totals.
-- Complexity: O(n), where n is the number of rows scanned.
-- What tripped me up: Mobile viewership includes both tablets and phones,
--                     not just phones. Also, the requested alias differs
--                     slightly from the example output.
-- What I learned: CASE WHEN can categorize rows into different groups
--                 and SUM can aggregate multiple categories in one query.

SELECT 
    SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_reviews,
    SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;
