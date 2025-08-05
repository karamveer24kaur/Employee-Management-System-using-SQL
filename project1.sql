-- STEP 1. select the schema
use project1;

-- STEP 2. create a table called employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    gender ENUM('Male', 'Female', 'Other'),
    age INT,
    hire_date DATE,
    salary INT,
    manager_id INT,
    department VARCHAR(50),
    phone_number VARCHAR(20)
);

-- refresh the schemas to see the table 

-- STEP 3. add the foreign key as employers can also be managers
ALTER TABLE employees
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

-- STEP 4. insert the data 
INSERT INTO employees
(employee_id, first_name, last_name, email, gender, age, hire_date, salary, manager_id, department, phone_number)
VALUES
(345, 'Nate', 'Henfre', 'nhenfre1@storify.com', 'Male', 47, '2023-09-11', 105492, null, 'Product Management', '843-37-5785'),
(750, 'Freeland', 'Spracklin', 'fspracklin4@cargocollective.com', 'Male', 21, '2024-04-10', 155204, null, 'R&D Manager', '104-82-6002'),
(296, 'Allina', 'Patmore', 'apatmore7@google.nl', 'Female', 40, '2024-08-31', 124350, null, 'HR Manager', '716-72-1407'),
(234, 'Robin', 'MacMenamy', 'rmacmenamy0@nsw.gov.au', 'Female', 22, '2025-04-06', 139111, 345, 'Research and Development', '616-58-5257'),
(674, 'Moses', 'Loughlin', 'moloughlin2@chron.com', 'Male', 50, '2024-04-20', 34920, 296, 'Support', '589-88-0014'),
(123, 'Shayla', 'Stove', 'sstove3@samsung.com', 'Female', 35, '2023-10-10', 67953, 296, 'Legal', '888-79-3482'),
(392, 'Gretel', 'Ivatts', 'givatts5@buzzfeed.com', 'Female', 32, '2023-10-26', 53768, 296, 'Human Resources', '171-52-565'),
(734, 'Allen', 'Twede', 'atwedee@eventbrite.com', 'Male', 28, '2024-01-26', 111625, 345, 'Engineering', '799-47-3972'),
(193, 'Elli', 'Sidon', 'esidon1f@istockphoto.com', 'Female', 43, '2023-08-23', 65276, 750, 'Business Development', '648-63-2852'),
(934, 'Alard', 'Clows', 'aclowsr@biglobe.ne.jp', 'Male', 26, '2025-06-02', 91279, 750, 'Business Development', '555-25-7477');

-- STEP 5. select the table and see the data
select * from employees;

-- List Employees by Department
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- Average Salary by Department
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department;

-- see the gender disparity 
SELECT gender, COUNT(*) AS total_employees
FROM employees
GROUP BY gender;

-- see how many managers are there and segregate them according to gender
SELECT e.gender, COUNT(*) AS total_managers
FROM employees e
WHERE e.employee_id IN (
    SELECT DISTINCT manager_id
    FROM employees
    WHERE manager_id IS NOT NULL
)
GROUP BY e.gender;

-- see employess and their departments with salary less than 50000
SELECT first_name, last_name, department, salary
FROM employees
WHERE salary < 50000;

-- see employees with salary more than 100000
SELECT first_name, last_name, department, salary
FROM employees
WHERE salary > 100000;

-- lets say the research team did a good job and deserves a 10% raise,
-- revise the salary of Robin and Freeland and show the revised salary

-- to disable the safe mode for updates, so that we can update without using the primary key columns also
SET SQL_SAFE_UPDATES = 0;

-- update Their Salaries by 10%
UPDATE employees
SET salary = salary * 1.10
WHERE (first_name = 'Robin' AND last_name = 'MacMenamy')
   OR (first_name = 'Freeland' AND last_name = 'Spracklin');

-- Check Their Revised Salaries
SELECT first_name, last_name, department, salary
FROM employees
WHERE (first_name = 'Robin' AND last_name = 'MacMenamy')
   OR (first_name = 'Freeland' AND last_name = 'Spracklin');

select * from employees;











