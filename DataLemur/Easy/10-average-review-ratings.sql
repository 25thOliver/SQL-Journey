
-- Problem: Average Review Ratings
-- Link: https://datalemur.com/questions/sql-avg-review-ratings
-- Topic: Date Functions, GROUP BY, AVG, and ROUND
-- Pattern: Extract a date component and aggregate metrics across groups
-- Approach: Extract the numerical month from submit_date using EXTRACT().
--           Group the records by month and product_id so each product
--           has a separate average rating for every month.
--           Use AVG(stars) to calculate the average rating and ROUND()
--           to format the result to two decimal places.
-- Complexity: O(n) expected for scanning and aggregation, assuming
--              hash aggregation; actual performance depends on indexing
--              and database implementation.
-- What tripped me up: Grouping only by product_id would combine reviews
--                     from different months instead of calculating
--                     monthly averages.
-- What I learned: EXTRACT(MONTH FROM date) retrieves the numerical month.
--                 Grouping by multiple columns allows aggregation
--                 across combinations of dimensions.

SELECT
    EXTRACT(MONTH FROM submit_date) AS mth,
    product_id,
    ROUND(AVG(stars), 2) AS avg_stars
FROM reviews
GROUP BY mth, product_id
ORDER BY mth, product_id;
