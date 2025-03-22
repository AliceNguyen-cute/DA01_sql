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




