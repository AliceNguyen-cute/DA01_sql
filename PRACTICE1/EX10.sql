+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

  
-- Write your PostgreSQL query statement below
SELECT NAME FROM CUSTOMER
WHERE REFEREE_ID IS NULL OR REFEREE_ID <> 2 
-- <> 2 không bao gồm NULL vì NULL không thể so sánh trực tiếp bằng toán tử = hoặc <>. 
-- <> 2 không bao gồm NULL vì NULL được xem là một giá trị không xác định (unknown), nên bất kỳ phép so sánh nào với NULL đều trả về UNKNOWN thay vì TRUE hoặc FALSE.
