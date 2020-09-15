SHOW DATABASES;

USE test;

SELECT DATABASE();

SHOW TABLES;

SHOW TABLES FROM mysql;

/*
	创建表
*/
CREATE TABLE test_table(
	id INT,
	name VARCHAR(20));
	
-- 查看表结构
DESC test_table;

# 版本
SELECT VERSION();