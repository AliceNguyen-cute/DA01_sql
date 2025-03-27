-- BÀI 1:
with job_count_table as (select company_id,
title,
description,
count(job_id) as job_count
from job_listings
GROUP BY company_id, title, description
)
select count(distinct company_id) as duplicate_companies
from job_count_table 
where job_count > 1

with count_table as (select company_id, title, description, 
count(*) as count_company
from job_listings 
group by company_id, title, description 
)
select 
count(company_id) as duplicate_companies
from count_table 
where count_company > 1 

  
-- BÀI 2:
  
(SELECT CATEGORY, PRODUCT,
SUM (SPEND) AS TOTAL_SPEND
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
AND category = 'appliance'
GROUP BY CATEGORY, PRODUCT
order by TOTAL_SPEND desc
LIMIT 2
)
UNION all 

(SELECT CATEGORY, PRODUCT,
SUM (SPEND) AS TOTAL_SPEND
FROM product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
AND category = 'electronics'
GROUP BY CATEGORY, PRODUCT
order by TOTAL_SPEND desc
LIMIT 2
)

-- BÀI 3:
  
with count_call as (select 
policy_holder_id,
count(case_id)
from callers
group by policy_holder_id
)

select count (policy_holder_id)
from count_call 
 where count >=3

-- BÀI 4:
SELECT A.page_id FROM PAGES  A
LEFT JOIN page_likes B
ON A.page_id = B.page_id
WHERE B.page_id IS NULL
ORDER BY A.PAGE_ID ASC

-- BÀI 5:
