CREATE TABLE
	auto_increment
	(
		id INT PRIMARY KEY AUTO_INCREMENT,
		`name` VARCHAR(20) NOT NULL
	);
	
-- 设置子增长初始值的技巧

-- 设置步长技巧
SHOW VARIABLES LIKE '%auto_increment%';

SET auto_increment_increment = 值;