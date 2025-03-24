--SUBQUERY:
-- SELECT IN WHERE

--Tìm kiếm những hóa đơn lớn hơn trung bình của nó  

select  

payment_id  

from payment 

where amount > (select avg(amount) from payment) 
-- Tìm những hóa đơn có tên khách hàng là adam  

SELECT * FROM PAYMENT WHERE CUSTOMER_ID = (select customer_id from customer where first_name = 'ADAM' ) 

 --LIST DANH SÁCH
SELECT * FROM PAYMENT 
WHERE CUSTOMER_ID in (select customer_id from customer)

--EXERCISE:
select film_id, title from film 
where length > (select avg(length) from film)

--
select film_id, title from film
where film_id in
(select film_id from inventory
where store_id = 2
group by film_id
having count(*) >=3)
--

select customer_id, first_name, last_name, email from customer
where customer_id IN (select customer_id from payment
group by customer_id
having sum(amount) > 100 )

-- SELECT IN FROM:
SELECT CUSTOMER_ID,
COUNT(PAYMENT_ID) FROM PAYMENT
GROUP BY CUSTOMER_ID 
HAVING COUNT(PAYMENT_ID) > 30

select * from (SELECT CUSTOMER_ID,
COUNT(PAYMENT_ID) as so_luong FROM PAYMENT
GROUP BY CUSTOMER_ID 
HAVING COUNT(PAYMENT_ID) > 30) AS new_table
where  so_luong > 30


select first_name,so_luong from (SELECT CUSTOMER_ID,
COUNT(PAYMENT_ID) as so_luong FROM PAYMENT
GROUP BY CUSTOMER_ID 
HAVING COUNT(PAYMENT_ID) > 30) AS new_table
inner join customer on new_table.CUSTOMER_ID =  customer.CUSTOMER_ID
where  so_luong > 30


--SUBQUERY IN SELECT:
-- TRUY VẤN CON PHẢI TRẢ RA MỘT GIÁ TRỊ THÌ SQL MỚI TRUY VẤN ĐƯỢC

SELECT PAYMENT_ID, 
AMOUNT, 
(SELECT MAX(AMOUNT) FROM PAYMENT AS MAX_AMOUNT),
(SELECT MAX(AMOUNT) FROM PAYMENT AS MAX_AMOUNT)- AMOUNT AS DIFF 
FROM PAYMENT
--CORRELATED SUBQUERY:
SELECT A.CUSTOMER_ID,
SUM(AMOUNT) AS SO_LUONG
FROM CUSTOMER AS A
INNER JOIN PAYMENT  AS B
ON A.CUSTOMER_ID = B.CUSTOMER_ID
GROUP BY A.CUSTOMER_ID
HAVING SUM (AMOUNT) >100
--cach 1;
SELECT * FROM CUSTOMER WHERE
CUSTOMER_ID IN (SELECT CUSTOMER_ID
FROM PAYMENT
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 100)
--cach 2:

SELECT * FROM CUSTOMER as a
WHERE
CUSTOMER_ID = (SELECT CUSTOMER_ID
FROM PAYMENT as b
where a.customer_id = b.customer_id
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 100)


-- exists chỉ dùng trog correlated subquery


SELECT * FROM CUSTOMER as a
WHERE
exists (SELECT CUSTOMER_ID -- thay customer_id = thành exists
FROM PAYMENT as b
where a.customer_id = b.customer_id
GROUP BY CUSTOMER_ID
HAVING SUM(AMOUNT) > 100)


--CORRELATED SUBUERY IN SELECT:
-- C1: group by bằng b.customer_id
select 
b.customer_id,
a.first_name || a.last_name,
b.payment_id,
(select MAX(amount) from payment
where customer_id = b.customer_id
group by customer_id)
from customer a
join payment as b 
on a.customer_id = b.customer_id
group by b.customer_id,
a.first_name || a.last_name,
b.payment_id
order by customer_id
-- C2: group by bằng a.customer_id
select 
a.customer_id,
a.first_name || a.last_name,
b.payment_id,
(select MAX(amount) from payment
where customer_id = a.customer_id
group by customer_id)
from customer a
join payment as b 
on a.customer_id = b.customer_id
group by a.customer_id,
a.first_name || a.last_name,
b.payment_id
order by customer_id
 
--EX1:
 -- C1: DÙNG FROM VÀ JOIN 
select *
from payment a
join 
(select customer_id,
count (*) as count_payment,
sum(amount) as sum_amount
from payment
group by customer_id) b
on a.customer_id = b.customer_id
 -- C2:
 
select a.*,
(select 
count(*)
from payment b
where a.customer_id = b.customer_id
group by customer_id),

(select 
sum(amount)
from payment c
where a.customer_id = c.customer_id
group by customer_id
)
from payment a

--EX2:

select film_id, title, rating, replacement_cost,
(select avg(replacement_cost)
from film a
where a.rating = b.rating
group by rating)
from film b
where replacement_cost =(
select max(replacement_cost) from film c
where b.rating = c.rating
group by rating )


----CTE:
WITH TOTAL_PAYMENT 
AS
(
select customer_id,
count(payment_id) as so_luong,
sum(amount) as so_tien
from payment
group by customer_id
),

AVG_RENTAL_TIME
AS 
(
SELECT CUSTOMER_ID,  AVG(RETURN_DATE - RENTAL_DATE) AS RENTAL_TIME FROM RENTAL
 GROUP BY CUSTOMER_ID
 )

SELECT a.customer_id, a.first_name,b.so_luong,b.so_tien,c.rental_time
from customer as a
join TOTAL_PAYMENT as b
on a.customer_id = b.customer_id
join AVG_RENTAL_TIME c
on  b.customer_id = c.customer_id
where b.so_luong >30

----
WITH sl AS (
    SELECT customer_id, 
	COUNT(payment_id) AS so_luong
    FROM payment
    GROUP BY customer_id
),
tb AS (
    SELECT customer_id, 
	AVG(amount) AS avg_amount
    FROM payment
    GROUP BY customer_id
)
SELECT 
    a.customer_id, 
    a.first_name, 
    b.so_luong, 
    c.avg_amount, 
    d.amount,
	d.payment_id
FROM customer AS a
JOIN sl AS b ON a.customer_id = b.customer_id
JOIN tb AS c ON a.customer_id = c.customer_id
JOIN payment d ON a.customer_id = d.customer_id
where d.amount > c.avg_amount







