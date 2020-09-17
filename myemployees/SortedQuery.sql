-- SELECT 查询条件
-- FROM 表名
-- [WHERE 筛选条件]
-- ORDER BY 排序列表 [ASC|DESC];
-- 
-- 排序列表：
-- [字段｜表达式｜函数｜别名]
-- 可多级排序
-- 默认升序

#1、按单个字段排序
SELECT *
FROM employees
ORDER BY employee_id;

#2、添加筛选条件再排序
SELECT *
FROM employees
WHERE salary < 3000
ORDER BY employee_id;

#案例：查询部门编号>=90的员工信息，并按员工编号降序
SELECT *
FROM employees
WHERE department_id >= 90
ORDER BY employee_id;

#3、按表达式排序
#案例：查询员工信息 按年薪降序
SELECT *, salary * 12 * (1 + IFNULL(commission_pct, 0)) 年薪
FROM employees
ORDER BY salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC;

#4、按别名排序
#案例：查询员工信息 按年薪升序
SELECT *, salary * 12 * (1 + IFNULL(commission_pct, 0)) 年薪
FROM employees
ORDER BY 年薪;

#5、按函数排序
#案例：查询员工名，并且按名字的长度降序
SELECT last_name, LENGTH(last_name) 长度
FROM employees
ORDER BY 长度 DESC;
#6、多级排序

#案例：查询员工信息，要求先按工资降序，再按employee_id升序
SELECT *
FROM employees
ORDER BY salary DESC, employee_id;

-- 1. 查询员工的姓名和部门号和年薪，按年薪降序 按姓名升序
SELECT 
	last_name,
	department_id,
	salary * 12 * (1 + IFNULL(commission_pct, 0)) 年薪
FROM employees
ORDER BY 年薪 DESC, last_name;
	
-- 2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC;

-- 3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序
SELECT *
FROM employees
WHERE email LIKE '%e%'
ORDER BY LENGTH(email) DESC, department_id;

