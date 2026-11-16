-- Problem: Unliked Pages
-- Link: https://datalemur.com/questions/sql-page-with-no-likes
-- Topic: LEFT JOIN and HAVING
-- Pattern: Find unmatched records using LEFT JOIN and NULL-aware aggregation
-- Approach: LEFT JOIN pages to page_likes using page_id.
--           Since LEFT JOIN preserves all pages, pages without matching
--           likes will have NULL values in the page_likes columns.
--           GROUP BY page_id and use HAVING COUNT(pl.page_id) = 0
--           to retain only pages with no likes.
-- Complexity: O(P + L) expected with suitable hash join and aggregation;
--              actual performance depends on indexes and database implementation.
-- What tripped me up: COUNT(*) would not work here because LEFT JOIN
--                     still produces one row for pages without likes.
--                     COUNT(pl.page_id) ignores NULL values.
-- What I learned: LEFT JOIN combined with COUNT(non_nullable_right_column)
--                 and HAVING = 0 is a useful pattern for finding records
--                 without matching records in another table.


SELECT
    p.page_id
FROM pages p
LEFT JOIN page_likes pl 
    ON p.page_id = pl.page_id
GROUP BY p.page_id 
HAVING COUNT(pl.page_id) = 0
ORDER BY p.page_id;