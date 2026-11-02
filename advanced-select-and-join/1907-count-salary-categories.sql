-- Problem: 1907. Count Salary Categories
-- Link: https://leetcode.com/problems/count-salary-categories/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, UNION ALL
-- Pattern: Build a fixed set of output rows so empty groups still appear with a count of 0
-- Approach: Run one COUNT(*) query per salary category with its own WHERE range, then combine them with UNION ALL. COUNT(*) with no GROUP BY returns 0 on empty input.
-- Complexity: O(n) per branch, so O(3n) overall; depends on indexes and database implementation
-- What tripped me up: I tried to produce three categories from one SELECT with a tuple and put CASE and COUNT in WHERE, which isn't valid.
-- What I learned: WHERE filters rows and cannot hold aggregates. 

SELECT
    'Low Salary' AS category, 
    COUNT(*) AS accounts_count
FROM Accounts 
WHERE income < 20000

UNION ALL

SELECT 
    'Average Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts
WHERE income BETWEEN 20000 AND 50000

UNION ALL

SELECT 
    'High Salary' AS category,
    COUNT(*) AS accounts_count
FROM Accounts 
WHERE income > 50000;
