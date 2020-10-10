-- 1
SELECT * FROM teachers;

-- 2
SELECT * FROM student_group WHERE Specialty = 'ЭВМ';

-- 3
SELECT TeacherId, AudienceNumber FROM teacher_group WHERE SubjectId = '18П';

-- 4
SELECT DISTINCT subjects.SubjectId, subjects.SubName FROM subjects 
	INNER JOIN teacher_group ON subjects.SubjectId = teacher_group.SubjectId
	INNER JOIN teachers ON teacher_group.TeacherId = teachers.TeacherId
WHERE teachers.LastName = 'Костин';

-- 5
SELECT teacher_group.GroupId FROM teacher_group 
	INNER JOIN teachers ON teacher_group.TeacherId = teachers.TeacherId
WHERE teachers.LastName = 'Фролов';

-- 6
SELECT SubName FROM subjects
WHERE Specialty = 'АСОИ';

-- 7
SELECT TeacherId, LastName, Post, Chair, HomeNumber FROM teachers
WHERE LOCATE('АСОИ', Specialty) != 0;

-- 8
SELECT DISTINCT teachers.LastName FROM teachers
	INNER JOIN teacher_group ON teachers.TeacherId = teacher_group.TeacherId
WHERE teacher_group.AudienceNumber = "210";

-- 9
SELECT subjects.SubName, student_group.GroupName FROM teacher_group
	INNER JOIN subjects ON teacher_group.SubjectId = subjects.SubjectId
	INNER JOIN student_group ON teacher_group.GroupId = student_group.GroupId
WHERE teacher_group.AudienceNumber BETWEEN 100 AND 200;

-- 10
SELECT sg.GroupId, sg2.GroupId FROM student_group AS sg
	INNER JOIN student_group AS sg2 ON sg2.speciality = sg.speciality
WHERE sg2.id != sg.id AND sg.id < sg2.id;

-- 11
SELECT SUM(NumberOfPeople) FROM student_group
WHERE Specialty = "ЭВМ";

-- 12
SELECT DISTINCT teacher_group.TeacherId FROM teacher_group
	INNER JOIN student_group ON teacher_group.GroupId = student_group.GroupId
WHERE student_group.Specialty = "ЭВМ";

-- 13
SELECT teacher_group.SubjectId FROM teacher_group
GROUP BY teacher_group.SubjectId
HAVING COUNT(teacher_group.SubjectId) = (SELECT COUNT(*) FROM subjects);

-- 14
SELECT DISTINCT t.LastName FROM teachers AS t 
INNER JOIN teacher_group AS tg ON tg.TeacherId = t.TeacherId
WHERE tg.SubjectId IN (SELECT DISTINCT tg1.SubjectId FROM teacher_group AS tg1 
WHERE tg1.TeacherId = (SELECT DISTINCT tg2.TeacherId FROM teacher_group AS tg2
WHERE tg2.SubjectId = "14П")); 

-- 15
SELECT DISTINCT * FROM subjects AS s 
WHERE s.SubjectId NOT IN (SELECT DISTINCT tg.SubjectId FROM teacher_group AS tg
WHERE tg.TeacherId = "221Л"); 

-- 16
SELECT * FROM subjects AS s 
WHERE s.SubjectId NOT IN (SELECT tg.SubjectId FROM teacher_group AS tg 
WHERE tg.GroupId = (SELECT sg.GroupId FROM student_group AS sg 
WHERE sg.GroupName = "М-6"));

-- 17
SELECT DISTINCT t.* FROM teachers AS t
	INNER JOIN teacher_group AS tg ON t.TeacherId = tg.TeacherId
WHERE tg.GroupId IN ("3Г", "8Г") AND t.Post = "Доцент"; 

-- 18
SELECT tg.SubjectId, tg.TeacherId, tg.GroupId FROM teacher_group AS tg
	INNER JOIN teachers AS t ON tg.TeacherId = t.TeacherId
WHERE t.Chair = "ЭВМ" AND t.Specialty LIKE "%АСОИ%";

-- 19
SELECT DISTINCT tg.GroupId FROM teacher_group AS tg
	INNER JOIN teachers AS t ON tg.TeacherId = t.TeacherId
    INNER JOIN student_group AS sg ON tg.GroupId = sg.GroupId
WHERE t.Specialty LIKE CONCAT("%", sg.Specialty, "%");

-- 20
SELECT DISTINCT tg.TeacherId FROM teacher_group AS tg
	INNER JOIN teachers AS t ON tg.TeacherId = t.TeacherId
    INNER JOIN student_group AS sg ON tg.GroupId = sg.GroupId
WHERE t.Chair = "ЭВМ" AND t.Specialty LIKE CONCAT("%", sg.Specialty, "%");

-- 21
SELECT DISTINCT sg.Specialty FROM student_group AS sg
	INNER JOIN teacher_group AS tg ON sg.GroupId = tg.GroupId
    INNER JOIN teachers AS t ON tg.TeacherId = t.TeacherId
WHERE t.Chair = "АСУ";

-- 22
SELECT tg.SubjectId FROM teacher_group AS tg
	INNER JOIN student_group AS sg ON tg.GroupId = sg.GroupId
WHERE sg.GroupName = "АС-8";

-- 23
SELECT DISTINCT tg.GroupId FROM teacher_group AS tg 
WHERE tg.SubjectId IN (SELECT tg1.SubjectId FROM teacher_group AS tg1
	INNER JOIN student_group AS sg ON tg1.GroupId = sg.GroupId
WHERE sg.GroupName = "АС-8");

-- 24
SELECT DISTINCT tg.GroupId FROM teacher_group AS tg 
WHERE tg.SubjectId NOT IN (SELECT tg1.SubjectId FROM teacher_group AS tg1
	INNER JOIN student_group AS sg ON tg1.GroupId = sg.GroupId
WHERE sg.GroupName = "АС-8");

-- 25
SELECT tg.GroupId FROM teacher_group AS tg 
WHERE tg.SubjectId NOT IN (SELECT DISTINCT tg1.SubjectId from teacher_group AS tg1
WHERE tg1.TeacherId != "430Л");

-- 26
SELECT tg.TeacherId FROM teacher_group AS tg
	INNER JOIN student_group AS sg ON tg.GroupId = sg.GroupId
WHERE sg.GroupName = "Э-15" AND tg.TeacherId != (SELECT DISTINCT tg1.TeacherId FROM teacher_group AS tg1 
WHERE tg1.SubjectId = "12П"); 






