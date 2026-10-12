/* 
Link: https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50


Topic: SELECT
Pattern: WHERE with CHAR_LENGTH() and comparison operator

Approach:
Returns the tweet IDs of tweets whose content contains more than
15 characters.

- CHAR_LENGTH(content) to count the characters in each tweet.
- WHERE clause to filter tweets with characters greater than 15.
- SELECT only tweet_id because that is the required output.

The condition uses > rather than >= becaue a tweet with exactly 
15 characters is invalid

Complexity:
Time Complexity: O(n) — Each of the (n) rows may need to be examined.
Space Complexity: O(1) auxiliary space, excluding the output.

What tripped me up:
CHAR_LENGTH() method since it's a new concept.

What I learned:
Use CHAR_LENGTH() to count characters in MYSQL.

*/

SELECT tweet_id 
FROM Tweets 
WHERE CHAR_LENGTH(content) > 15;
