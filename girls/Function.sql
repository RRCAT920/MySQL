#1.无参有返回
#案例：返回公司的员工个数
CREATE FUNCTION count() RETURNS INT
	DECLARE res INT DEFAULT 0;
	
	SELECT COUNT(*) INTO res
	FROM 


#2.有参有返回
#案例1：根据员工名，返回它的工资


#案例2：根据部门名，返回该部门的平均工资


#三、查看函数


#四、删除函数


#测试
#一、创建函数，实现传入两个float，返回二者之和

