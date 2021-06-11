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

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;



-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables using aliases
SELECT 
	re.emp_no,
    re.first_name,
	re.last_name,
    dm.to_date
FROM retirement_info as re
LEFT JOIN dept_emp as dm
ON re.emp_no = dm.emp_no
WHERE dm.to_date = ('9999-01-01');


--Group by in sql
SELECT COUNT (ce.emp_no), de.dept_no
INTO need_replacement_emp
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no

-- List 1
SELECT 
	e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');


-- List 2
SELECT 
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.first_name,
	ce.last_name,
	dm.from_date,
	dm.to_date
-- INTO manager_info
FROM dept_manager as dm
INNER JOIN departments as d
ON (dm.dept_no = d.dept_no)
INNER JOIN current_emp as ce
ON (dm.emp_no = ce.emp_no)


--list 3
SELECT
	ce.emp_no,
	ce.first_name,
	ce.last_name,
	ce.to_date,
	d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d
ON(de.dept_no = d.dept_no)

--retiring employees in the sales department
SELECT
	re.emp_no,
	re.first_name,
	re.last_name,
	d.dept_name
FROM retirement_info as re
INNER JOIN dept_emp as de
ON (re.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE (d.dept_name = 'Sales')

--list of retiring employees in the sales and development departments
SELECT
	re.emp_no,
	re.first_name,
	re.last_name,
	d.dept_name
FROM retirement_info as re
INNER JOIN dept_emp as de
ON (re.emp_no = de.emp_no)
INNER JOIN departments as d
ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
