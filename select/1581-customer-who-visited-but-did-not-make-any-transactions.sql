/* 
Link: https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50

Topic SELECT, JOIN, GROUP BY
Pattern: LEFT JOIN with IS NULL and aggregation

Approach:
Find customers who visisted the mall without making any transactions,
then count how many such visits each customer made.

    - Visits as the left table to keep all visits.
    - LEFT JOIN to match visits with their transactions.
    - WHERE Transactions.transaction_id IS NULL to keep only
        visits that have no matching transaction.
    - GROUP BY Visits.customer_id to group the visits by customer.
    - COUNT(Visits.visit_id) to count the qualifying visits for each customer.

A visit can have multiple transactions, but it should not count
as a no-transaction visit if even one transaction exists.

Complexity:
Time: O(n + m) on average with an efficient hash join, where n is
the number of Visits rows and m is the number of Transactions rows.
Actual performance depends on the database execution plan.
Space: O(n + m) for a typical hash join and grouping operation,
depending on the execution plan and excluding the result set.

What tripped me up:
Nothing

What I learned:
Use LEFT JOIN with IS NULL to find records without a match,
then GROUP BY and COUNT to summarize those records by category.

*/

SELECT Visits.visit_id, COUNT(Visits.visit_id) AS count_no_trans
FROM Visits
LEFT JOIN Transactions ON Visits.visit_id = Transactions.visit_id
WHERE Transactions.transaction_id IS NULL
GROUP BY Visits.customer_id;