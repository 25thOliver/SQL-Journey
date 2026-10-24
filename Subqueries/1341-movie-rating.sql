-- Problem: 1341. Movie Rating
-- Link: https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50
-- Topic: Aggregation, JOIN, UNION ALL, Sorting
-- Pattern: Top-1 per metric with ORDER BY + LIMIT 1, tie-break with a secondary sort key
-- Approach: Query 1 groups ratings by user and picks the user with the most ratings (ties by smaller name). Query 2 filters ratings to February 2020, groups by movie, and picks the highest average rating (ties by smaller title). Combine both with UNION ALL.
-- Complexity: O(n log n) for sorting grouped results; depends on indexes and database implementation
-- What tripped me up: ORDER BY and LIMIT inside a UNION branch must be wrapped in parentheses, or they apply to the whole union.
-- What I learned: Tie-breaking is just a second ORDER BY key. A half-open date range (>= start, < next start) is safer than BETWEEN for month filters.

(
    SELECT
        u.name AS results
    FROM Users u 
    JOIN MovieRating mr 
        ON u.user_id = mr.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)

UNION ALL

(
    SELECT
        m.title AS results
    FROM Movies m 
    JOIN MovieRating mr 
        ON m.movie_id = mr.movie_id
        WHERE mr.created_at >= "2020-02-01"
        AND mr.created_at < "2020-03-01"
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);