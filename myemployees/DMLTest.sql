USE
	myemployees;

Create table my_employees(
Id int(10),
First_name varchar(10),
Last_name varchar(10),
Userid varchar(10),
Salary double(10,2) )
create table users(
id int,
userid varchar(10),
department_id int
)

DESC
	my_employees;

INSERT INTO
	my_employees(id, first_name, last_name, userid, salary)
VALUES
	(1, 'patel', 'Ralph', 'Rpatel', 895),
	(2, 'Dancs', 'Betty', 'Bdancs', 860),
	(3, 'Biri', 'Ben', 'Bbiri', 1100),
	(4, 'Newman', 'Chad', 'Cnewman', 750),
	(5, 'Ropeburn', 'Audrey', 'Aropebur', 1550);

DESC
	users;

INSERT INTO
	users(id, userid, department_id)
VALUES
	(1, 'Rpatel', 10),
	(2, 'Bdancs', 10),
	(3, 'Bbiri', 20),
	(4, 'Cnewman', 30),
	(5, 'Aropebur', 40);
	
UPDATE
	my_employees
SET
	last_name = 'drelxer'
WHERE
	id = 3;
	
UPDATE
	my_employees
SET
	salary  = 1000
WHERE
	salary < 900;
	
DELETE 
	u, 
	m
FROM
	users u
	JOIN
		my_employees m
	ON
		u.userid = m.Userid
WHERE
	u.userid = 'Bbiri';
	
TRUNCATE TABLE
	users;

TRUNCATE TABLE
	my_employees;
	
SELECT
	*
FROM
	users;
	
SELECT
	*
FROM
	my_employees;
