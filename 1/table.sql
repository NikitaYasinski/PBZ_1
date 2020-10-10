CREATE TABLE teachers (
	TeacherId VARCHAR(4) PRIMARY KEY,
    LastName VARCHAR(20),
    Post VARCHAR(20),
    Chair VARCHAR(20),
    Specialty VARCHAR(30),
    HomeNumber INT
);

INSERT teachers(TeacherId, LastName, Post, Chair, Specialty, HomeNumber)
VALUES
('221Л', 'Фролов', 'Доцент', 'ЭВМ', 'АСОИ, ЭВМ', 487),
('222Л', 'Костин', 'Доцент', 'ЭВМ', 'ЭВМ', 543),
('225Л', 'Бойко', 'Профессор', 'АСУ', 'АСОИ, ЭВМ', 112),
('430Л', 'Глазов', 'Ассистент', 'ТФ', 'СД', 421),
('110Л', 'Петров', 'Ассистент', 'Экономики', 'Международная экономика', 324);

CREATE TABLE subjects (
	SubjectId VARCHAR(3) PRIMARY KEY,
    SubName VARCHAR(20),
    NumberOfHours INT,
    Specialty VARCHAR(30),
    Semester INT
);

INSERT subjects(SubjectId, SubName, NumberOfHours, Specialty, Semester)
VALUES
('12П', 'Мини ЭВМ', 36, 'ЭВМ', 1),
('14П', 'ПЭВМ', 72, 'ЭВМ', 2),
('17П', 'СУБД ПК', 48, 'АСОИ', 4),
('18П', 'ВКСС', 52, 'АСОИ', 6),
('34П', 'Физика', 30, 'СД', 6),
('22П', 'Аудит', 24, 'Бухучета', 3);

CREATE TABLE student_group (
	GroupId VARCHAR(3) PRIMARY KEY,
    GroupName VARCHAR(4),
    NumberOfPeople INT,
    Specialty VARCHAR(30),
    HeadmanLastName VARCHAR(20)
);

INSERT student_group(GroupId, GroupName, NumberOfPeople, Specialty, HeadmanLastName)
VALUES
('8Г', 'Э-12', 18, 'ЭВМ', 'Иванова'),
('7Г', 'Э-15', 22, 'ЭВМ', 'Сеткин'),
('4Г', 'АС-9', 24, 'АСОИ', 'Балабанов'),
('3Г', 'АС-8', 20, 'АСОИ', 'Чижов'),
('17Г', 'С-14', 29, 'СД', 'Амросов'),
('12Г', 'М-6', 16, 'Международная экономика', 'Трубин'),
('10Г', 'Б-4', 21, 'Бухучет', 'Зязюткин');

CREATE TABLE teacher_group (
	GroupId VARCHAR(3) REFERENCES student_group(GroupId),
    SubjectId VARCHAR(3) REFERENCES subjects(SubjectId),
    TeacherId VARCHAR(4) REFERENCES teachers(TeacherId),
    AudienceNumber INT
);

INSERT teacher_group(GroupId, SubjectId, TeacherId, AudienceNumber)
VALUES
('8Г', '12П', '222Л', 112),
('8Г', '14П', '221Л', 220),
('8Г', '17П', '222Л', 112),
('7Г', '14П', '221Л', 220),
('7Г', '17П', '222Л', 241),
('7Г', '18П', '225Л', 210),
('4Г', '12П', '222Л', 112),
('4Г', '18П', '225Л', 210),
('3Г', '12П', '222Л', 112),
('3Г', '17П', '221Л', 241),
('3Г', '18П', '225Л', 210),
('17Г', '12П', '222Л', 112),
('17Г', '22П', '110Л', 220),
('17Г', '34П', '430Л', 118),
('12Г', '12П', '222Л', 112),
('12Г', '22П', '110Л', 210),
('10Г', '12П', '222Л', 210),
('10Г', '22П', '110Л', 210);





    