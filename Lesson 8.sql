-- drop database test;
-- create database test;
-- use test;

-- create table table1(
-- 	id int primary key auto_increment,
--     first_name varchar(128) not null,
-- 	username varchar(128) unique,
--     salary numeric(6, 2),
--     age int check(age between 18 and 50),
--     manager_id int default 10
-- );

-- insert into table1 (first_name, username, salary, age, manager_id)
-- values (...);

-- not null
-- unique
-- primary key
-- default
-- check
-- auto_increment

-- varchar(10) - varchar(max)
-- char(10) - char(fixed)


use gt301023;

select * from phones;

-- alter table phones
-- add
-- drop
-- modify
-- change
-- rename

-- set sql_safe_updates = 0;

-- update phones
-- set starting_price = 1000
-- where product_name = 'iPhone 11 Pro Max';

-- delete from phones
-- where starting_price < 800;

-- set sql_safe_updates = 1;

-- limit 3
-- order by total asc/desc

-- inner join
-- outer join 
-- self join 

-- use hr;

-- self join 
-- Вывести имя и фамилию сотрудников и их менеджеров

-- select emp1.first_name, emp1.last_name, emp2.first_name, emp2.last_name
-- from employees emp1 -- employees
-- join employees emp2 -- manager
-- on emp1.manager_id = emp2.employee_id;

-- max()
-- min()
-- sum()
-- avg()
-- count()

-- Вывести кол/во городов из таблицы locations
select count(city)
from locations;

-- Вывести сумму коммиссий (commission_pct)
select sum(commission_pct)
from employees;

-- Вывеси суммы коммисий по департаментам
select department_id, sum(commission_pct)
from employees
group by department_id;

-- Вывеси только not null суммы коммисий по департаментам
select department_id, sum(commission_pct) as comm_sum
from employees
group by department_id
having comm_sum is not null;

-- Найти департаменты, в которых больше 10 сотрудников

-- 1. Вывести ид департамента и кол/во сотрудников
select department_id, count(employee_id) as count_emp
from employees
group by department_id
having count_emp > 10;

-- 2. Вывести имена департаментов
select dprt.department_name, emp_count.count_emp
from departments dprt
join (select department_id, count(employee_id) as count_emp
		from employees
		group by department_id
		having count_emp > 10) emp_count
on dprt.department_id = emp_count.department_id;


-- Выведите название департаментов с кол-вом сотрудников больше среднего

-- 1. Найти кол/во сотрудников по департаментам
select department_id, count(employee_id) as count_emp
from employees
group by department_id;

-- 2. Найти среднее кол/во сотрудников
select avg(emp_count.count_emp) as emp_count_avg
from (select department_id, count(employee_id) as count_emp
		from employees
		group by department_id) emp_count;

-- 3. Вывести ид департаментов с кол-вом сотрудников больше среднего
select department_id, count(employee_id) as total_emp_count
from employees
group by department_id
having total_emp_count > (select avg(emp_count.count_emp) as emp_count_avg
							from (select department_id, count(employee_id) as count_emp
									from employees
									group by department_id) emp_count);

-- 4. Выведите название департаментов с кол-вом сотрудников больше среднего
select dprt.department_name, max_emp_count.total_emp_count
from departments dprt
join (select department_id, count(employee_id) as total_emp_count
		from employees
		group by department_id
		having total_emp_count > (select avg(emp_count.count_emp) as emp_count_avg
									from (select department_id, count(employee_id) as count_emp
											from employees
											group by department_id) emp_count)) max_emp_count
on dprt.department_id = max_emp_count.department_id;

-- Найти департамент с наибольшим кол-вом сотрудников 

-- 1. находим кол-во сотрудников в каждом департаменте
select department_id, count(employee_id) as count_emp
from employees
group by department_id;

-- 2. находим максимальное кол-во сотрудников среди департаментов
select max(emp_count_table.count_emp) as max_count
from (select department_id, count(employee_id) as count_emp
		from employees
		group by department_id) emp_count_table;

-- 3. находим идентификаторы департаментов с указанным кол-вом сотрудников
select department_id, count(employee_id) as count_emp
from employees
group by department_id
having count_emp = (select max(emp_count_table.count_emp) as max_count
					from (select department_id, count(employee_id) as count_emp
							from employees
							group by department_id) emp_count_table);

-- 4. находим имя департамента с максимальным кол-вом сотрудников
select dprt.department_name, max_count_table.count_emp
from departments dprt
join (select department_id, count(employee_id) as count_emp
		from employees
		group by department_id
		having count_emp = (select max(emp_count_table.count_emp) as max_count
							from (select department_id, count(employee_id) as count_emp
									from employees
									group by department_id) emp_count_table)) max_count_table
on max_count_table.department_id = dprt.department_id;
