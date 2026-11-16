
-- Problem: Unfinished Parts
-- Link: https://datalemur.com/questions/tesla-unfinished-parts
-- Topic: NULL Handling and Filtering
-- Pattern: Identify incomplete records using IS NULL
-- Approach: Select the part and assembly_step columns from parts_assembly.
--           Filter the records using WHERE finish_date IS NULL to return
--           only parts that have started assembly but have no recorded
--           completion date.
-- Complexity: O(n), where n is the number of rows scanned.
-- What tripped me up: Nothing complicated here. The important distinction
--                     is that NULL cannot be checked using = NULL.
-- What I learned: Use IS NULL to identify missing values and IS NOT NULL
--                 to identify values that have been recorded.

SELECT
    part,
    assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
