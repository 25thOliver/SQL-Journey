/*
Link: https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50

Topic: SELECT, JOIN, GROUP BY, Aggregate Functions
Pattern: Self-join with conditional matching and AVG()

Approach:
Calculate the average processing time for each machine.

    - Join ACtivity to itself using machine_id and process_id.
    - Match the start row in one copy with the end row in the other.
    - Subtract the start timestamp from the end timestamp.
    - AVG() to calculate the average processing time per machine.
    - ROUND() to round the average to 3 decimal places.
    - GROUP BY machine_id to return one result per machine.

Complexity:
Time: O(n) on average with an efficient hash join, where n is
the number of rows in Activity.
Space: O(n) for a typical hash join, depending on the execution
plan and excluding the result set.  

What tripped me up:
The query did not pair start and end timestamps for each process
 or calculate their difference before avergaing on my first attempt.

 What I learned:
 Using a self-join to pair related rows, subtract timestamps to
 calculate durations, and use AVG() with GROUP BY to calculate 
 averages for each machine.

*/

SELECT a.machine_id,
    ROUND(AVG(b.timestamp - a.timesttamp), 3) AS processing_time
FROM Activity a 
JOIN ACtivity b
    ON a.machine_id = b.machine_id
    AND a.process_id = b.process_id
WHERE a.activity_type = 'start'
    AND b.activity_type = 'end'
GROUP BY a.machine_id;
