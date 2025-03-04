SELECT
  manufacturer,
  COUNT(drug) AS drug_count,
  sum(abs(cogs-total_sales)) as total_loss
FROM pharmacy_sales
where cogs > total_sales
GROUP BY manufacturer
order by sum(abs(cogs-total_sales)) desc
