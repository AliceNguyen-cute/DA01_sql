/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
*/
// CACH 1:
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%o'
OR CITY LIKE '%u'

//CACH 2:
SELECT DISTINCT CITY FROM STATION 
WHERE RIGHT (CITY,1) IN ('A', 'E', 'I', 'O', 'U');
/*

Cả IN và LIKE đều được dùng để lọc dữ liệu trong mệnh đề WHERE, nhưng chúng có cách sử dụng khác nhau:

Toán tử	Chức năng	Hoạt động với	Ví dụ
IN	
Kiểm tra nếu giá trị nằm trong danh sách các giá trị cụ thể	
Giá trị cố định	
WHERE country IN ('USA', 'Canada', 'Mexico')
LIKE	Kiểm tra nếu giá trị phù hợp với một mẫu có ký tự đại diện (%, _)	
Chuỗi có mẫu (pattern)	
WHERE name LIKE 'A%' (tên bắt đầu bằng 'A')
*/
Toán tử IN giúp kiểm tra nhiều giá trị cụ thể cùng lúc, thay vì phải viết nhiều điều kiện OR.


