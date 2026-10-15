/*

Link: https://leetcode.com/problems/average-selling-price/submissions/2172941744/?envType=study-plan-v2&envId=top-sql-50

Topic:
JOINs, aggregation, date ranges, NULL handling

Pattern:
LEFT JOIN with a date-range condition + weighted average

Approach:
1. Match products between Prices and UnitsSold.
2. Match each sale to the price period containing its purchase date.
3. Calculate total revenue using price * units.
4. Divide total revenue by total units sold.
5. Return 0 when no units were sold and round to two decimals.

What tripped me up:
Matching each sale to the price valid on its purcase date

What I learned:
- A weighted average uses SUM(price * units) / SUM(units).
- BETWEEN includes both endpoints of a date range.
- LEFT JOIN preserves products without matching sales.
- IFNULL handles cases where the average is NULL.

Complexity:
Runtime depends on the join strategy, indexes, and data volume.
Aggregation processes the matched rows; exact time and space
complexity depend on the database execution plan.

*/

SELECT 
    product_id,
    ROUND(IFNULL(SUM(Prices.price * UnitsSold.units) / SUM(UnitsSold.units), 0), 2) AS average_price
FROM Prices
LEFT JOIN UnitsSold
    ON Prices.product_id = UnitsSold.product_id
    AND purchase_date BETWEEN Prices.start_date AND Prices.end_date 
GROUP BY Prices.product_id;