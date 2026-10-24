-- Problem: 1527. Patients With a Condition
-- Link: https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Pattern Matching, LIKE, WHERE
-- Pattern: Match a prefix of a token inside a space-separated string
-- Approach: Keep rows where DIAB1 is at the start of the string (LIKE 'DIAB1%') or at the start of a later code (LIKE '% DIAB1%'), so it only matches as a prefix and never in the middle of a code.
-- Complexity: O(n * L) for n rows with strings of length L; LIKE with a leading wildcard cannot use an index
-- What tripped me up: My first submission used LIKE '%DIAB1%', which failed the test with SADIAB100 because DIAB1 appeared in the middle of a code.
-- What I learned: A leading % matches anywhere in the string. For a token prefix in a space-separated list, check the start of the string ('DIAB1%') and right after a space ('% DIAB1%').

SELECT
    patient_id,
    patient_name,
    conditions
FROM Patients
WHERE conditions LIKE 'DIAB1%'
    OR conditions LIKE '% DIAB1%';