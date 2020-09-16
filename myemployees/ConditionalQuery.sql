-- 语法；
-- SELECT
--  查询列表
-- FROM
-- 	表名
-- WHERE
-- 	筛选条件
-- 
-- 筛选条件：
-- 	1.条件运算符：< > = <> <= >=
-- 	2.逻辑运算符：AND OR NOT
-- 	3.模糊查询：LIKE/BETWEEN AND/IN/IS NULL/IS NOT NULL

USE myemployees;
-- 条件运算符
#案例1：查询工资>12000的员工信息
SELECT
	*
FROM
	employees
WHERE
	salary > 12000;
	
#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT 
	last_name,
	department_id -- 这里不能加,
FROM
	employees
WHERE
	department_id<>90;
	
-- 逻辑运算符
#案例1：查询工资在10000到20000之间的员工名、工资以及奖金
SELECT
	last_name,
	salary,
	IFNULL(commission_pct, 0)
FROM
	employees
WHERE
	salary >= 10000
AND
	salary <= 20000
	
#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT
	*
FROM
	employees
WHERE
	department_id < 90
OR
	department_id > 110
OR
	salary >= 15000;

-- 模糊查询
-- LIKE
-- 特点：
-- ①一般和通配符搭配使用
-- 	通配符：
-- 	% 任意多个字符,包含0个字符
-- 	_ 任意单个字符

#案例1：查询员工名中包含字符a的员工信息
SELECT
	*
FROM
	employees
WHERE
	first_name LIKE '%a%';

#案例2：查询员工名中第三个字符为e，第五个字符为a的员工名和工资
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	last_name LIKE '__e_a%';

#案例3：查询员工名中第二个字符为_的员工名
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '_$_%'
ESCAPE
	'$';
	
#2.between and
/*
①使用between and 可以提高语句的简洁度
②包含临界值
③两个临界值不要调换顺序
*/

#案例1：查询员工编号在100到120之间的员工信息
SELECT *
FROM employees
WHERE employee_id BETWEEN 100 AND 120
ORDER BY employee_id DESC;


#3.in 判断是否在列表中
#特点：
#		列表中的类型必须兼容 
#		列表不支持通配符
#案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT last_name, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP', 'AD_PRES');

/* 语法错误
SELECT last_name, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP', LIKE'AD_%');
*/

#4、is null
/*
=或<>不能用于判断null值
is null或is not null 可以判断null值
*/
#案例1：查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;
#案例1：查询有奖金的员工名和奖金率
SELECT last_name, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

#安全等于  <=>

#案例1：查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct
FROM employees
WHERE commission_pct <=> NULL;
#案例2：查询工资为12000的员工信息
SELECT *
FROM employees
WHERE salary <=> 12000;
#is null pk <=>

-- IS NULL:仅仅可以判断NULL值，可读性较高，建议使用
-- <=>    :既可以判断NULL值，又可以判断普通的数值，可读性较低



-- 1. 查询工资大于 12000 的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE salary > 12000;
-- 2. 查询员工号为 176 的员工的姓名和部门号和年薪
SELECT 
	CONCAT(last_name, first_name),
	department_id,
	salary * 12 * (1 + IFNULL(commission_pct, 0)) 年薪
FROM employees
WHERE employee_id = 176;
-- 3. 选择工资不在 5000 到 12000 的员工的姓名和工资
SELECT CONCAT(last_name, first_name), salary
FROM employees
WHERE salary NOT BETWEEN 5000 AND 12000;

-- 4. 选择在 20 或 50 号部门工作的员工姓名和部门号
SELECT CONCAT(last_name, first_name), department_id
FROM employees
WHERE department_id in (20, 50);
-- 5. 选择公司中没有管理者的员工姓名及 job_id
SELECT last_name, job_id
FROM employees
WHERE manager_id IS NULL;
-- 6. 选择公司中有奖金的员工姓名，工资和奖金级别
SELECT CONCAT(last_name, first_name), salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;
-- 7. 选择员工名的第三个字母是 a 的员工名
SELECT last_name
FROM employees
WHERE last_name LIKE '__a%';
-- 8. 选择名中有字母 a 和 e 的员工名
SELECT last_name
FROM employees
WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%';
-- 9. 显示出表 employees 表中 first_name 以 'e'结尾的员工信息
SELECT *
FROM employees
WHERE first_name LIKE '%e';
-- 10. 显示出表 employees 部门编号在 80-100 之间 的姓名、职位
SELECT CONCAT(first_name, last_name), job_id
FROM employees
WHERE department_id BETWEEN 80 AND 100;
-- 11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位
SELECT CONCAT(first_name, last_name), job_id
FROM employees
WHERE manager_id IN (100, 101, 110);


-- 查询没有奖金，且工资小于18000的salary, last_name
SELECT salary, last_name
FROM employees
WHERE commission_pct IS NULL 
	AND salary < 18000;
-- 查询employees表中，job_id不为‘IT’或者工资为12000的员工信息
SELECT *
FROM employees
WHERE job_id <> 'IT' 
	OR salary = 12000;
-- 查看departments的表结构
DESC departments;
-- 查询部门departments表中涉及到了哪些位置编号
SELECT DISTINCT location_id
FROM departments;
-- ✨经典面试题：
-- SELECT * FROM employees;
-- SELECT * FROM employees WHERE commission_pct LIKE '%%' AND last_name LIKE '%%';
-- 和 SELECT * FROM employees WHERE 所有字段 LIKE '%%' 用OR连接
-- 结果是否一样？并说明原因

-- 2选出都不是NULL的员工信息