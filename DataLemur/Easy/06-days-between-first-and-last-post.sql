
-- Problem: User's First and Last Post
-- Link: https://datalemur.com/questions/sql-average-post-hiatus-1
-- Topic: Date Functions, Aggregation, and HAVING
-- Pattern: Calculate date boundaries using MIN() and MAX() after filtering
-- Approach: Filter posts to the year 2021 using a half-open date interval.
--           Group records by user_id, then calculate the difference between
--           the latest and earliest post dates using MAX() - MIN().
--           Use HAVING COUNT(post_id) >= 2 to retain users who posted
--           at least twice during the year.
-- Complexity: O(n) for scanning and aggregating records, assuming hash
--              aggregation; actual performance depends on indexes and
--              database implementation.
-- What tripped me up: Figuring out filtering by year using DATE_PART().
-- What I learned: PostgreSQL allows direct subtraction of DATE values
--                 to calculate the number of days between two dates.
--                 HAVING filters users after aggregation.

SELECT
    user_id,
    MAX(post_date::DATE) - MIN(post_date::DATE) AS days_between
FROM posts
WHERE DATE_PART('year', post_date::DATE) = 2021
GROUP By user_id
HAVING COUNT(post_id) >= 2
ORDER BY days_between;
