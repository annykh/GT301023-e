-- Агрегатные функции

-- SUM: вычисляет сумму значений
-- MIN: вычисляет наименьшее значение
-- MAX: вычисляет наибольшее значение
-- COUNT: вычисляет количество строк в запросе
-- AVG: вычисляет среднее значение

use hr;

select * from employees;

-- Найти максимальную зарплату.
select max(salary) as max_salary
from employees;

-- Найти максимальную зарплату среди сотрудников из 'IT_PROG'
select max(salary) as max_salary
from employees
where job_id = 'IT_PROG';

-- Найти количество сотрудников
select count(*) -- кол/во всех строк 
from employees;

select count(employee_id)
from employees;

-- Найти среднюю зарплату по компании
select avg(salary)
from employees;

-- Найти среднюю зарплату в департаменте с id 90
select avg(salary)
from employees
where department_id = 90;

-- Найти количество сотрудников из департамента с айди 100, которые зарабатывают более 5000
select count(*)
from employees
where department_id = 100 and salary > 5000;

-- Найти самую большую зарплату среди сотрудников, работающих в департаментах с id 70 или 80
select max(salary)
from employees
where department_id = 70 or department_id = 80;
-- where department_id in (70, 80);

-- Подзапросы 

-- select <column_name>,...
-- from (
-- 		select * from <table_name>
-- 	) t1

-- select <column_name>, ...
-- from <table_name>
-- where <column1_name> = (
-- 		select агрегация(<column_name>)
--         from <table_name>
--     )

-- Вывести имя и фамилию сотрудников с маскимальной зарплатой
-- 1. Вывести имена и фамилии сотрудников
select first_name, last_name
from employees;

-- 2. Найти максимальную зарплату 
select max(salary)
from employees; 

-- 3. Решение
select first_name, last_name
from employees
where salary = (select max(salary) from employees);

-- Найти сотрудников, у которых зарплата меньше средней зарплаты по компании
-- Вывести имя, фамилию и зарплату.

select first_name, last_name, salary
from employees;

select avg(salary)
from employees;

select first_name, last_name, salary
from employees
where salary < (select avg(salary)
				from employees);
                
-- Найти кол/во сотрудников, у которых зарплата меньше средней зарплаты по компании
select count(*)
from employees
where salary < (select avg(salary)
				from employees);
                
-- Найти средную зарплату сотрудников из департамента Finance

-- 1. Вывести зарплаты сотр. из департамента Finance
select salary
from employees emp
join departments dprt
on emp.department_id = dprt.department_id
where dprt.department_name = 'Finance';

-- 2. Решение
select avg(salary)
from employees emp
join departments dprt
on emp.department_id = dprt.department_id
where dprt.department_name = 'Finance';

-- Найти количество сотрудников из департамента IT, которые зарабатывают больше средней зарплаты по компании
-- 1. Найти кол/во сотрудников из департамента IT
select count(*)
from employees emp
join departments dprt
on emp.department_id = dprt.department_id
where dprt.department_name = 'IT';

-- 2. Найти средную зп по компании
select avg(salary)
from employees;

-- 3. Решение
select count(*)
from employees emp
join departments dprt
on emp.department_id = dprt.department_id
where dprt.department_name = 'IT' and salary > (select avg(salary) from employees);

-- Найти количество департаментов, в которых никто не работает

-- 1. Найти департаменты, в которых никто не работает
select dprt.department_name, emp.employee_id
from departments dprt
left join employees emp
on emp.department_id = dprt.department_id
where emp.employee_id is null;

-- 2. Кол/во департаментов...
select count(*)
from departments dprt
left join employees emp
on emp.department_id = dprt.department_id
where emp.employee_id is null;

-- Найти количество городов(city), где нет департаментов
select count(*)
from locations loc
left join departments dprt
on loc.location_id = dprt.location_id
where department_id is null;

-- Вывести имена и фамилии сотрудников из отделов(job_id) IT_PROG или ST_MAN, которые получают 
-- либо самую низкую либо самую высокую зарпалту в этих отделов

select first_name, last_name
from employees
where job_id in ('IT_PROG', 'ST_MAN') and (salary = (select min(salary) from employees
where job_id in ('IT_PROG', 'ST_MAN'))  
or salary = (select max(salary) from employees
where job_id in ('IT_PROG', 'ST_MAN')));

select min(salary) from employees
where job_id in ('IT_PROG', 'ST_MAN');

select max(salary) from employees
where job_id in ('IT_PROG', 'ST_MAN');

-- Группировка
-- Group by
-- having

-- select column_name,...
-- from table
-- [joins ..]
-- [where условие]
-- group by column_name
-- [having условие]
-- сортировка , пагинаци

-- Найти максимальную зарплату по департаментам(department_id)
select department_id, max(salary) as max_salary
from employees
group by department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести department_id и employees_cnt
select department_id, count(*) as employees_cnt
from employees
group by department_id;

-- Найти количество сотрудников в каждом департаменте. Вывести department_name и employees_cnt
select dprt.department_name, count(*) as employees_cnt
from departments dprt
join employees emp
on dprt.department_id = emp.department_id
group by dprt.department_name;

-- Найти среднее зарплат по департаментам. Вывести department_name и avg_salary
select dprt.department_name, avg(emp.salary)
from departments dprt
join employees emp
on dprt.department_id = emp.department_id
group by dprt.department_name;

-- Найти имена и фамилии сотрудников с максмальной зарплатой в каждом департаменте
select emp.first_name, emp.last_name, emp.salary, emp.department_id
from employees emp
join (select department_id, max(salary) as max_salary
	  from employees
	  group by department_id) max_sal
on emp.department_id = max_sal.department_id
where emp.salary = max_sal.max_salary;

-- Найти макс. зп по департаментам
select department_id, max(salary) as max_salary
from employees
group by department_id;

-- Посчитать кол/во сотрудников в каждом департаменте и вывести только те значения где кол/во больше 5.
select department_id, count(*) as employees_cnt
from employees
group by department_id
having employees_cnt > 5;

-- Вывести те депатраменты, в которых максимальная зарплата выше 10000
select department_id, max(salary) as max_salary
from employees
group by department_id
having max_salary > 10000;
