SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM deptemp;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM deptmanager;


--List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no,
       employees.first_name, 
	   employees.last_name, 
	   employees.sex,
	   salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,
	   last_name,
	   hire_date
FROM employees
WHERE hire_date = '1986/01/01';


--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT deptmanager.dept_no,
	   departments.dept_name,
	   deptmanager.emp_no, 
	   employees.last_name, 
	   employees.first_name
FROM deptmanager
INNER JOIN departments on deptmanager.dept_no = departments.dept_no
INNER JOIN employees on deptmanager.emp_no = employees.emp_no;



--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT deptemp.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM deptemp
INNER JOIN employees on deptemp.emp_no = employees.emp_no
INNER JOIN departments on deptemp.dept_no = departments.dept_no;


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name,
	   last_name,
	   sex
FROM employees
WHERE first_name = 'Hercules' 
AND last_name like 'B%';


--List each employee in the Sales department, including their employee number, last name, and first name.

SELECT emp_no,
       last_name,
       first_name
FROM employees
WHERE emp_no IN (
    SELECT emp_no
    FROM deptemp
    WHERE dept_no IN (
        SELECT dept_no
        FROM departments
        WHERE dept_name = 'Sales'
    )
);


--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name,
	   employees.first_name,
	   departments.dept_name
FROM deptemp
INNER JOIN employees ON deptemp.emp_no = employees.emp_no
INNER JOIN departments ON deptemp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(*)
FROM employees
group by 1
order by 2 DESC;
