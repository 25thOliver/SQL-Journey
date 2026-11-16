-- Problem: Tweets' Histogram
-- Link: https://datalemur.com/questions/sql-histogram-tweets
-- Topic: CTEs, GROUP BY, and Aggregate Functions
-- Pattern: Aggregate at one level, then aggregate the resulting groups
-- Approach: First, use a CTE to count the tweets posted by each user in 2022.
--           Next, group users by their individual tweet counts and count
--           how many users fall into each bucket.
-- Complexity: O(n) for scanning and aggregating tweet records, assuming
--              hash aggregation; actual performance depends on indexing
--              and database implementation.
-- What tripped me up: BETWEEN is inclusive of both boundary values.
--                     However, when filtering a timestamp using
--                     BETWEEN '2022-01-01' AND '2022-12-31',
--                     the upper boundary may be interpreted as
--                     '2022-12-31 00:00:00', excluding later tweets
--                     posted on December 31.
-- What I learned: For timestamp filtering over a complete calendar year,
--                 use a half-open interval (>= start date AND < next year)
--                 to include all timestamps within the intended period.

WITH total_tweets AS (
    SELECT
        user_id,
        COUNT(tweet_id) AS tweet_per_tweep
    FROM tweets
    WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31'
    GROUP BY user_id
)

SELECT
    tweet_per_tweep AS tweet_bucket,
    COUNT(user_id) AS users_num
FROM total_tweets
GROUP BY tweet_bucket;