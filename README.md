# Pewlett-Hackard-Analysis

## Overview of Project
The purpose of the project is to help the company determine the number of retiring employees as per thier company title, and help the company identify employees that are eligible to participate in a new mentorship program. 

## Results
![retiring_titles](/Data/retiring_titles.PNG)
</br>
Through SQL, we were able to retrieve the unique current title of all retiring employees and used the count method to find the number retiring employees per title. 
As we can see from the picture above: 
- Senior Engineers and Senior Staff employees have the most people to replace in the company with each title needing +28000 to replace
- Engineers and Staff are next with each title needing ±13000 employees to replace.
- Technique Leader and Assistant Engineer with title each needing ±3000 employees to replace.
- Managers with only 2 needing replacements.
</br>
Next, as shown in the **mentorship_eligibilty.csv** file, we have found the employees that are eligible for entering the mentorship program in Pewlett Hackard. This is done by making a query that retrives the employee number, name, birth of date, start and end of employement date, and title by joining the employees, dept_emp, and titles table. We then also filtered the date of birth to be between 1965-01-01 and 1965-12-31, and set the to_date to be 9999-01-01 to get current employees only. 

## Summary
Q1. Who accepts the mentorship program?
We will need to put out a survey to all the employees that are eligible for the mentorship program and ask them whether they are up for entering the program. We will then entering our findings to the **mentorship_eligibilty.csv** with a new column (survey) specifiying whether the employee wants to enter the program or not. We can then filter the data using SQL to find all the employees that are entering the program using the following code:
SELECT
  emp_no,
	first_name,
	last_name,
	birth_date,
	from_date,
	to_date,
	title
 FROM mentorship_eligibilty
 WHERE survey = "Yes";
 
 Q2. Which departments have the most number of retiring employees?
 We can achieve this by q=creating a query similar to the one we made in the module where we count the number of employees retiring in each department, but here we will need to order by decending order. The code will be the following:
 --Group by in sql
 
SELECT COUNT (ce.emp_no), de.dept_no
INTO need_replacement_emp
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY count DESC;
