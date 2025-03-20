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
SELECT 
  age.age_bucket, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
    SUM(activities.time_spent),2) AS send_perc, 
  ROUND(100.0 * 
    SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
    SUM(activities.time_spent),2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
