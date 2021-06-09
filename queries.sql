SELECT * FROM departments

SELECT * FROM dept_manager;

SELECT * FROM dept_emp;

SELECT * FROM titles;

select * from retirement_info_1

select * from employees

SELECT MAX(emp_no) FROM employees;

SELECT nextval('the_primary_key_sequence');

SELECT COUNT(first_name)
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31' 


SELECT first_name, last_name
INTO retirement_info_1
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')