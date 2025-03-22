--EX1:
SELECT CONTINENT, FLOOR(AVG(C.Population)) FROM 
CITY C 
INNER JOIN COUNTRY CO 
ON C.CountryCode = CO.Code 
GROUP BY CONTINENT 

--EX2:

SELECT 
  ROUND(COUNT(texts.email_id)::DECIMAL
    /COUNT( emails.email_id),2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';  


--EX3:
-- CACH 1:
select 
age_bucket,
ROUND(100.0 *sum(time_spent) filter (where activity_type = 'send')/ sum(time_spent),2) AS send_perc,
ROUND(100.0 *sum(time_spent) filter (where activity_type = 'open')/ sum(time_spent),2) AS open_perc
from activities A
inner join age_breakdown B
on A.user_id = B.user_id
where activity_type in ('open', 'send')
group by age_bucket
--CACH 2:
WITH snaps_statistics AS (
  SELECT 
    age.age_bucket, 
    SUM(CASE WHEN activities.activity_type = 'send' 
      THEN activities.time_spent ELSE 0 END) AS send_timespent, 
    SUM(CASE WHEN activities.activity_type = 'open' 
      THEN activities.time_spent ELSE 0 END) AS open_timespent, 
    SUM(activities.time_spent) AS total_timespent 
  FROM activities
  INNER JOIN age_breakdown AS age 
    ON activities.user_id = age.user_id 
  WHERE activities.activity_type IN ('send', 'open') 
  GROUP BY age.age_bucket
) 

SELECT 
  age_bucket, 
  ROUND(100.0 * send_timespent / total_timespent, 2) AS send_perc, 
  ROUND(100.0 * open_timespent / total_timespent, 2) AS open_perc 
FROM snaps_statistics;


