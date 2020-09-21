USE student;
-- 一、查询每个专业的学生人数
SELECT 
	COUNT(*) 学生人数
FROM 
	student
GROUP BY 
	majorid;

-- 二、查询参加考试的学生中，每个学生的平均分、最高分
SELECT
	ROUND(AVG(score), 2) 平均分,
	MAX(score) 最高分
FROM
	result;

-- 三、查询姓张的每个学生的最低分大于60的学号、姓名
SELECT
	s.studentno 学号,
	studentname 姓名
FROM
	student s
JOIN
	result r
ON
	s.studentno = r.studentno
WHERE
 studentname LIKE '张%'
GROUP BY
	s.studentno
HAVING
	MIN(score) > 60;


-- 四、查询专业生日在“1988-1-1”后的学生姓名、专业名称
SELECT
	studentname
	majorname
FROM
	student s
JOIN
	major m
ON
	s.majorid = m.majorid
WHERE
	DATEDIFF(borndate, '1988-01-01') > 0;

-- 五、查询每个专业的男生人数和女生人数分别是多少 !
SELECT 
	COUNT(*)
FROM
 student
GROUP BY
	sex,
	majorid;

-- 六、查询专业和张翠山一样的学生的最低分 !
SELECT
	MIN(score)
FROM
	result
WHERE
	studentno IN
		(
			SELECT
				studentno
			FROM
				student
			WHERE
				studentname = '张翠山'
		);


-- 七、查询大于60分的学生的姓名、密码、专业名
SELECT
	studentname,
	loginpwd,
	majorname
FROM
	student s
JOIN
	major m
ON
	s.majorid = m.majorid
JOIN
	result r
ON
	s.studentno = r.studentno
WHERE
	score > 60;

-- 八、按邮箱位数分组，查询每组的学生个数
SELECT
	COUNT(*)
FROM
	student
GROUP BY
	LENGTH(email);

-- 九、查询学生名、专业名、分数
SELECT
	studentname,
	majorname,
	score
FROM
	student s
JOIN
	major m
ON
	s.majorid = m.majorid
JOIN
	result r
ON
	s.studentno = r.studentno;


-- 十、查询哪个专业没有学生
SELECT
	majorname
FROM
	major m
LEFT JOIN
	student s
ON
	m.majorid = s.majorid
WHERE
	s.studentno IS NULL;
	
-- 十一、查询没有成绩的学生人数
SELECT
	COUNT(*)
FROM
	student s
LEFT JOIN
	result r
ON
	s.studentno = r.studentno
WHERE
	r.id IS NULL;
