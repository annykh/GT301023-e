-- union/union all
use gt301023;

create table user_bremen(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age int
);

create table user_berlin(
	id int primary key auto_increment,
    first_name varchar(128),
    last_name varchar(128),
    age int,
    phone varchar(128)
);

insert into user_bremen(first_name, last_name, age)
values ('Linda', 'Johnson', 45),
		('John', 'Smith', 25),
        ('Laura', 'Thomas', 35),
        ('Barbarra', 'Jones', 21);

insert into user_berlin(first_name, last_name, age, phone)
values ('Carol', 'Robinson', 32, '+12233245436'),
		('Barbarra', 'Jones', 21, '+234234232'),
		('Meliissa', 'King', 20, '+123242343'),
        ('Amy', 'Wans', 56, '+12343253654'),
        ('Laura', 'Thomas', 35, '+323423423423');
        
select * from user_bremen;
select * from user_berlin;

select * from user_bremen
union 
select * from user_berlin;
-- The used SELECT statements have a different number of columns

-- Все уникальные покупатели из двух филиалов(без дублей)
select first_name, last_name, age
from user_bremen
union 
select first_name, last_name, age
from user_berlin;

-- Все покупатели из двух филиалов
select first_name, last_name, age
from user_bremen
union all
select first_name, last_name, age
from user_berlin;

-- Вывести все данные всех покупателей, где возможно тел. номер, где нет - null
select first_name, last_name, age, null as phone, 'bremen' as city
from user_bremen
union 
select first_name, last_name, age, phone, 'berlin' as city
from user_berlin;

select *, null as phone
from user_bremen
union 
select *
from user_berlin;


-- 1. Создать таблицу goods с полями:
--     - id (первичный ключ)
--     - title (cтрока максимум 30 символов)
--     - quantity (число больше 0)
--     - in_stock (символ (Y/N))

-- 2. Создать таблицу goods_2 с полями:
--     - id (первичный ключ)
--     - title (cтрока максимум 30 символов)
--     - quantity (число больше 0)
--     - price (целое число)
--     - in_stock (символ (Y/N))

create table goods(
	id int primary key,
    title varchar(30),
    quantity int check(quantity > 0),
    in_stock char(1) check(in_stock in ('Y','N'))
);

drop table goods2;
create table goods_2(
	id int primary key,
    title varchar(30),
    quantity int check(quantity > 0),
    price int,
    in_stock char(1) check(in_stock in ('Y','N'))
);

insert into goods (id, title, quantity, in_stock) values (1, 'Велосипед', 2, 'Y');
insert into goods (id, title, quantity, in_stock) values (2, 'Скейт', 4, 'Y');
insert into goods (id, title, quantity, in_stock) values (3, 'Самокат', 2, 'Y');
insert into goods (id, title, quantity, in_stock) values (4, 'Сноуборд', 7, 'N');
insert into goods (id, title, quantity, in_stock) values (5, 'Санки', 1, 'Y');
insert into goods (id, title, quantity, in_stock) values (6, 'Коньки', 3, 'N');
insert into goods (id, title, quantity, in_stock) values (7, 'Ролики', 5, 'Y');

insert into goods_2 (id, title, quantity, price, in_stock) values (1, 'Тюбинг', 5, 1000, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (2, 'Санки', 2, 1500, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (3, 'Снегокат', 2, 900, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (4, 'Сноуборд', 7, 700, 'N');
insert into goods_2 (id, title, quantity, price, in_stock) values (5, 'Клюшка', 8, 300, 'Y');
insert into goods_2 (id, title, quantity, price, in_stock) values (6, 'Коньки', 3, 350, 'N');
insert into goods_2 (id, title, quantity, price, in_stock) values (7, 'Форма', 9, 450, 'Y');

select * from goods;
select * from goods_2;

-- Вывести все наименования товаров (включая дубли) из двух таблиц.
select title
from goods
union all
select title
from goods_2
order by title;

-- Вывести уникальные названия товаров (без дублей) из двух таблиц
select title
from goods
union
select title
from goods_2
order by title;

-- Объединить данные из двух таблиц, указав price, где это возможно
select title, quantity, in_stock, null as price from goods
union
select title, quantity, in_stock, price from goods_2;


-- Функции для работы с числами(int/numeric/decimal)

select 5 as number;

-- ABS: возвращает абсолютное значение числа.
select abs(-12);

-- ROUND: округляет число. В качестве первого параметра передается число. Второй параметр указывает на длину. 
-- Если длина представляет положительное число, то оно указывает, до какой цифры после запятой идет округление. 
-- Если длина представляет отрицательное число, то оно указывает, до какой цифры с конца числа до запятой идет округление

select round(123.67); -- 124
select round(123.34); -- 123

select round(123.3456, 2); -- 123.35
select round(123.3456, -2); -- 100

-- CEILING: возвращает наименьшее целое число, которое больше или равно текущему значению.
select ceiling(123.35); -- 124

-- FLOOR: возвращает наибольшее целое число, которое меньше или равно текущему значению.
select floor(123.56); -- 123

-- POWER: возводит число в определенную степень.
select power(5, 2); -- 25

-- SQRT: получает квадратный корень числа.
select sqrt(225); -- 15

-- RAND: генерирует случайное число с плавающей точкой в диапазоне от 0 до 1.
select rand();

-- 10-20
select round(rand()*10+10);

-- вывести цену товара со скидкой 15% и округлить значение до целого
select title, round(price - price*15/100)
from goods_2;

-- Функции для работы со строками(varchar/char)

-- CONCAT: объединяет строки. В качестве параметра принимает от 2-х и более строк, которые надо соединить:
select concat('Tom', ' ', 'Smith');

select concat(firstname, ' ', lastname) as full_name
from staff;

select concat('Tom', ' ', 'Smith', ' ', 23, ' ', 'tom@gmail.com');

-- CONCAT_WS: также объединяет строки, но в качестве первого параметра принимает разделитель, который будет соединять строки:
select concat_ws(' ', 'Tom', 'Smith', '23', 'tom@gmail.com');

-- LENGTH: возвращает количество символов в строке. В качестве параметра в функцию передается строка, для которой надо найти длину:
select length('Tom'); -- 3

select username, length(username)
from staff;

-- LTRIM: удаляет начальные пробелы из строки. В качестве параметра принимает строку:
select ltrim('  Tom '); -- 'Tom '

-- RTRIM: удаляет конечные пробелы из строки. В качестве параметра принимает строку:
select ltrim('  Tom '); -- '  Tom'

-- TRIM: удаляет начальные и конечные пробелы из строки. В качестве параметра принимает строку:
select trim('  Tom '); -- 'Tom'

-- LOCATE(find, search [, start]): возвращает позицию первого вхождения подстроки find в строку search. 
-- Дополнительный параметр start позволяет установить позицию в строке search, с которой начинается поиск подстроки find. 
-- Если подстрока search не найдена, то возвращается 0:

select locate('pro', 'iPhone 13 pro'); -- 11
select locate('max', 'iPhone 13 pro'); -- 0
select locate('pro', 'iPhone 13 pro, iPhone 13 pro max'); -- 11
select locate('pro', 'iPhone 13 pro, iPhone 13 pro max', 13); -- 26 (позиция второй подстроки pro)

-- LEFT: вырезает с начала строки определенное количество символов. 
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с начала строки:
select left('iPhone 13 pro max', 6); -- 'iphone'

select left(department, 4)
from employees;

-- RIGHT: вырезает с конца строки определенное количество символов.
-- Первый параметр функции - строка, а второй - количество символов, которые надо вырезать с конца строки:
select right('iPhone 13 pro max', 7) as string; -- 'pro max'

-- REPLACE(search, find, replace): заменяет в строке search подстроку find на подстроку replace. 
-- Первый параметр функции - строка, второй - подстрока, которую надо заменить, а третий - подстрока, на которую надо заменить:
select replace('iPhone 13 pro max', '13', '14');

set sql_safe_updates = 0;

update staff
set position = replace(position, 'Middle', 'Midle')
where position like '% Middle %';

select * from staff;

-- LOWER: переводит строку в нижний регистр:
select lower('APPLE');

-- UPPER: переводит строку в верхний регистр
select upper('apple');
