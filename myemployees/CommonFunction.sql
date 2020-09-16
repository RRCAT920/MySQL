-- 语法： 函数名(参数列表)
-- 特点：
-- 	名称
-- 	功能
-- 分类
-- 	单行函数
-- 		字符函数
-- 			length 获取字节长度
-- 			substr
-- 			concat
-- 			instr
-- 			replace
-- 			
-- 			upper
-- 			lower
-- 			trim
-- 			ltrim
-- 			rtrim
-- 			lpad
-- 			rpad

#一、字符函数

#1.length 获取参数值的字节个数
SELECT LENGTH('lironrong') = LENGTH('李容蓉');

SHOW VARIABLES LIKE '%char%';

#2.concat 拼接字符串
SELECT CONCAT(last_name, '_', first_name) 姓名 FROM employees;

#3.upper、lower
SELECT UPPER('john');
SELECT LOWER('joHn');
#示例：将姓变大写，名变小写，然后拼接
SELECT CONCAT(UPPER(last_name), LOWER(first_name)) 姓名 FROM employees;

#4.substr、substring
注意：索引从1开始
#截取从指定索引处后面所有字符
SELECT SUBSTR('李莫愁爱上了陆展元', 4)  out_put;

#截取从指定索引处指定字符长度的字符
SELECT SUBSTR('李莫愁爱上了陆展元', 1, 3) out_put;


#案例：名中首字符大写，其他字符小写然后用_拼接，显示出来

SELECT CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_', LOWER(SUBSTR(last_name, 2))) 姓名
FROM employees;

#5.instr 返回子串第一次出现的索引，如果找不到返回0

SELECT INSTR('杨不殷六侠悔爱上了殷六侠','殷八侠') AS out_put;

#6.trim

SELECT LENGTH(TRIM('    张翠山    ')) AS out_put;

SELECT TRIM('aa' FROM 'aaaaaaaaa张aaaaaaaaaaaa翠山aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')  AS out_put;

#7.lpad 用指定的字符实现左填充指定长度

SELECT LPAD('殷素素',2,'*') AS out_put;

#8.rpad 用指定的字符实现右填充指定长度

SELECT RPAD('殷素素',12,'ab') AS out_put;


#9.replace 替换

SELECT REPLACE('周芷若周芷若周芷若周芷若张无忌爱上了周芷若','周芷若','赵敏') AS out_put;

#二、数学函数

#round 四舍五入
SELECT ROUND(-1.55);
SELECT ROUND(1.567,2);


#ceil 向上取整,返回>=该参数的最小整数

SELECT CEIL(-1.02);

#floor 向下取整，返回<=该参数的最大整数
SELECT FLOOR(-9.99);

#truncate 截断

SELECT TRUNCATE(1.69999,1);

#mod取余
/*
mod(a,b) ：  a - a / b * b

mod(-10,-3):-10- (-10)/(-3)*（-3）=-1
*/
SELECT MOD(10,-3);
SELECT 10%3;

#三、日期函数

#now 返回当前系统日期+时间
SELECT NOW();

#curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

#curtime 返回当前时间，不包含日期
SELECT CURTIME();


#可以获取指定的部分，年、月、日、小时、分钟、秒
SELECT YEAR(NOW()) 年;
SELECT YEAR('1998-1-1') 年;

SELECT  YEAR(hiredate) 年 FROM employees;

SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月;


#str_to_date 将字符通过指定的格式转换成日期

SELECT STR_TO_DATE('1998-3-2','%Y-%c-%d') AS out_put;

#查询入职日期为1992--4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';

SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');


#date_format 将日期转换成字符

SELECT DATE_FORMAT(NOW(),'%y年%m月%d日') AS out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
SELECT last_name,DATE_FORMAT(hiredate,'%m月/%d日 %y年') 入职日期
FROM employees
WHERE commission_pct IS NOT NULL;


#四、其他函数

SELECT VERSION();
SELECT DATABASE();
SELECT USER();


#五、流程控制函数
#1.if函数： if else 的效果

SELECT IF(10<5,'大','小');

SELECT last_name,commission_pct,IF(commission_pct IS NULL,'没奖金，呵呵','有奖金，嘻嘻') 备注
FROM employees;




#2.case函数的使用一： switch case 的效果

/*
java中
switch(变量或表达式){
	case 常量1：语句1;break;
	...
	default:语句n;break;


}

mysql中
*/
-- case [字段|表达式]
-- 	when 常量1 then 值1或语句1;
-- 	when 常量2 then 值2或语句2;
-- 	...
-- 	else 值n或语句n;
-- end


/*案例：查询员工的工资，要求

部门号=30，显示的工资为1.1倍
部门号=40，显示的工资为1.2倍
部门号=50，显示的工资为1.3倍
其他部门，显示的工资为原工资

*/

SELECT
	CASE department_id
		WHEN 30 THEN salary * 1.1
		WHEN 40 THEN salary * 1.2
		WHEN 50 THEN salary * 1.3
		ELSE salary
	END 新工资
FROM employees;


#3.case 函数的使用二：类似于 多重if
/*
java中：
if(条件1){
	语句1；
}else if(条件2){
	语句2；
}
...
else{
	语句n;
}

mysql中：
*/
-- case 
-- 	when 条件1 then 值1或语句1
-- 	when 条件2 then 值2或语句2
-- 	...
-- 	else 值n或语句n
-- end
-- 

#案例：查询员工的工资的情况
-- 如果工资>20000,显示A级别
-- 如果工资>15000,显示B级别
-- 如果工资>10000，显示C级别
-- 否则，显示D级别
SELECT
	CASE
		WHEN salary > 20000 THEN 'A'
		WHEN salary > 15000 THEN 'B'
		WHEN salary > 10000 THEN 'C'
		ELSE 'D'
	END 工资级别
FROM employees;

-- 1. 显示系统时间(注:日期+时间)
-- 2. 查询员工号，姓名，工资，以及工资提高百分之 20%后的结果(new salary)
-- 3. 将员工的姓名按首字母排序，并写出姓名的长度(length)
-- 4. 做一个查询，产生下面的结果
-- Dream Salary
-- <last_name> earns <salary> monthly but wants <salary*3>
-- 5. 使用 case-when，按照下面的条件: 
--      job grade 
--  AD_PRES A
--   ST_MAN B 
--  IT_PROG C
--   SA_REP D 
-- ST_CLERK E 
-- 产生下面的结果
-- Last_name
-- Job_id
-- Grade
-- 