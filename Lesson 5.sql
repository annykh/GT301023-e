-- Inner join 
 
 
--  create database hr;
 use hr;

-- Вывести имя, фамилию сотрудников и описание их должности(job_title).
select emp.first_name, emp.last_name, jb.job_title
from employees emp 
join jobs jb
on emp.job_id = jb.job_id;

-- Вывести имя, фамилию первых трех сотрудников из департамента 'IT'.
select emp.first_name, emp.last_name, dpt.department_name
from employees emp
join departments dpt
on emp.department_id = dpt.department_id
where dpt.department_name = 'IT'
limit 3;

-- Вывести имя, фамилию, должность и разницу между зарплатой и мин. зарплаты сотрудников, которые зарабатывают больше минимальной зарплаты для этой должности
select emp.first_name, emp.last_name, jb.job_title, emp.salary - jb.min_salary as salary_min
from employees emp
join jobs jb
on emp.job_id = jb.job_id
where emp.salary > jb.min_salary;

-- select * from employees;

-- OUTER JOIN


create database school;
use school;

create table students(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table teachers(
	id int primary key auto_increment,
    name varchar(128) not null,
    age int
);

create table competencies(
	id int primary key auto_increment,
    title varchar(128) not null
);

create table courses(
	id int primary key auto_increment,
    teacher_id int,
    title varchar(128) not null
);

create table students2courses(
	id int primary key auto_increment,
    student_id int,
    course_id int
);

create table teachers2competencies(
	id int primary key auto_increment,
    teacher_id int,
    competencies_id int
);

insert into Students (name, age)
values ('Анатолий', 29),
    ('Олег', 25),
    ('Семен', 27),
    ('Олеся', 28),
    ('Ольга', 31),
    ('Иван', 22);
    
insert into teachers (name, age) values ('Петр', 39);
insert into teachers (name, age) values ('Максим', 35);
insert into teachers (name, age) values ('Антон', 37);
insert into teachers (name, age) values ('Всеволод', 38);
insert into teachers (name, age) values ('Егор', 41);
insert into teachers (name, age) values ('Светлана', 32);

insert into Competencies (title) values ('Математика');
insert into Competencies (title) values ('Информатика');
insert into Competencies (title) values ('Программирование');
insert into Competencies (title) values ('Графика');

insert into Teachers2Competencies (teacher_id, competencies_id) values (1, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (2, 3);
insert into Teachers2Competencies (teacher_id, competencies_id) values (3, 2);
insert into Teachers2Competencies (teacher_id, competencies_id) values (4, 1);
insert into Teachers2Competencies (teacher_id, competencies_id) values (5, 3);

insert into courses (teacher_id, title) values (1, 'Алгебра логики');
insert into courses (teacher_id, title) values (2, 'Математическая статистика');
insert into courses (teacher_id, title) values (4, 'Высшая математика');
insert into courses (teacher_id, title) values (5, 'Javascript');
insert into courses (teacher_id, title) values (5, 'Базовый Python');

insert into students2courses (student_id, course_id) values (1, 1);
insert into students2courses (student_id, course_id) values (2, 1);
insert into students2courses (student_id, course_id) values (3, 2);
insert into students2courses (student_id, course_id) values (3, 3);
insert into students2courses (student_id, course_id) values (4, 5);

-- 1) Вывести имена студентов и курсы, которые они проходят
select std.name, crs.title
from students std
join students2courses s2c
on std.id = s2c.student_id
join courses crs
on s2c.course_id = crs.id;

-- 2) Вывести имена студентов и их курсов, если студенты не проходят курсы, то их тоже вывести
-- Все из students и общее между students и students2courses
select name, course_id
from students std
left join students2courses s2c
on std.id = s2c.student_id;

select name, course_id
from students2courses s2c
right join students std
on std.id = s2c.student_id;

-- Все из students2courses и общее между students и students2courses
select name, course_id
from students std
right join students2courses s2c
on std.id = s2c.student_id;

-- Общее между students и students2courses
select name, course_id
from students std
join students2courses s2c
on std.id = s2c.student_id;

-- 3) Найти имена студентов, которые не проходят ни один курс
select name
from students std
left join students2courses s2c
on std.id = s2c.student_id
where course_id is null;

-- 4) Найти курсы, которые не посещает ни один студент
select crs.title
from courses crs
left join students2courses s2c
on crs.id = s2c.course_id
where student_id is null;

select crs.title
from students2courses s2c
right join courses crs
on crs.id = s2c.course_id
where student_id is null;

-- 5) Вывести имена всех преподавателей с их компетенциями
select tch.name, cmp.title
from teachers tch
join teachers2competencies t2c
on tch.id = t2c.teacher_id
join competencies cmp
on t2c.competencies_id = cmp.id;

-- 6) Найти преподавателя, у которого нет компетенций
select name, teacher_id, competencies_id
from teachers tch
left join teachers2competencies t2c
on tch.id = t2c.teacher_id
where teacher_id is null;

-- 7) Найти компетенции, которых нет ни у одного преподавателя
select cmp.title, t2c.teacher_id, t2c.competencies_id
from competencies cmp
left join teachers2competencies t2c
on cmp.id = t2c.competencies_id
where teacher_id is null;

select cmp.title
from teachers2competencies t2c 
right join competencies cmp
on cmp.id = t2c.competencies_id
where competencies_id is null;

-- ДЛЯ ДЗ
create database oe;

