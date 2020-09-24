# 批量插入
drop procedure if exists insert_into_admin;
create procedure insert_into_admin(in cnt int) begin
	declare i int default 0;
	
	while i < cnt do
		insert into admin(username, password)
		values(concat('Rose', i), '6666');
		
		set i = i + 1;
	end while;
end;

call insert_into_admin(100);

drop procedure if exists insert_into_admin_with_repeat;
create procedure insert_into_admin_with_repeat(in cnt int) begin
	declare i int default 0;
	
	a: repeat
		insert into admin(username, password)
		values(concat('Rose', i + 100), '6666');
	
		set i = i + 1;
	until i = 100 
	end repeat a;
end;

call insert_into_admin(100);

-- 1、已知表 stringcontent
-- 其中字段：
-- id 自增长
-- content varchar(20)
-- 向该表插入指定个数的，随机的字符串

drop table if exists stringcontent;
create table stringcontent(
	id int primary key auto_increment,
	content varchar(26)
);

drop procedure if exists insert_randstr_by;
create procedure insert_randstr_by(
	in cnt int) begin
	declare i int default 0;
	declare str varchar(26) default 'abcdefghijklmnopqrstuvwxyz';
	declare idx int;
	declare len int;
	
	while i < cnt do
		set idx = floor(rand() * 26 + 1);
		set len = floor(rand() * (26 - idx) + 1);
		
		insert into stringcontent(content)
		values(substr(str from idx for len));
	
		set i = i + 1;
	end while;
end;

call insert_randstr_by(3);