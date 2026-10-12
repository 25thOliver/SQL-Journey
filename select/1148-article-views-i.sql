/* 
Link: https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50

Topic: SELECT
Pattern: WHERE with column comparison, DISTINCT, ORDER BY

Approach:
Return the IDs of authors who viewed at least on of ther articles.

    - Compare author_id with viewer_id to identify self views
    - Apply DISTINCT to remove duplicate autor IDs
    - Use AS id to match the required output column name
    - ORDER BY id ASC to sort the results in ascending order

DISTINCT is essential because an author may view multiple or
have duplicate rows in the table.


Complexity:
Time: O(n log n) in a typical execution when sorting is required, 
where n is the number of rows in Views.
Space: O(n) worst case for storing distinct author IDs and
sorting, depending on the database execution plan.

What tripped me:
Elimination of duplicates by use of DISTINCT

What I learned:
To compare columns directly when identifying relationships between rows
, use of DISTINCT to eliminate duplicate results, and use of ORDER BY
to satisfy the required output order.

*/

SELECT DISTINCT author_id AS id
FROM Views 
WHERE author_id = viewer_id
ORDER BY id ASC;