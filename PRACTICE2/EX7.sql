/*
the difference in the number
of issued cards between the month with the highest issuance cards 
and the lowest issuance = 
*/


SELECT 
  card_name, 
  MAX(issued_amount) - MIN(issued_amount) AS difference
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY difference DESC;
