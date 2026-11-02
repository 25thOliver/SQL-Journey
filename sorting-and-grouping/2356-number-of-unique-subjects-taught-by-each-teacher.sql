-- Problem: 2356. Number of Unique Subjects Taught by Each Teacher
-- Link: https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, DISTINCT
-- Pattern: GROUP BY with COUNT(DISTINCT)
-- Approach: Group Teacher rows by teacher_id and compute COUNT(DISTINCT subject_id)
--           to count the number of unique subjects taught across different departments.
-- Complexity: O(n) scan and group aggregation; depends on indexes and database execution plan
-- What tripped me up: A teacher can teach the same subject across different departments (dept_id), so a plain COUNT(subject_id) overcounts; DISTINCT subject_id is essential.
-- What I learned: COUNT(DISTINCT col) handles multiple records per entity with overlapping attribute values cleanly within a GROUP BY.

SELECT
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
