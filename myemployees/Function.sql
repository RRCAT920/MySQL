#1.无参有返回
#案例：返回公司的员工个数
-- bin-log不能有无参函数
set global log_bin_trust_function_creators=TRUE;

DROP FUNCTION IF EXISTS count_;
CREATE FUNCTION count_() RETURNS INT BEGIN
	DECLARE res INT DEFAULT 0;
	
	SELECT COUNT(*) INTO res
	FROM employees;
	
	RETURN res;
END;

SELECT count_() 员工个数;
#2.有参有返回
#案例1：根据员工名，返回它的工资
DROP FUNCTION IF EXISTS get_salary;
CREATE FUNCTION get_salary(emp_name VARCHAR(20)) RETURNS DOUBLE BEGIN
-- 	DECLARE emp_salary DOUBLE DEFAULT 0.0;
	SET @emp_salary = 0.0;
	
	SELECT salary INTO @emp_salary
	FROM employees
	WHERE first_name = emp_name;
	
	RETURN @emp_salary;
END;

SELECT get_salary('Neena');

#案例2：根据部门名，返回该部门的平均工资

DROP FUNCTION IF EXISTS get_avg_salary_of;
CREATE FUNCTION get_avg_salary_of(
	department_name_ VARCHAR(3)) RETURNS DOUBLE BEGIN
	DECLARE avg_salary DOUBLE DEFAULT 0.0;
	
	SELECT AVG(salary) INTO avg_salary
	FROM employees e
	JOIN departments d ON e.department_id = d.department_id
	WHERE d.department_name = department_name_;
	
	RETURN avg_salary;
END;

SELECT get_avg_salary_of('Adm');
#三、查看函数

SHOW CREATE FUNCTION myf3;

#四、删除函数
DROP FUNCTION myf3;

-- 测 试 
-- 1、创建函数，实现传入两个 float，返回二者之和
DROP FUNCTION IF EXISTS float_sum;
CREATE FUNCTION float_sum(
	f1 FLOAT,
	f2 FLOAT) RETURNS FLOAT BEGIN
	RETURN f1 + f2;
END;

SELECT float_sum(1.1, 2.2);
-- 2、创建函数，实现传入工种名，返回该工种的员工人数

DROP FUNCTION IF EXISTS count_by;
CREATE FUNCTION count_by(job_name VARCHAR(35)) RETURNS INT BEGIN
	DECLARE cnt INT DEFAULT 0;
	
	SELECT COUNT(*) into cnt
	FROM employees e
	JOIN jobs j ON e.job_id = j.job_id
	where j.job_title = job_name;
	
	return cnt;
END;

select count_by('Programmer');
-- 3、创建函数，实现传入员工名，返回该员工的领导名

drop function if exists get_leader_of;
create function get_leader_of(
	emp_name varchar(20)) returns varchar(20) begin
	declare leader_name varchar(20) default '';
	
	select l.first_name into leader_name
	from employees e
	join employees l on e.manager_id = l.employee_id
	where e.first_name = emp_name;
	
	return leader_name;
end;

select get_leader_of('Steven');
