USE myemployees;

SELECT
	*
FROM
	employees e,
	jobs j
WHERE
	e.job_id = j.job_id;
	
-- 等值连接

-- 非等值连接
CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  int,
 highest_sal int);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

#将员工工资进行分级
SELECT
	salary,
	grade_level
FROM
	employees e,
	job_grades j
WHERE
	salary BETWEEN lowest_sal AND highest_sal
ORDER BY
	j.grade_level;

-- 自连接	
#查询员工名和员工的经理名
SELECT
	e1.last_name 员工名,
	e2.last_name 经理名
FROM
	employees e1,
	employees e2
WHERE
	e1.manager_id = e2.employee_id;
	
-- 测试
-- 1. 显示所有员工的姓名，部门号和部门名称。
SELECT
	last_name 名字,
	e.department_id 部门号,
	department_name 部门名称
FROM
	employees e,
	departments d
WHERE
	e.department_id = d.department_id;
	
-- 2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id 
SELECT
	job_id,
	location_id
FROM
	employees e,
	departments d
WHERE
	e.department_id = 90
	AND e.department_id = d.department_id;
	
-- 3. 选择所有有奖金的员工的last_name , department_name , location_id , city 
SELECT
	last_name,
	department_name,
	d.location_id,
	city
FROM
	employees e,
	departments d,
	locations l
WHERE
	commission_pct IS NOT NULL
	AND e.department_id = d.department_id
	AND d.location_id = l.location_id;
-- 4. 选择city在Toronto工作的员工的last_name , job_id , department_id , department_name
SELECT
	last_name,
	job_id,
	e.department_id,
	department_name
FROM
	employees e,
	departments d,
	locations l
WHERE
	e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND city = 'Toronto';
-- 5.查询每个工种、每个部门的部门名、工种名和最低工资
SELECT
	department_name,
	job_title,
	MIN(salary)
FROM
	departments d,
	jobs j,
	employees e
WHERE
	d.department_id = e.department_id
	AND j.job_id = e.job_id
GROUP BY
	department_name,
	job_title;

-- 6.查询每个国家下的部门个数大于 2 的国家编号 
SELECT
	country_id
FROM
	locations l,
	departments d
WHERE
	l.location_id = d.location_id
GROUP BY
	country_id
HAVING
	COUNT(*) > 2;
-- 7.选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格 式
-- employees	Emp# 	manager Mgr# 
-- kochhar 	101 	king 		100
SELECT
	e1.last_name employees,
	e1.employee_id "Emp#",
	e2.last_name manager,
	e2.employee_id "Mgr#"
FROM
	employees e1,
	employees e2
WHERE
	e1.manager_id = e2.employee_id;