DROP TABLE IF EXISTS
	dept1;
CREATE TABLE
	dept1
	(
		id INT(7),
		`name` VARCHAR(25)
	);
	
CREATE TABLE
	dept2
SELECT
	*
FROM
	myemployees.departments;
	
DROP TABLE IF EXISTS
	emp5;
CREATE TABLE
	emp5
	(
		id INT(7),
		first_name VARCHAR(25),
		last_name varchar(25),
		dept_id int(7)
	);

ALTER TABLE
	emp5
MODIFY COLUMN
	last_name VARCHAR(50);
	
CREATE TABLE
	employees2
SELECT
	*
FROM
	myemployees.employees;
	
DROP TABLE IF EXISTS
	emp5;
	
ALTER TABLE
	employees2
RENAME TO
	emp5;
	
ALTER TABLE
	dept1
ADD COLUMN
	test_column VARCHAR(20);
	
DESC
 dept1;
 
ALTER TABLE
	emp5
DROP COLUMN
	dept_id;
	
🥇最佳实践
创建
DROP DATABASE|TABLE IF EXISTS
	库名｜表名;
CREATE DATABASE|TABLE ...;

删除
DROP DATABASE|TABLE IF EXISTS
	库名｜表名;
	