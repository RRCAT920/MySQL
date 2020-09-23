SHOW GLOBAL VARIABLES;

SHOW GLOBAL VARIABLES LIKE '%char%';

SELECT @@global.autocommit;

SET @@global.autocommit = 0;

SHOW VARIABLES;
SHOW SESSION VARIABLES;

SHOW VARIABLES LIKE '%char%';

SELECT @@autocommit;
SELECT @@session.autocommit;

SET autocommit = 1;
SET SESSION autocommit = 1;

SET @@autocommit = 0; 



-- 语法错误，只能赋值
-- SELECT last_name INTO @lname
-- FROM employees;
-- 
-- SELECT @lname;

CREATE PROCEDURE hello()
BEGIN
	SELECT * from employees;
END;

CREATE PROCEDURE say()
BEGIN
	SELECT * from employees;
END;

CALL hello();

USE girls;
CREATE PROCEDURE login(
	IN username VARCHAR(10), 
	IN password VARCHAR(10)) BEGIN
	DECLARE res INT DEFAULT 0;
	
	SELECT COUNT(*) INTO res
	FROM admin a
	WHERE a.username = username AND
		a.password = password;
		
	SELECT IF(res, '成功', '失败') 登录信息;
END;