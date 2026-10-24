-- Problem: 1517. Find Users With Valid E-Mails
-- Link: https://leetcode.com/problems/find-users-with-valid-e-mails/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Regular Expressions, Pattern Matching
-- Pattern: Validate a string format with an anchored regex
-- Approach: Match the whole string with ^ and $: a letter first, then letters, digits, underscore, period or dash, then exactly @leetcode.com. Use the 'c' flag so the match is case-sensitive.
-- Complexity: O(n * L) for n rows with strings of length L; a regex cannot use an index
-- What tripped me up: MySQL regex matching is case-insensitive by default, so the lowercase-domain rule needs the 'c' flag (or BINARY). Dashes and dots inside brackets also need care.
-- What I learned: Anchor validation regexes with ^ and $, put - last inside [] so it is literal, and use [.] for a literal dot to avoid backslash escaping in MySQL strings.

SELECT
    user_id,
    name,
    mail
FROM Users
WHERE REGEXP_LIKE(mail, '^[A-Za-z][A-Za-z0-9_.-]*@leetcode[.]com$', 'c');