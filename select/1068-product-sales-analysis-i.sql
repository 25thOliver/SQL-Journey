/*
Link: https://leetcode.com/problems/product-sales-analysis-i/?envType=study-plan-v2&envId=top-sql-50

Topic: SELECT, JOIN
Pattern: LEFT JOIN with matching keys

Approach:
Return the product_name, year, and price for every sale.

    - Sales as the left table because each result corresponds to a sale.
    - LEFT JOIN to match each sale to its product.
    - Match the tables using Sales.product_id = Product.product_id.
    - Select product_name from Product and year price from Sales.

The join retrieves the product name asociated with each sale,
while preserving the sale's year and price.

Complexity:
Time: O(n) Actual performance depends on the database execution plan.
Space: O(n + m) for a typical hash join. 

What tripped me up:
Nothing, a problem I've had an encounter with.
 
 What I learned:
 Use JOIN to combine related information from multiple tables.
 Select each column from the table where that information is stored.

*/

SELECT Product.product_name, Sales.year, Sales.price
FROM Sales
LEFT JOIN Product ON Sales.product_id = Product.product_id;