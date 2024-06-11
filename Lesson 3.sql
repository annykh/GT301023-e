create database test2;

use test2;

drop database test2;

use gt301023;

-- CRUD

-- create - create database, create table, add column
-- read - select from
-- update - alter table, update set
-- delete - drop database, drop table, delete

-- create table table_name(
-- 	column1 datatype,
--     column2 type.., 
-- )

-- insert into table_name(column1, column2)
-- values (value1, value2)


-- Изменение таблицы и столбцов

create table products(
	id int primary key auto_increment,
    title varchar(128) not null,
    quantity int check(quantity between 0 and 10)
);

insert into products(title, quantity)
values ('Apple', 6),
		('Banana', 8),
        ('Kiwi', 10),
        ('Strawberry', 6),
        ('Mango', 5),
        ('Avocado', 5),
        ('Pinapple', 4),
        ('Pomegrante', 2);

select * from products;


-- alter table table_name
-- add column column_name type constraint, -- добавление столбца
-- drop column column_name, -- удаление столбца
-- modify column column_name new_type, -- изменение типа данных 
-- change column column_name new_column_name type -- изменение названия

-- Добавить новое поле price тип целое число по умолч. 0
alter table products
add column price int default 0;

-- Изменить тип поля price на numeric(6, 2)
-- 6 максимум символов, 2 кол/во символов после запятой
alter table products
modify column price numeric(6,2);

-- Переименовать поле price на item_price
alter table products
change column price item_price numeric(6, 2);

-- Удалить поле price
alter table products
drop column item_price;

-- Добавить поле quality типа decimal(6, 2) со значением по умолчанию 0
-- Изменить тип quantity на decimal(4, 2)
-- Переименовать поле title на item_title
alter table products
add column quality decimal(6, 2) default 0,
modify quantity decimal(4, 2),
change title item_title varchar(128);

-- Изменить тип quality на integer
alter table products
modify column quality integer;

-- Удалить поле quality
alter table products
drop column quality;

select * from products;

-- Создать таблицу students1 с полями
-- name строка (не null)
-- lastname строка (не null)
-- avg_mark целое число (от 0 до 5)
-- gender строка(128) (или “M“ или “F“)


create table students1(
	name varchar(128) not null,
    lastname varchar(128) not null,
    avg_mark int check(avg_mark between 0 and 5),
    gender varchar(128) check(gender in ('M', 'F'))
);

-- first - в начало
-- after column_name - после поля
-- before column_name - до поля

--  Добавить поле id integer primary key auto_increment в начало таблицы 
alter table students1
add column id integer primary key auto_increment first;

-- Добавить поле age (тип целое число) после lastname
alter table students1
add column age int after lastname;

-- Поменять тип у gender на char(1)
-- Переименовать поле name на firstname

alter table students1
modify column gender char(1),
change name firstname varchar(128);

select * from students1;

 create table employees(
 	employee_id int primary key auto_increment,
 	first_name varchar(128) not null,
 	last_name varchar(128) not null,
 	email varchar(128) not null,
 	salary int, 
	department varchar(128) not null
 );
 
insert into employees(first_name, last_name, email, salary, department) values("Steven","King",	"SKING", 24000, "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Neena" , "Kochhar" , "NKOCHHAR" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Lex" , "De Haan" , "LDEHAAN" , 17000 , "Sales");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Hunold" , "AHUNOLD" , 9000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Bruce" , "Ernst" , "BERNST" , 6000 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Valli" , "Pataballa" , "VPATABAL" , 4800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Diana" , "Lorentz" , "DIANALO" , 8800 , "Finance");
insert into employees(first_name, last_name, email, salary, department) values("Nancy" , "Greenberg" , "NGREENBE" , 12008 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Daniel" , "Faviet" , "DFAVIET" , 9000 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Jose Manuel" , "Urman" , "JMURMAN" , 7800 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Luis" , "Popp" , "LPOPP" , 6900 , "Shipping");
insert into employees(first_name, last_name, email, salary, department) values("Den" , "Raphaely" , "DRAPHEAL" , 11000 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Alexander" , "Khoo" , "AKHOO" , 3100 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Shelli" , "Baida" , "SBAIDA" , 2900 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Sigal" , "Tobias" , "STOBIAS" , 2800 , "Marketing");
insert into employees(first_name, last_name, email, salary, department) values("Matthew" , "Weiss" , "MWEISS" , 8000 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Fripp" , "AFRIPP" , 8200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Payam" , "Kaufling" , "PKAUFLIN" , 7900 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Shanta" , "Vollman" , "SVOLLMAN" , 6500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Kevin" , "Mourgos" , "KMOURGOS" , 5800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Julia" , "Nayer" , "JNAYER" , 3200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Markle" , "SMARKLE" , 2200 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Bissot" , "LBISSOT" , 3300 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Mozhe" , "Atkinson" , "MATKINSO" , 2800 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Joshua" , "Patel" , "JPATEL" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Trenna" , "Rajs" , "TRAJS" , 3500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("John" , "Russell" , "JRUSSEL" , 14000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Karen" , "Partners" , "KPARTNER" , 13500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Alberto" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Gerald" , "Cambrault" , "GCAMBRAU" , 11000 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Eleni" , "Zlotkey" , "EZLOTKEY" , 10500 , "IT");
insert into employees(first_name, last_name, email, salary, department) values("Adam" , "Vargas" , "PVARGAS" , 2500 , "Human Resources");
insert into employees(first_name, last_name, email, salary, department) values("Laura" , "Errazuriz" , "AERRAZUR" , 12000 , "IT");
 
select * from employees;

-- Пагинация и сортировка

-- order by column_name (asc) - по возр.
-- order by column_name desc - по убыв.

-- Вывести всех сотрудников, отсортировать выборку по возр. зарплат
select * from employees
order by salary;

-- Вывести сотрудников которые получают больше 10000 и отсотритовать по фамилиям по алф. порядку
select * from employees
where salary > 10000
order by last_name;

-- Пагинация - получение диапазона строк

-- вывести первых трех сотрудников
select * from employees
limit 3;

-- вывести сотрудника с максимальной зарплатой 
select * from employees
order by salary desc 
limit 1;

-- вывести сотрудника с минимальной зарплатой 
select * from employees
order by salary
limit 1;

-- Вывести первых трех сотруников которые получают больше 10000, отсортировать по зарплатам по возр. 
select * from employees
where salary > 10000
order by salary
limit 3;

-- limit a, b

-- a - сколько строк нужно пропустить
-- b - сколько нужно вывести

-- Из employees вывести 10 строк пропуская первые 5
select * from employees
limit 5, 10;

-- Изменение и удаление данных 

-- update table_name
-- set column_name = new_value, column_name = new_value
-- (where)

-- delete from table_name
-- (where) 

-- Отключить безопасный режим
set sql_safe_updates = 0;

-- Изменить департамент сотрудника Steven King на IT
update employees
set department = 'IT'
where first_name = 'Steven' and last_name = 'King';

-- Повысить зарплату Laura Bissot на 5000.
update employees
set salary = salary + 5000
where first_name = 'Laura' and last_name = 'Bissot';

-- Изменить фамилию Luis Popp на Smith
update employees
set last_name = 'Smith'
where first_name = 'Luis' and last_name = 'Popp';

-- Удалить сотрудника Adam Fripp из таблицы
delete from employees
where first_name = 'Adam' and last_name = 'Fripp';

-- Повысить зарплату работников отдела IT в 2 раза
update employees
set salary = salary * 2
where department = 'IT';

-- Всех работников отдела shipping уволили. Удалите работников shipping из таблицы.
delete from employees
where department = 'shipping';

-- John Russell перевели в отдел Marketing и повысили зарплату на 5000. Измените данные для работника John Russell. 
update employees
set department = 'Marketing', salary = salary + 5000
where first_name = 'John' and last_name = 'Russell';

-- Удалить сотрудников с employee_id 2, 7, 10
delete from employees
where employee_id in (2, 7, 10);
-- where employee_id = 2 or employee_id = 7 or employee_id = 10

-- Включить безопасный режим
set sql_safe_updates = 1;
