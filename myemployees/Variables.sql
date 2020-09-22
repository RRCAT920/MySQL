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
