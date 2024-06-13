-- Условное ветвление

use gt301023;

create table phones (
	id int primary key auto_increment,
    product_name varchar(128) not null, 
    product_count int, 
    staring_price int
);

alter table phones
change staring_price starting_price int;

insert into Phones(Product_Name, Product_Count, Starting_Price) 
	values('iPhone X', 3, 680),
	 ('iPhone XR', 2, 700),
	 ('iPhone XS', 10, 720),
	 ('iPhone 11', 1, 790),
	 ('iPhone 11 Pro', 12, 850),
	 ('iPhone 11 Pro Max', 2, 890),
	 ('iPhone SE', 1, 850),
	 ('iPhone 12 Mini', 15, 890),
	 ('iPhone 12', 20, 910),
	 ('iPhone 12 Pro', 5, 950),
	 ('iPhone 12 Pro Max', 13, 1000);

select * from phones;

-- Оператор AS(alias) - как
select product_name as name, product_count as count, starting_price as price
from phones;

-- Вывести имя продукта и кол/во*цена
select product_name, product_count * starting_price as total
from phones;

-- Создать новое поле total тип int по умолчанию 0
alter table phones
add column total int default 0;

set sql_safe_updates = 0;

-- Заполнить поле total формулой product_count * starting_price
update phones
set total = product_count * starting_price;

-- case
-- 	when Условие1 then Результат1
-- 	when Условие2 then Результат2
-- 	when Условие3 then Результат3
--     ..
--     else альтернативный результат
-- end

-- if
-- else if
-- else if
-- ...
-- else

-- Вывести product_name, product_count, новое поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, count_info = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, count_info = 'Мало товара',
-- Если Product_Count меньше/равно 10, count_info = 'Есть в наличии',
-- В остальных случаях count_info ='Много товара';

select product_name, product_count, 
case 
	when product_count <= 2 then 'Товар заканчивается'
    when product_count <= 5 then 'Мало товара'
    when product_count <= 10 then 'Есть в наличии'
    else 'Много товара'
end as count_info
from phones;

-- Создать новое поле count_info, заполнить ее: 
-- Если Product_Count меньше/равно 2, category = 'Товар заканчивается',
-- Если Product_Count меньше/равно 5, category = 'Мало товара',
-- Если Product_Count меньше/равно 10, category = 'Есть в наличии',
-- В остальных случаях category ='Много товара';

alter table phones
add column count_info varchar(128);

select * from phones;

-- update phones
-- set count_info = 'Товар заканчивается'
-- where Product_Count <= 2;

-- update phones
-- set count_info = 'Мало товара'
-- where Product_Count > 2 and Product_Count <= 5;

update phones
set count_info = case
						when product_count <= 2 then 'Товар заканчивается'
						when product_count <= 5 then 'Мало товара'
						when product_count <= 10 then 'Есть в наличии'
						else 'Много товара'
				 end;
                 
-- Вывести product_name как name, starting_price как price и новое поле tax 
-- Заполнить поле tax
-- Если начальная цена меньше/равно 700, tax = null,
-- если больше 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25 

select product_name as name, starting_price as price, 
case
	when starting_price <= 700 then null
    when starting_price < 850 then 15
    when starting_price >= 850 then 25
end as tax
from phones;

-- Создать новое поле tax целое число
-- Заполнить поле tax:
-- Если начальная цена меньше 700, tax = null,
-- если больше либо равно 700 и меньше 850, tax = 15,
-- если больше или равно 850, tax = 25

alter table phones
add column tax int;

update phones
set tax = case
				when starting_price <= 700 then null
				when starting_price < 850 then 15
				when starting_price >= 850 then 25
		  end;
 
 -- Создать новое поле для final_price numeric(6, 2)
-- Заполнить (starting_price + starting_price * tax / 100)

alter table phones
add final_price numeric(6, 2);

update phones
set final_price = starting_price + starting_price * tax / 100;

update phones
set final_price = case
						when tax is null then starting_price
                        else starting_price + starting_price * tax / 100
				  end;


-- value1 = null
-- value2 = 600 + 600 * null / 100
-- value3 = 0
-- coalesce(value1, value2, value3) -- value3

update phones
set final_price = coalesce(starting_price + starting_price * tax / 100, starting_price, 0);

select * from phones;


-- Inner Join
-- Создать бд hr:
-- https://github.com/annykh/genTech/blob/main/hr%20database.txt
  
select * from regions;

select * from countries;

-- имя страны и регион в котором она находится
select countries.country_name, regions.region_name
from countries
join regions
on countries.region_id = regions.region_id;

select * from locations;

-- Все города в которых есть департаменты, и вывести страны в которых находятся эти города.
select locations.city, countries.country_name
from countries
join locations
on countries.country_id = locations.country_id;

-- Все города в которых есть департаменты, вывести страны в которых находятся эти города и регионы стран.
select locations.city, countries.country_name, regions.region_name
from countries
join locations
on countries.country_id = locations.country_id
join regions
on countries.region_id = regions.region_id;

select * from employees;
select * from departments;

 -- Вывести имя и фамилию сотрудника и название его департамента
 -- first_name, last_name, department_name 
 select employees.first_name, employees.last_name, departments.department_name
 from employees
 join departments
 on employees.department_id = departments.department_id;
 
-- Вывести имя и фамилию сотрудника, которые работают в департамента Shipping
select employees.first_name, employees.last_name, departments.department_name
from employees
join departments
on employees.department_id = departments.department_id
where departments.department_name = 'Shipping';

select emp.first_name, emp.last_name, dep.department_name
from employees emp
join departments dep
on emp.department_id = dep.department_id
where dep.department_name = 'Shipping';
