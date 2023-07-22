-- List the employee number, last name, first name, sex, and salary of each employee.
select 

e.emp_no AS employee_number, 
e.last_name, 
e.first_name, 
e.sex,
s.salary

From employees e
inner join salaries s
On e.emp_no = s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986.

select 
first_name, 
last_name,
hire_date

from employees
where 
hire_date >= '1986-01-01' and hire_date <= '1986-12-31'

order by hire_date asc;

-- List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.

Select 
dm.dept_no,
d.dept_name,
dm.emp_no,
e.last_name,
e.first_name 

From dept_manager dm
Inner Join departments d

on dm.dept_no = d.dept_no

Inner Join employees e

on dm.emp_no = e.emp_no;

-- List the department number for each employee along with that 
-- employee's employee number, last name, first name, and department name.

Select
de.dept_no,
de.emp_no,
e.last_name,
e.first_name,
d.dept_name

From dept_emp de

Inner Join employees e
ON de.emp_no = e.emp_no

INNER JOIN departments d
ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B.

SELECT 
first_name,
last_name,
sex
FROM  employees
WHERE 
first_name = 'Hercules' AND last_name like 'B%';

-- List each employee in the Sales department, including their employee number, 
--last name, and first name.

SELECT 
e.emp_no,
e.last_name,
e.first_name
FROM employees e

INNER JOIN  dept_emp de
ON e.emp_no = de.emp_no
WHERE dept_no = 'd007';

-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

SELECT 
e.emp_no,
e.last_name,
e.first_name,
d.dept_name

FROM employees e

INNER JOIN dept_emp de 
ON e.emp_no = de.emp_no

INNER JOIN departments d
ON de.dept_no = d.dept_no

WHERE d.dept_no = 'd005' OR d.dept_no = 'd007';

-- List the frequency counts, in descending order, 
-- of all the employee last names (that is, how many employees share each last name).

SELECT 
last_name, 
COUNT (last_name) AS "Frequency Counts"
From employees
GROUP BY last_name
ORDER BY "Frequency Counts" desc;