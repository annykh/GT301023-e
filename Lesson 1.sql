-- Работа в песочнице
-- https://www.programiz.com/sql/online-compiler/

-- select column_name1, column_name2,..
-- from table_name

-- select *
-- from customers;

-- Вывести покупателей, которым больше 25.
-- select *
-- from customers
-- where age>25;

-- Вывести имя и фамилию покупателей из США
-- select first_name, last_name
-- from customers
-- where country = "USA";

-- Вывести покупателей в возрасте от 25 до 30(вкл.концы).
-- select *
-- from customers
-- where age between 25 and 30;

-- select *
-- from customers
-- where age>=25 and age<=30;

-- Вывести покупателей которым больше 30 или меньше 25.
-- select *
-- from customers
-- where age not between 25 and 30;

-- select *
-- from customers
-- where age>30 or age<25;

-- Вывести покупателей из USA и UK.
-- select *
-- from customers
-- where country in ("USA", "UK");

-- select *
-- from customers
-- where country = 'USA' or country = 'UK';

-- Вывести покупателей у которых имя не John, не David, не Alex
-- select *
-- from customers
-- where first_name not in ('John', 'David', 'ALex');

-- select * 
-- from customers
-- where first_name != 'John' and first_name != 'David' and first_name != 'Alex';

-- Вывести покупателей у которых фамилия начинаетя на R.
-- select *
-- from customers
-- where last_name like 'r%';

-- Вывести покупателей у которых фамилия заканчивается на E
-- select *
-- from customers
-- where last_name like '%e';

-- Вывести покупателей у которых имя содержит букву B.
-- select *
-- from customers
-- where first_name like '%b%';

-- Вывести покупателей у которых в имени вторая буква O.
-- select * 
-- from customers
-- where first_name like '_o%';

-- Вывести покупателей у которых в имени четвертая буква N
-- select * 
-- from customers
-- where first_name like '___n%';

-- Вывести покупателей у которых в середине имя есть буква B.
-- select * 
-- from customers
-- where first_name like '_%b%_';

-- Создаем таблицы из скрипта:
-- https://github.com/annykh/GT301023-e/blob/main/hr1.sql

-- Найти всех сотрудников, работающих в департаменте с id 90.
-- select *
-- from Employees
-- where department_id = 90;

-- Найти всех сотрудников, зарабатывающих больше 5000
-- select *
-- from Employees
-- where salary > 5000;

-- Найти всех сотрудников, чья фамилия начинается на букву L
-- select *
-- from employees
-- where last_name like 'L%';

-- Найти все департаменты, у которых location_id 1700
-- select *
-- from Departments
-- where location_id = 1700;

-- Вывести зарплату сотрудника с именем ‘Lex’ и фамилией ‘De Haan'
-- select salary
-- from Employees
-- where first_name = 'Lex' and last_name = 'De Haan';

-- Вывести всех сотрудников с job_id ‘FI_ACCOUNT’ и зарабатывающих меньше 8000
-- select *
-- from employees
-- where job_id = 'FI_ACCOUNT' and salary < 8000;

-- Вывести сотрудников, у которых в фамилии в середине слова встречаются сочетания ‘kk’ или ‘ll’
-- select *
-- from employees
-- where last_name like '_%kk%_' or last_name like '_%ll%_';

-- Найти сотрудников из департаментов 60, 30 или 100.
-- select *
-- from employees
-- where department_id in (60, 30, 100);

-- Найти сотрудников из департамента 100 с зарплатой выше 11000. 
-- Вывести только имя, фамилию, зарплату и департамент сотрудника.
-- select first_name, last_name, salary, department_id
-- from employees
-- where department_id = 100 and salary > 11000;

-- Вывести всех сотрудников кроме тех, кто работает в департаментах 80 и 110
-- select *
-- from employees
-- where department_id != 80 and department_id != 110;

-- select *
-- from employees
-- where department_id not in (80, 110);

-- Найти сотрудников у которых имя состоит из 5 букв
--select *
--from employees
--where first_name like '_____';

-- Вывести сотрудников зарабатывающих от 5000 до 7000 (включая концы)
-- select *
-- from employees
-- where salary between 5000 and 7000;