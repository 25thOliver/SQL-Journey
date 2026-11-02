-- Problem: 1141. User Activity for the Past 30 Days I
-- Link: https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, Date Filtering
-- Pattern: WHERE + GROUP BY + COUNT(DISTINCT)
-- Approach: Filter activity to the specified 30-day period, group by date, and count unique users per day.
-- Complexity: Depends on the execution plan and available indexes
-- What tripped me up: Understanding that active users are unique users per day, not total activity rows.
-- What I learned: COUNT(DISTINCT user_id) prevents multiple activities by the same user on one day from being counted more than once.

SELECT 
    activity_date AS day,
    COUNT(DISTINCT(user_id)) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;