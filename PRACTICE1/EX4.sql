/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:
*/

SELECT DISTINCT CITY  
FROM STATION  
WHERE CITY LIKE 'A%'  
   OR CITY LIKE 'E%'  
   OR CITY LIKE 'I%'  
   OR CITY LIKE 'O%'  
   OR CITY LIKE 'U%';
//cach 2:
SELECT DISTINCT CITY  
FROM STATION  
WHERE CITY REGEXP '^[AEIOUaeiou]';

Giải thích:
DISTINCT: Đảm bảo kết quả không có giá trị trùng lặp.
REGEXP '^[AEIOUaeiou]':
^: Xác định ký tự đầu tiên của chuỗi.
[AEIOUaeiou]: Chỉ chọn các từ bắt đầu bằng A, E, I, O, U (cả chữ hoa và chữ thường).
FROM STATION: Truy vấn từ bảng STATION.
