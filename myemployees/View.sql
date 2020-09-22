CREATE VIEW emp_v1
AS
SELECT last_name, salary, email, phone_number
FROM employees;

SELECT last_name, salary, email
FROM emp_v1 
WHERE phone_number LIKE '011%';

CREATE OR REPLACE VIEW emp_v2
AS
SELECT MAX(salary) 最高工资, department_id
FROM employees
GROUP BY department_id;

SELECT d.*
FROM emp_v2 v
JOIN departments d ON v.department_id = d.department_id
WHERE 最高工资 > 12000;

CREATE VIEW 视图名
AS
查询语句

CREATE OR REPLACE 视图名
AS
查询语句

ALTER VIEW 视图名
AS
查询语句

DESC 视图名;

DROP TABLE IF EXISTS book_type;
CREATE TABLE book_type(
	id INT PRIMARY KEY,
	name VARCHAR(20) UNIQUE NOT NULL
);

DROP TABLE IF EXISTS book;
CREATE TABLE book(
	bid INT PRIMARY KEY,
	bname VARCHAR(20) UNIQUE NOT NULL,
	price DOUBLE DEFAULT 10,
	btype_id INT,
	FOREIGN KEY(btype_id) REFERENCES book_type(id)
);

SET autocommit = 0;
START TRANSACTION;
	INSERT INTO book
	VALUES(...)
COMMIT;

CREATE OR REPLACE VIEW book_v
AS
SELECT bname, name
FROM book b
JOIN book_type t ON b.btype_id = t.id
WHERE price > 100;

ALTER VIEW book_v
AS
SELECT bname, name
FROM book b
JOIN book_type t ON b.btype_id = t.id
WHERE price BETWEEN 90 AND 120;

DROP VIEW book_v;