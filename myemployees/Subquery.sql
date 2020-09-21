#1.	查询和Zlotkey相同部门的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE department_id = (
	SELECT department_id
	FROM employees
	WHERE last_name = 'Zlotkey');

#2.查询工资比公司平均工资高的员工的员工号，姓名和工资。
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (
	SELECT AVG(salary)
	FROM employees);


#3.查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资

SELECT employee_id, last_name, salary
FROM employees e1
WHERE salary > (
	SELECT AVG(salary)
	FROM employees e2
	WHERE e1.department_id = e2.department_id
	GROUP BY department_id);
	

#4.	查询 和姓名中包含字母u的员工 在相同部门的员工的员工号和姓名
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE '%u%');

#5. 查询在部门的location_id为1700的部门工作的员工的员工号
SELECT employee_id
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id = 1700);

#6.查询管理者是King的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE manager_id IN (
	SELECT employee_id
	FROM employees
	WHERE last_name = 'K_ing');


#7.查询工资最高的员工的姓名，要求first_name和last_name显示为一列，列名为 姓.名
SELECT CONCAT(last_name, '.', first_name)
FROM employees
WHERE salary = (
	SELECT MAX(salary)
	FROM employees);
