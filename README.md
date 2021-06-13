# Pewlett-Hackard-Analysis

## Overview of Project
The purpose of the project is to help the company determine the number of retiring employees as per thier company title, and help the company identify employees that are eligible to participate in a new mentorship program. 

## Results
![retiring_titles](/Data/retiring_titles.PNG)
</br>
Through SQL, we were able to retrieve the unique current title of all retiring employees and used the count method to find the number retiring employees per title. As we can see from the picture above, Senior Engineers and Senior Staff employees have the most people to replace in the company with each title needing +28000 to replace, Engineers and Staff are next with each title needing ±13000 employees to replace, then Technique Leader and Assistant Engineer with title each needing ±3000 employees to replace, and lastly Managers, with only 2 needing replacements.
</br>
Next, as shown in the **mentorship_eligibilty.csv** file, we have found the employees that are eligible for entering the mentorship program in Pewlett Hackard. This is done by making a query that retrives the employee number, name, birth of date, start and end of employement date, and title by joining the employees, dept_emp, and titles table. We then also filtered the date of birth to be between 1965-01-01 and 1965-12-31, and set the to_date to be 9999-01-01 to get current employees only. 

## Summary
