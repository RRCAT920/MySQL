-- 基础查询

-- 语法：
-- SELECT 查询列表
-- -- [FROM 表名;]
-- 特点:
-- 1.查询列表 [字段｜函数｜表达式｜常量值]

-- 🥇最佳实践：使用use命令
USE employees;

-- 查询表中的单个字段
SELECT
	last_name
FROM
	employees;
	
-- 查询表中多个字段
SELECT
	last_name,
	salary,
	email
FROM
	employees;
	
-- 查询表中所有字段
SELECT
	*
FROM
	employees;

-- 查询常量值
SELECT 100;
SELECT 'hello';

-- 查询表达式
SELECT 100 % 98;

-- 查询函数
SELECT VERSION();

-- 起别名

-- 使用AS
SELECT last_name AS 姓, salary AS 月薪, email AS 邮箱 FROM employees;

-- 使用空格
SELECT last_name 姓, salary 月薪, email 邮箱 FROM employees;

-- 特例
SELECT last_name "out put" FROM employees;

-- 去重

-- 查询员工表中涉及的所有部门编号
SELECT DISTINCT department_id FROM employees;

-- +号

-- 数值型相加 
SELECT 100 + 100;

-- 字符型转数值🌿或0 
SELECT '123' + 100;
SELECT '100' + '100';
SELECT 'hello' + 100;
SELECT 'hello' + '100';
SELECT 'hello' + 'world';
SELECT 1 + 2 + 'hello';
SELECT 'hello' + 'hello' + 'hello';

-- NULL 一定为 NULL 
SELECT NULL + 0;
SELECT NULL + NULL;
SELECT NULL + 'hello';
SELECT NULL + 'hello' + 1;

-- 拼接 
SELECT 
	CONCAT(last_name,first_name) 姓名 
FROM employees;

SELECT CONCAT(1,1,'hello');
SELECT CONCAT(NULL,NULL,NULL);

USE myemployees;
-- 1. 下面的语句是否可以执行成功 select last_name , job_id , salary as sal from employees;
SELECT
	last_name,
	job_id,
	salary AS sal
FROM
	employees;
	
-- 2. 下面的语句是否可以执行成功 select * from employees;
SELECT
	*
FROM
	employees;
	
-- 3. 找出下面语句中的错误
-- select employee_id , last_name，
-- 	salary * 12 “ANNUAL SALARY”
-- from employees;
SELECT
	employee_id,
	last_name,
	salary * 12 "ANNUAL SALARY"
FROM
	employees;
	
-- 4. 显示表 departments 的结构，并查询其中的全部数据
DESC departments;

SELECT
 *
FROM
	departments;
	
SELECT
	department_id 部门编号,
	department_name 部门名,
	manager_id 经理的员工编号,
	location_id 位置编号
FROM
	departments;
	
-- 5. 显示出表 employees 中的全部 job_id(不能重复)
SELECT
	DISTINCT job_id
FROM
	employees;

-- 6. 显示出表 employees 的last_name和first_name，各个列之间用逗号连接，列头显示成 OUT_PUT
SELECT
	CONCAT(IFNULL(last_name, 'no last name'), ',', IFNULL(first_name, 'no first name')) OUT_PUT
FROM
	employees;