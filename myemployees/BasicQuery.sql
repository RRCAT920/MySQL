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