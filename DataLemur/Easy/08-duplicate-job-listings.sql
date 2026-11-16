
-- Problem: Duplicate Job Listings
-- Link: https://datalemur.com/questions/duplicate-job-listings
-- Topic: CTEs, GROUP BY, HAVING, and DISTINCT
-- Pattern: Identify duplicate records using multi-column grouping
-- Approach: Group job listings by company_id, title, and description
--           to identify identical job postings. Use HAVING COUNT(job_id) > 1
--           to retain duplicate groups. Finally, count distinct company IDs
--           to determine how many companies have at least one duplicate
--           job listing.
-- Complexity: O(n) expected for hash aggregation, where n is the number
--              of job listings; actual performance depends on indexing
--              and database implementation.
-- What tripped me up: Counting duplicate job groups is different from
--                     counting companies with duplicate listings.
--                     A company may have multiple duplicate groups but
--                     should only be counted once.
-- What I learned: GROUP BY multiple columns identifies duplicate
--                 combinations, HAVING filters duplicate groups,
--                 and COUNT(DISTINCT ...) prevents counting a company
--                 more than once.

WITH count_job AS (
    SELECT 
        company_id,
        title,
        description,
        COUNT(job_id) AS job_count
    FROM job_listings
    GROUP BY company_id, title, description
    HAVING COUNT(job_id) > 1
)

SELECT 
    COUNT(DISTINCT company_id) AS duplicate_companies
FROM count_job;