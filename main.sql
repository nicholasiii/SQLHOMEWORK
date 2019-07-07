--main SQL file for CWRUCLE201904DATA4 SQL Homework
--One
--This is a very simple join.Start with some basic data in the employee table, then use
--the employee number to get their salary information from the salary table
select employees.employee, employees.last_name, employees.first_name, employees.gender,salary.salary
from employees
left JOIN salary
ON salary.employee=employees.employee;


--Two
Simple request for employees hired in 1986
select * from employees
where hire_date between '01/01/1986' and '12/31/1986';


--Three
--Creates a view that shows all department managers in the file, 
--the departments they manage, their starting date in that position, their ending date, etc.
--the question was somewhat ambiguous on whether the analyses was of when they started 
--with the company or just started as managers, and whether former managers should count
--I chose to take start dates and end dates from the manager's file rather then the 
--employee file, and include former managers.
CREATE VIEW managers AS
SELECT dept_manager.dept_no,departments.dept_name,dept_manager.employee,employees.last_name,employees.first_name,dept_manager.from_date, dept_manager.to_date
FROM dept_manager
INNER JOIN employees ON (employees.employee = dept_manager.employee)
inner join departments on (departments.dept_no=dept_manager.dept_no);


--Four
--Creates a view called "employee" that includes mployee #, first/last name and department name
--Two joins were required, and this view was used in parts six and seven as well
CREATE VIEW employee AS
SELECT employees.employee,employees.first_name,employees.last_name,departments.dept_name,dept_emp.dept_no
FROM employees
inner JOIN dept_emp ON (employees.employee = dept_emp.employee)
inner join departments on (departments.dept_no=dept_emp.dept_no);

--Five
--Searches the original data (table employees) for employees whose first name is Hercules
--and whose last name starts with the letter B

select first_name, last_name from employees
where first_name = 'Hercules'
and last_name like 'B%';

--Six
--Uses the view created in step four to list all Sales Department employees
select employee, last_name, first_name, dept_name from employee
where dept_name='Sales';

--Seven
--Very similiar to Six, also depends on the view created in Four, adds an "or"
--statement so that development employees also appear in the results
select employee, last_name, first_name, dept_name from employee
where dept_name='Sales'
or dept_name='Development';

--Eight
--Uses the original data to get a list of every last name in the employees file,
--count the names, and display them in descending order
select last_name, count(last_name) from employees
group by last_name 
order by count(last_name) desc;