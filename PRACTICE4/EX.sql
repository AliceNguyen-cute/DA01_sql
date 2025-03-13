--EX1:
SELECT 
  SUM(CASE WHEN device_type = 'laptop' then 1 else 0 end) as laptop_views,
  sum(CASE WHEN device_type IN ('tablet', 'phone') then 1 else 0 end) as mobile_views
from viewership;
--EX2:
SELECT X, Y, Z,
       CASE 
           WHEN X + Y > Z AND Y + Z > X AND X + Z > Y THEN 'Yes'
           ELSE 'No'
       END AS triangle
FROM TRIANGLE;
--EX3:
SELECT 
    ROUND(100.0 * COUNT(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 END) / COUNT(*), 1) 
    AS uncategorised_call_pct
FROM callers;
/*SELECT 
    ROUND(100.0 * COUNT(CASE WHEN call_category = 'n/a' OR call_category IS NULL THEN 1 END) / COUNT( call_category), 1) 
    AS uncategorised_call_pct 
FROM callers;
sai vì count ko lấy giá trị null

*/

