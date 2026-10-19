/*
Link: https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50
Topic: 
LEFT JOIN, conditional aggregation, GROUP BY

Pattern:
Convert each event into a numeric indicator using IF(),
then use AVG()  to calculate the proportion of successful events.

Approach:
- Start from Signups so every user is included.
- LEFT JOIN Confirmations using user_id
- Convert 'confirmed' to 1 and the other outcomes to 0.
- Average the values per user.
- Round the result to 2 decimal places.

What tripped me:
Figuring the use of conditional statement.

What I learned:
AVG() over 1/0 values calculates a sucess rate.
LEFT JOIN preserves users who have no matching confrmation records.
Use of conditional IF()

Complexity:
Let S be the number of rows in Signups and C the number
of rows in Confirmations. Runtime depends on the database
execution plan and indexes; the join and aggregation process
the input data. Exact complexity is database-dependent.

*/

SELECT 
    Signups.user_id,
    ROUND(AVG(IF(Confirmations.action = 'confirmed',1,0)), 2) AS confirmation_rate
FROM Signups
LEFT JOIN Confirmations
    ON Signups.user_id = Confirmations.user_id
GROUP BY Signups.user_id;