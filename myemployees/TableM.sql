CREATE TABLE
	表名
	(
		列名 类型[(长度)] [约束],
		...
	);

ALTER TABLE
	表名
{ADD|DROP|MODIFY|CHANGE COLUMN} | RENAME TO
	{列名 类型 [约束]}｜表名;

DROP TABLE
	表名;