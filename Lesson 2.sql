-- comment ctrl+/
-- Запуск кода  ctrl+shift+enter

-- Создание базы данных 
 create database gt301023;
 
 -- Переключение бд
use gt301023;

-- Создание таблиц
-- create table table_name(
-- 	column_name1 type,
--     column_name2 type,
--     column_name3 type,
-- );

-- Простые типы данных 

-- int/integer - Целое число
-- numeric/decimal - Числовые данные
-- varchar(max) - Строка с максимальным кол/вом символов
-- char(fixed) - Строка с фиксированым кол/вом символов 

-- Ограничения(атрибуты)

-- NOT NULL - Значение в поле не может быть null
-- UNIQUE - Значение в поле должно быть уникальным
-- PRIMARY KEY - NOT NULL + UNIQUE
-- CHECK - Соответствует какому-либо условию
-- DEFAULT - по умолчанию
-- AUTO_INCREMENT/autoincrement позволяет создавать уникальный номер автоматически, когда новая 
-- запись вставляется в таблицу. Часто это поле основного ключа, которое мы хотели бы создать 
-- автоматически каждый раз, когда будет вставлена новая запись.


-- Создать таблицу students
-- id уникальное значение, не null, автозаполнение 
-- firstname varchar not null
-- lastname varchar not null
-- class integer от 1 до 10 (вкл)
-- subject varchar not null
-- mark integer от 0 до 5 (вкл)
-- school_no integer по умолч. 0

create table students(
	id int primary key auto_increment,
    firstname varchar(64) not null, 
    lastname varchar(100) not null,
    class int check(class between 1 and 10),
    subject varchar(64) not null,
    mark int check(mark between 0 and 5),
    school_no int default 0
);

select *
from students;

-- Заполнение таблицы
-- insert into table_name(column1, column2, ...)
-- values (value1, value2, ...);

insert into students (firstname, lastname, class, subject, mark, school_no)
values ('John', 'Smith', 5, 'Math', 4, 50);

insert into students (firstname, lastname, class, subject, mark, school_no)
values ('Bob', 'Brown', 6, 'Math', 3, 78),
	('Alex', 'Jameson', 7, 'Informatics', 5, 28);
    
 -- Ошибки 
 
-- insert into students
-- values ( 'John', 'Smith', 5, 'Math', 4, 50);
-- Column count doesn't match value count at row 1.

-- insert into students (firstname, lastname, class, subject, mark, school_no)
-- values (5, 'Math', 4, 'John', 'Smith', 7);
-- Error Code: 1366. Incorrect integer value: 'Smith' for column 'mark' at row 1	

-- insert into students (lastname, class, subject, mark, school_no)
-- values ('Smith', 5, 'Math', 4, 50);
-- Error Code: 1364. Field 'firstname' doesn't have a default value

-- insert into students (firstname, lastname, class, subject, mark, school_no)
-- values ('John', 'Smith', 15, 'Math', 4, 50);
-- Error Code: 3819. Check constraint 'students_chk_1' is violated.

-- insert into students (firstname, lastname, class, subject, mark, school_no)
-- values ('JohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohnJohn', 'Smith', 5, 'Math', 4, 50);
-- Data too long for column 'firstname' at row 1

-- insert into students (firstname, lastname, class, subject, mark, school_no)
-- values ('John', 'Smith', 5, 'Math', 4);
-- Error Code: 1136. Column count doesn't match value count at row 1

insert into students (firstname, lastname, class, subject, mark)
values ('John', 'Smith', 5, 'Math', 4);

create table test(
	id int primary key auto_increment,
    name varchar(128),
    surname varchar(128)
);

insert into test(name, surname)
values ('John', 'Smith'),
		('Tom', 'Jameson'),
        ('Lily', 'Watson');
        
select *
from test;

-- Очищение таблицы

delete from test;

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.015 sec

set sql_safe_updates = 0;
delete from test;

insert into test (name, surname)
values ('Bob', 'Brown');

truncate table test;

insert into test (name, surname)
values ('Bob', 'Brown');

set sql_safe_updates = 1;

-- Удаление таблицы 
drop table test;

-- Удаление базы данных 
drop database database_name;

--  Создать таблицу staff с полями:
-- • id – integer - уникальное значение, не null, с автозаполнением 
-- • firstname - varchar - не null
-- • lastname - varchar - не null
-- • position - varchar
-- • age - integer - от 0 до 110(вкл.)
-- • has_child – либо Y, либо N
-- • username - varchar - уникальный

create table staff(
	id int primary key auto_increment,
    firstname varchar(64) not null,
    lastname varchar(100) not null,
    position varchar(100),
    age int check(age between 0 and 110),
    has_child char(1) check(has_child in ('Y', 'N')),
    username varchar(100) unique
);


INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Dereck'
        , 'Senior Teacher'
        , 22
        , 'N'
        , 'annaD5'
        );
        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Austin'
        , 'Junior Blogger'
        , 25
        , 'Y'
        , 'tom12345'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Bill'
        , 'Lorentz'
        , 'Junior Web Developer'
        , 40
        , 'Y'
        , 'billt1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'May'
        , 'Junior Backend Developer'
        , 25
        , 'Y'
        , 'lil12'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Nona'
        , 'Lucky'
        , 'Junior Teacher'
        , 20
        , 'N'
        , 'LuckyNona'
        ); 
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ( 'Nancy'
        , 'Greenberg'
        , 'Middle UI Designer'
        , 32
        , 'Y'
        , 'nancy1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Daniel'
        , 'Faviet'
        , 'Senior UX Designer'
        , 43
        , 'Y'
        , 'favietD'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ally'
        , 'Austin'
        , 'Junior UI Designer'
        , 28
        , 'N'
        , 'ally1'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Chen'
        , 'Senior Teacher'
        , 25
        , 'Y'
        , 'lilychen'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Austin'
        , 'Middle Teacher'
        , 34
        , 'Y'
        , 'anna28'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Alexander'
        , 'Lorentz'
        , 'Junior Backend Developer'
        , 25
        , 'N'
        , 'alex12345'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Lorentz'
        , 'Junior UX Designer'
        , 18
        , 'N'
        , 'lorentz99'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Lucky'
        , 'Middle Blogger'
        , 34
        , 'Y'
        , 'lucky78'
        );        
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Junior Blogger'
        , 18
        , 'N'
        , 'weiss11'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Weiss'
        , 'Junior UI Designer'
        , 18
        , 'N'
        , 'tom222'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Bloom'
        , 'Middle UX Designer'
        , 20
        , 'N'
        , 'bloom5'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Tom'
        , 'Berg'
        , 'Middle Teacher'
        , 34
        , 'N'
        , 'tommy1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Berg'
        , 'Senior Teacher'
        , 37
        , 'N'
        , 'ash89'
        );
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Lily'
        , 'Weiss'
        , 'Middle Blogger'
        , 45
        , 'N'
        , 'lilyW1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Lorentz'
        , 'Senior UX Designer'
        , 31
        , 'N'
        , 'annlo1'
        );   
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Ashley'
        , 'Weiss'
        , 'Middle UX Designer'
        , 18
        , 'N'
        , 'weiss1'
        );       
INSERT INTO Staff(firstname, lastname, position, age, has_child, username) VALUES 
        ('Anna'
        , 'Keren'
        , 'Junior UX Designer'
        , 34
        , 'N'
        , 'annaK1'
        );       

select *
from staff;

-- Найти список работников, у который юзернейм заканчивается на ‘1’
select *
from staff
where username like '%1';

-- CRUD

-- Create - create database, create table
-- Read - select.. from..
-- Update - alter table, update.. set..
-- Delete - drop database, drop table, delete from, truncate


-- Найти список работников в возрасте от 20 до 30 лет(вкл.), у которых младший(junior) уровень должности
select * 
from staff
where age between 20 and 30 and position like 'Junior%';
