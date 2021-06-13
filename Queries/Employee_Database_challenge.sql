-- Deliverable 1 

-- create retirement_titles table
SELECT 
-- RETRIEVE emp_no, first_name, last_name from Employees table
	em.emp_no,
	em.first_name,
	em.last_name,
-- RETRIEVE title, from_date, to_date from Titles table
	tl.title,
	tl.from_date,
	tl.to_date
-- save findings to new table 'retirement_titles'
INTO retirement_titles
FROM employees as em
LEFT JOIN titles as tl
ON (em.emp_no = tl.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY (em.emp_no)


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no, to_date DESC;


--
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT DESC


--Deliverable 2

-- Mentorship Eligibility table
SELECT 
	DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON(e.emp_no = de.emp_no)
INNER JOIN titles as tl
ON (de.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY (e.emp_no)
