-- SELECT 查询列表
-- FROM 表名 [别名]
-- 连接类型 JOIN 表名 [别名]
-- ON 筛选条件

USE girls;
-- 外连接
-- 选择男朋友没在boys表的女生名
SELECT g.name
FROM beauty g
LEFT JOIN boys b
ON g.boyfriend_id = b.id
WHERE b.id IS NULL;

-- 查询哪个部门没有员工
SELECT department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

#一、查询编号>3的女神的男朋友信息，如果有则列出详细，如果没有，用null填充
USE girls;

SELECT b.id, boyName, userCP
FROM beauty g
LEFT JOIN boys b
ON g.boyfriend_id = b.id
WHERE g.id > 3;

#二、查询哪个城市没有部门
USE myemployees;

SELECT city
FROM locations l
LEFT JOIN departments d
ON l.location_id = d.location_id
WHERE d.department_id IS NULL;

#三、查询部门名为SAL或IT的员工信息
SELECT e.*
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE department_name IN ('SAL', 'IT');