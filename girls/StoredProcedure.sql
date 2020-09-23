#一、创建存储过程实现传入用户名和密码，插入到admin表中
create procedure insert_into_admin(
	in username varchar(10),
	in password varchar(10)) begin
	insert into admin(username, password)
	values(username, password);
end;

call insert_into_admin('hello', 'world');
select * from admin;

#二、创建存储过程实现传入女神编号，返回女神名称和女神电话
create procedure return_name_phone(
	in _id int,
	out _name varchar(50),
	out _phone varchar(11)) begin
	select name, phone into _name, _phone
	from beauty
	where id = _id;
end;

call return_name_phone(1, @name, @phone);
select @name, @phone;
#三、创建存储存储过程或函数实现传入两个女神生日，返回天数差异
drop procedure if exists diff;
create procedure diff(
	in datetime1 datetime,
	in datetime2 datetime) begin
	
	select ABS(datediff(datetime1, datetime2)) 天数差异;
end;

call diff('1888-01-01', '1999-01-01');

#四、创建存储过程或函数实现传入一个日期，格式化成xx年xx月xx日并返回
CREATE PROCEDURE date_fmt(
	IN dtime datetime,
	OUT str VARCHAR(20)) BEGIN
	SELECT DATE_FORMAT(dtime, '%Y年%m月%d日') INTO str;
end;

CALL date_fmt('1999-01-01', @str);
SELECT @str;

#五、创建存储过程或函数实现传入女神名称，返回：女神 and 男神  格式的字符串
drop PROCEDURE if EXISTS make_str;
CREATE PROCEDURE make_str(
	IN girl_name VARCHAR(50),
	OUT res VARCHAR(50)) BEGIN
	SELECT CONCAT(g.`name`, ' and ', IFNULL(b.boyName, 'none')) into res
	FROM beauty g
	LEFT JOIN boys b ON g.boyfriend_id = b.id
	WHERE g.name = girl_name;
END;

CALL make_str('柳岩', @res);
SELECT @res;
CALL make_str('热巴', @res);
SELECT @res;

#六、创建存储过程或函数，根据传入的条目数和起始索引，查询beauty表的记录
DROP PROCEDURE IF EXISTS list;
CREATE PROCEDURE list(
	IN from_index INT,
	IN length INT) BEGIN
	SELECT * FROM beauty LIMIT from_index, length;
END;

CALL list(0, 5);