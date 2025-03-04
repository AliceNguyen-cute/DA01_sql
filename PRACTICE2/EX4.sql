Solution
Step 1: Calculate the weighted average of items per order
To calculate the weighted average of items per order, we multiply each item_count with the corresponding number of occurrences order_occurrences, calculate the sum using SUM(item_count * order_occurrences), and finally divide it by the total number of orders using SUM(order_occurrences).

SELECT 
  SUM(item_count*order_occurrences)
    /SUM(order_occurrences) AS mean
FROM items_per_order;
However, it's important to note that both item_count and order_occurrences are of integer type by default, 
  which means that division will return an integer result. 
  To ensure that the output is rounded to 1 decimal place, we can cast either column to a decimal type using ::DECIMAL or CAST(field AS decimal).

SELECT 
  SUM(item_count::DECIMAL*order_occurrences)
    /SUM(order_occurrences) AS mean
FROM items_per_order;
  
Step 2: Round results to 1 decimal place
To round the result to 1 decimal place, we can use the ROUND(__,1) function.

SELECT 
  ROUND(
    SUM(item_count::DECIMAL*order_occurrences)
    /SUM(order_occurrences)
  ,1) AS mean
FROM items_per_order;
