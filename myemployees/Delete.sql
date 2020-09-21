语法1:
单🌟
DELETE FROM
	表名
[WHERE
	筛选条件];

多
92:
DELETE
	别名1,
	别名2
FROM
	表1,
	表2
WHERE
	连接条件,
	AND
		筛选条件;
		
99:
DELETE
	别名x,
	...
FROM
	表1 别名1
	INNER|LEFT|RIGHT JOIN
	表2 别名2
WHERE
	筛选条件;
	
	
	
语法2:
TRUNCATE TABLE
	表名;
	
