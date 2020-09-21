-- 1.单表
UPDATE
	表名
SET
	列名1 = 值1,
	...
WHERE
	筛选条件;
	
-- 2.多表[级联]
92:
UPDATE
	表1 别名1,
	表2 别名2
SET
	列1 = 值1,
	...
WHERE
	连接条件
	AND
		筛选条件;
99:
UPDATE
	表1 别名
	INNER|LEFT|RIGHT JOIN
		表2 别名
	ON
		连接条件
SET
	列1 = 值1,
	...
WHERE
	筛选条件;
-- -----------------------------

UPDATE
	beauty
SET
	phone = '13899888899'
WHERE
	`name` LIKE '唐%';
	

UPDATE
	boys
SET
	boyName = '张飞',
	userCP = 10
WHERE
	id = 2;
	