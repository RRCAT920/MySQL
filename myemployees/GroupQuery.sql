-- 语法
SELECT
	分组函数,
	(GROUP BY后的)列
FROM
	表名
[WHERE
	筛选条件]
GROUP BY
	分组列表
[HAVING
	筛选条件]
[ORDER BY
	子句];

# 查 询每个部门的平均工资
SELECT
	department_id,
	AVG(salary)
FROM
	employees
GROUP BY department_id;

# 案例1: 查询每个工种的最高工资
SELECT
	MAX(salary) 最高工资, 
	job_id 工种
FROM
	employees
GROUP BY
	job_id;
	
# 案例2: 查询每个位置上的部门个数
SELECT 
	COUNT(*) 部门个数,
	location_id
FROM
	departments
GROUP BY location_id;

#添加筛选条件
# 案例1: 查询邮箱中包含a字符的，每个部门的平均工资
SELECT
	AVG(salary),
	department_id 部门
FROM 
	employees
WHERE 
	email LIKE '%a%'
GROUP BY 
	department_id;
	
# 案例2：查询有奖金的每个领导手下的员工的最高工资
SELECT
	MAX(salary),
	manager_id
FROM
	employees
WHERE 
	commission_pct IS NOT NULL
GROUP BY
	manager_id;
	
#添加分组后筛选条件

# 查询哪个部门的员工个数大于2

SELECT
	department_id,
	COUNT(*) 员工个数
FROM
	employees
GROUP BY
	department_id
HAVING 员工个数 > 2;

# 查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
SELECT
	job_id,
	MAX(salary) 最高工资
FROM
	employees
WHERE
	commission_pct IS NOT NULL
GROUP BY
	job_id
HAVING 最高工资 > 12000;

# 查询领导编号大于102的每个领导的最低工资>5000的领导编号是哪个，以及最低工资
SELECT
	manager_id,
	MIN(salary) 最低工资
FROM
	employees
WHERE
	manager_id > 102
GROUP BY
	manager_id
HAVING 最低工资 > 5000;
-- 别名放入 GROUP BY/HAVING子句中 Oracle不支持， MySQL支持

SELECT
	COUNT(*),
	LENGTH(last_name) len_name,
	SUM(salary)
FROM
	employees
GROUP BY
	len_name;

#按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数>5的有哪些
SELECT
	COUNT(*),
	LENGTH(last_name)
FROM 
	employees
GROUP BY
	LENGTH(last_name)
HAVING
	COUNT(*) > 5;
	
#按多个字段分组

#查询每个部门每个工种的员工的平均工资
SELECT
	AVG(salary),
	department_id,
	job_id
FROM
	employees
GROUP BY
	department_id,
	job_id;
	
#案例：查询每个工种每个部门的平均工资,并按平均工资降序
SELECT 
	AVG(salary) 平均工资,
	job_id,
	department_id
FROM 
	employees
GROUP BY 
	job_id, department_id
ORDER BY
	平均工资;
	
#1.查询各job_id的员工工资的最大值，最小值，平均值，总和，并按job_id升序
SELECT
	MAX(salary),
	MIN(salary),
	AVG(salary),
	SUM(salary)
FROM
	employees
GROUP BY
	job_id
ORDER BY
	job_id;

#2.查询员工最高工资和最低工资的差距（DIFFERENCE）
SELECT
	MAX(salary) - MIN(salary) DIFFRENCE
FROM
	employees;

#3.查询各个管理者手下员工的最低工资，其中最低工资不能低于6000，没有管理者的员工不计算在内
SELECT
	manager_id,
	MIN(salary)
FROM
	employees
WHERE
	salary >= 6000
	AND manager_id IS NOT NULL
GROUP BY
	manager_id;

#4.查询所有部门的编号，员工数量和工资平均值,并按平均工资降序
SELECT
	department_id,
	COUNT(*),
	AVG(salary) 平均工资
FROM
	employees
GROUP BY
	department_id
ORDER BY
	平均工资;

#5.选择具有各个job_id的员工人数
SELECT
	job_id,
	COUNT(*)
FROM
	employees
GROUP BY
	job_id;
	