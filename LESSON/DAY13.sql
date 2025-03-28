-- CÁCH 1;
with number_of_clicks as (select app_id,
count(*) as no_of_clicks
from events 
where 
extract(year from timestamp) = 2022 
and event_type = 'click'
group by app_id)
,
number_of_impressions as (select app_id,
count(*) as no_of_impressions
from events 
where 
extract(year from timestamp) = 2022 
and event_type = 'impression'
group by app_id)

select b.app_id,
round (100.0* b.no_of_clicks/a.no_of_impressions,2) as ctr
from number_of_impressions a
left join number_of_clicks b
on a.app_id = b.app_id
--CÁCH 2:
select 
app_id,
ROUND( 100.0*sum(CASE when event_type = 'click' then 1 else 0 end )/
sum(CASE when event_type = 'impression' then 1 else 0 end),2) AS CTR


from events
where timestamp >= '2022-01-01' and timestamp <'2023-01-01'
group by app_id

-- CÁCH 3:
SELECT
  app_id,
  ROUND(100.0 *
    SUM(1) FILTER (WHERE event_type = 'click') /
    SUM(1) FILTER (WHERE event_type = 'impression'), 2) AS ctr_app
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;
