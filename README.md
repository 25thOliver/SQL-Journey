# SQL Practice LeetCode SQL 50

A public learning journal for practicing SQL interview questions. Each solution is documented with its problem link, topic, SQL pattern, approach, complexity considerations, and lessons learned. The goal is to build SQL problem-solving skills relevant to data engineering interviews and make progress easy to review.

## Study Plan

- Main resource: [LeetCode SQL 50](https://leetcode.com/studyplan/top-sql-50/)
- Language: MySQL

## Progress Tracker

Update the status as work progresses: `Not started` → `In progress` → `Solved` → `Reviewed`.

| Problem | Topic | Pattern / concepts | Status | Solution |
|---|---|---|---|---|
| [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/) | SELECT / Filtering | `WHERE`, `AND`, equality checks | Solved | [`1757-recyclable-and-low-fat-products.sql`](select/1757-recyclable-and-low-fat-products.sql) |
| [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/) | SELECT / NULL handling | `WHERE`, `OR`, `IS NULL` | Solved | [`584-find-customer-referee.sql`](select/584-find-customer-referee.sql) |
| [595. Big Countries](https://leetcode.com/problems/big-countries/) | SELECT / Filtering | `WHERE`, `OR`, `>=` | Solved | [`595-big-countries.sql`](select/595-big-countries.sql) |
| [1148. Article Views I](https://leetcode.com/problems/article-views-i/) | SELECT / Filtering | `DISTINCT`, `WHERE`, `ORDER BY` | Solved | [`1148-article-views-i.sql`](select/1148-article-views-i.sql) |
| [1683. Invalid Tweets](https://leetcode.com/problems/invalid-tweets/) | String functions / Filtering | `CHAR_LENGTH()`, `WHERE` | Solved | [`1683-invalid-tweets.sql`](select/1683-invalid-tweets.sql) |
| [1378. Replace Employee ID With The Unique Identifier](https://leetcode.com/problems/replace-employee-id-with-unique-identifier/) | JOIN | `LEFT JOIN`; preserve unmatched employees | Solved | [`1378-replace-employee-id-with-unique-identifier.sql`](select/1378-replace-employee-id-with-unique-identifier.sql) |
| [1068. Product Sales Analysis I](https://leetcode.com/problems/product-sales-analysis-i/) | JOIN | Join sales records to product details | Solved | [`1068-product-sales-analysis-i.sql`](select/1068-product-sales-analysis-i.sql) |
| [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/) | JOIN / Aggregation | `LEFT JOIN`, `GROUP BY`, `COUNT()` | Solved | [`1581-customer-who-visited-but-did-not-make-any-transactions.sql`](select/1581-customer-who-visited-but-did-not-make-any-transactions.sql) |
| [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/) | Self-join / Date functions | Compare records from consecutive dates | Solved | [`197-rising-temperature.sql`](select/197-rising-temperature.sql) |
| [1661. Average Time of Process per Machine](https://leetcode.com/problems/average-time-of-process-per-machine/) | Self-join / Aggregation | Match start/end records; `AVG()`, `ROUND()` | Solved | [`1661-average-time-of-process-per-machine.sql`](select/1661-average-time-of-process-per-machine.sql) |
| [577. Employee Bonus](https://leetcode.com/problems/employee-bonus/) | JOIN / NULL handling | `LEFT JOIN`, `WHERE`, missing bonuses | Solved | [`577-employee-bonus.sql`](select/577-employee-bonus.sql) |
| [1280. Students and Examinations](https://leetcode.com/problems/students-and-examinations/) | JOIN / Aggregation | `CROSS JOIN`, `LEFT JOIN`, `GROUP BY`, `COUNT()` | Solved | [`1280-students-and-examinations.sql`](select/1280-students-and-examinations.sql) |
| [570. Managers with at Least 5 Direct Reports](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/) | Aggregation / Subquery | `GROUP BY`, `HAVING`, subquery | Solved | [`570-managers-with-at-least-5-direct-reports.sql`](select/570-managers-with-at-least-5-direct.sql) |

## SQL Concepts Practiced

### Filtering and selecting
- Selecting only the required output columns.
- Filtering rows with `WHERE`.
- Combining conditions with `AND` and `OR`.
- Using comparison operators such as `>=`.
- Removing duplicates with `DISTINCT` and sorting with `ORDER BY`.

### NULL handling
- Checking missing values with `IS NULL` and `IS NOT NULL`.
- Understanding that comparisons such as `column != 2` do not match `NULL` values.

### Joins and row relationships
- `JOIN` and `LEFT JOIN`.
- Self-joins to compare rows in the same table.
- `CROSS JOIN` to generate combinations.
- Preserving unmatched records when the problem requires them.

### Aggregation
- `COUNT()` and `AVG()`.
- `GROUP BY` to aggregate rows.
- `HAVING` to filter groups based on aggregate results.

### String and date operations
- `CHAR_LENGTH()` for string-length checks.
- `DATEDIFF()` and comparisons between consecutive dates.

### Subqueries
- Using subqueries to identify qualifying values or IDs before returning results.

## Solution Documentation Standard

Every solution file should contain:

1. **Problem and link**: the LeetCode number, title, and URL.
2. **Topic and pattern**: the SQL concept being practiced.
3. **Approach**: explain why the query solves the problem.
4. **Complexity**: give a reasonable time/space discussion, noting that actual SQL performance depends on table size, indexes, database engine, and execution plan.
5. **What tripped me up**: record a real difficulty or edge case considered; do not invent a mistake.
6. **What I learned**: capture the reusable lesson.

Keep the SQL query below the comment header. Prefer clear, readable SQL over unnecessary complexity.
