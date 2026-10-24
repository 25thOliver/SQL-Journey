-- Problem: 196. Delete Duplicate Emails
-- Link: https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan-v2&envId=top-sql-50
-- Topic: DELETE, Self JOIN
-- Pattern: Self join a table to itself to find rows that have a "better" duplicate, then delete them
-- Approach: Join Person to itself on email and delete the row with the larger id whenever a row with the same email and a smaller id exists, so only the smallest id per email remains.
-- Complexity: O(n) expected with an index on email; without one, the self join can approach O(n^2)
-- What tripped me up: Nothing major.
-- What I learned: A self join with p1.id > p2.id targets every duplicate except the smallest id. 

DELETE 
    p1
FROM Person p1
JOIN Person p2 
    ON p1.email = p2.email
    AND p1.id > p2.id;