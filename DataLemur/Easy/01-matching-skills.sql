
-- Problem: Matching Skills
-- Link: https://datalemur.com/questions/matching-skills
-- Topic: GROUP BY and HAVING
-- Pattern: Filter required values, group by candidate, and count matching records
-- Approach: Filter candidates to only Python, Tableau, and PostgreSQL using
--           WHERE IN. Group the remaining records by candidate_id and use
--           HAVING COUNT(skill) = 3 to retain candidates possessing all
--           three required skills.
-- Complexity: O(n) for filtering and aggregation, assuming hash aggregation;
--              actual performance depends on indexing and database implementation.
-- What tripped me up: Finding candidates with at least one required skill
--                     is not enough. They must possess all three.
-- What I learned: WHERE filters individual rows before grouping, while
--                 HAVING filters grouped results after aggregation.

SELECT
    candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;
