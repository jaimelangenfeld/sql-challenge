--1. List the employee number, last name, first name, sex, and salary of each employee

SELECT employee_number, last_name, first_name, sex, salary
FROM employees
JOIN salaries USING (employee_number);


--2. List the first name, last name, and hire date for the employees hired in 1986

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;


--3. List the manager of each department along with their department number, 
--department name, employee number, last name, and first name

SELECT dm.employee_number AS manager_employee_number, 
       d.department_number, d.department_name, 
       e.employee_number, e.last_name, e.first_name
FROM department_manager dm
JOIN departments d ON dm.department_number = d.department_number
JOIN employees e ON dm.employee_number = e.employee_number;

--4. List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name

SELECT e.employee_number, e.last_name, e.first_name, d.department_number, d.department_name
FROM employees e
JOIN department_employees de ON e.employee_number = de.employee_number
JOIN departments d ON de.department_number = d.department_number;


--5. List first name, last name, and sex of each employee whose first name is Hercules 
--and whose last name begins with the letter B

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name

SELECT e.employee_number, e.last_name, e.first_name
FROM employees e
JOIN department_employees de ON e.employee_number = de.employee_number
JOIN departments d ON de.department_number = d.department_number
WHERE d.department_name = 'Sales';

--7. List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name

SELECT e.employee_number, e.last_name, e.first_name, d.department_name
FROM employees e
JOIN department_employees de ON e.employee_number = de.employee_number
JOIN departments d ON de.department_number = d.department_number
WHERE d.department_name IN ('Sales', 'Development');

--8. List the frequency counts, in descending order, of all the employee last names
--(how many employees share each last name)

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

