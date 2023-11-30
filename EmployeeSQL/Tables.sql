-- Create departments table

CREATE TABLE departments (
    department_number VARCHAR(10) PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL
);

SELECT * FROM departments

-- Create employees table
CREATE TABLE employees (
    employee_number INT PRIMARY KEY,
    employee_title_id VARCHAR(10),
    birthdate DATE,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    sex CHAR(1),
    hire_date DATE
);

SELECT * FROM employees


-- Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(255)
);


SELECT * FROM titles

-- Create salaries table
CREATE TABLE salaries (
    employee_number INT,
    salary INT,
    FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);

SELECT * FROM salaries

-- Create department_employees table
CREATE TABLE department_employees (
    employee_number INT,
    department_number VARCHAR(10),
    PRIMARY KEY (employee_number, department_number),
    FOREIGN KEY (department_number) REFERENCES departments(department_number),
    FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);

SELECT * FROM department_employees

-- Create department_manager table
CREATE TABLE department_manager (
    department_number VARCHAR(10) PRIMARY KEY,
    employee_number INT,
    FOREIGN KEY (department_number) REFERENCES departments(department_number),
    FOREIGN KEY (employee_number) REFERENCES employees(employee_number)
);

SELECT * FROM department_manager


-- Find constraint preventing department_manager table upload --duplicates
SELECT constraint_name 
FROM information_schema.table_constraints 
WHERE table_name = 'department_manager';

-- Drop constraint to allow department_manager table upload
ALTER TABLE department_manager DROP CONSTRAINT department_manager_pkey;
