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
	
-- 	测 试
-- 1. 查询工资最低的员工信息: last_name, salary
SELECT last_name, salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees);

-- 2. 查询平均工资最低的部门信息
SELECT *
FROM departments
WHERE department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary) 
	LIMIT 1);

-- 3. 查询平均工资最低的部门信息和该部门的平均工资
SELECT d.*, ag
FROM departments d
JOIN (
	SELECT AVG(salary) ag, department_id
	FROM employees
	GROUP BY department_id
	ORDER BY ag
	LIMIT 1) ag_dep
ON d.department_id = ag_dep.department_id;


-- 4. 查询平均工资最高的 job 信息
SELECT *
FROM jobs
WHERE job_id = (
	SELECT job_id
	FROM employees
	GROUP BY job_id
	ORDER BY AVG(salary) DESC
	LIMIT 1);

-- 5. 查询平均工资高于公司平均工资的部门有哪些?
SELECT department_name
FROM departments
WHERE department_id IN (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	HAVING AVG(salary) > (
		SELECT AVG(salary)
		FROM employees));

-- 6. 查询出公司中所有 manager 的详细信息.
SELECT *
FROM employees
WHERE employee_id IN (
	SELECT DISTINCT manager_id
	FROM employees);

-- 7. 各个部门中 最高工资中最低的那个部门的 最低工资是多少
SELECT MAX(salary) 最高工资
FROM employees
GROUP BY department_id
ORDER BY 最高工资
LIMIT 1;

-- 8. 查询平均工资最高的部门的 manager 的详细信息: last_name, department_id, email, salary
SELECT 
	last_name, 
	d.department_id, 
	email, 
	salary
FROM 
	employees e
JOIN 
	departments d
ON 
	e.employee_id = d.manager_id
WHERE 
	d.department_id = (
		SELECT
			department_id
		FROM 
			employees
		GROUP BY 
			department_id
		ORDER BY 
			AVG(salary) DESC
		LIMIT 
			1);