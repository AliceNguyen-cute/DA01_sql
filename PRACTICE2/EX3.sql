Bước 1: Tính lương trung bình thực tế
Lương trung bình thực tế được tính bằng cách lấy trung bình của cột SALARY.
  SELECT AVG(SALARY) 
FROM EMPLOYEES;
Bước 2: Loại bỏ số 0 khỏi mức lương của mỗi nhân viên
Dùng REPLACE(SALARY, '0', '') để xóa tất cả các số 0 trong lương.

Ví dụ:

5000 → 5
70200 → 72
890 → 89

AVG(REPLACE(Salary,'0',''))
/*
Enter your query here.
*/
SELECT CEIL(AVG(Salary)-AVG(REPLACE(Salary,'0',''))) FROM EMPLOYEES;
