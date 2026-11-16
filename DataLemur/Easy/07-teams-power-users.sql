-- Problem: Teams Power Users
-- Link: https://datalemur.com/questions/teams-power-users
-- Topic: Date Filtering, Aggregation, Sorting, and LIMIT
-- Pattern: Filter a time period, aggregate by user, and retrieve top N results
-- Approach: Filter messages to August 2022 using a half-open date interval.
--           Group messages by sender_id and count the messages sent by
--           each user. Sort the aggregated results by message_count in
--           descending order and use LIMIT 2 to retrieve the top two users.
-- Complexity: O(n + u log u), where n is the number of filtered messages
--              and u is the number of distinct senders; actual performance
--              depends on indexing and database implementation.
-- What tripped me up: DATE_PART() accepts two arguments, not three.
--                     Also, 2022-08 is interpreted as arithmetic rather
--                     than a year-month date.
-- What I learned: Use half-open date intervals for timestamp filtering.
--                 ORDER BY DESC combined with LIMIT retrieves the
--                 highest-ranking records.

SELECT
    sender_id,
    COUNT(message_id) AS message_count
FROM messages 
WHERE sent_date >= '2022-08-01'
    AND sent_date < '2022-09-01'
GROUP BY sender_id
ORDER BY message_count DESC
LIMIT 2;