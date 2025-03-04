SELECT user_id,
DATE(max(post_date)) - DATE(min(post_date)) AS days_between

FROM posts
where post_date >= '2021-01-01' and post_date <'2022-01-01'
GROUP BY USER_ID
having count(post_id) >1
