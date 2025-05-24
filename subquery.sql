-- Active: 1747519333606@@localhost@5432@ph
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    department_name VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE
);

INSERT INTO
    employees (
        employee_name,
        department_name,
        salary,
        hire_date
    )
VALUES (
        'John Doe',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Jane Smith',
        'Marketing',
        75000.50,
        '2021-05-22'
    ),
    (
        'Ethan Parker',
        'HR',
        85000.00,
        '2021-08-08'
    ), -- Highest HR salary
    (
        'Natalie Reed',
        'HR',
        61000.00,
        '2022-04-10'
    ),
    (
        'Bob Johnson',
        'Finance',
        80000.75,
        '2020-11-15'
    ),
    (
        'Alice Williams',
        'IT',
        90000.25,
        '2019-08-05'
    ),
    (
        'David Lee',
        'Sales',
        65000.50,
        '2020-03-18'
    ),
    (
        'Liam Turner',
        'HR',
        64000.00,
        '2021-03-14'
    ),
    (
        'Chloe Rivera',
        'HR',
        82000.00,
        '2022-02-20'
    ),
    (
        'Sara Brown',
        'Engineering',
        70000.00,
        '2021-09-28'
    ),
    (
        'Aiden Martinez',
        'IT',
        88000.00,
        '2020-10-10'
    ),
    (
        'Mike Miller',
        'Customer Support',
        55000.75,
        '2022-02-05'
    ),
    (
        'Sophia Watson',
        'Marketing',
        87000.00,
        '2022-03-03'
    ),
    (
        'Emily Davis',
        'Administration',
        59000.80,
        '2018-12-15'
    ),
    (
        'Mason Brooks',
        'Engineering',
        86000.00,
        '2019-11-11'
    ),
    (
        'Isabella Powell',
        'Finance',
        89000.00,
        '2021-06-06'
    ),
    (
        'Logan Simmons',
        'Sales',
        91000.00,
        '2022-07-07'
    ),
    (
        'Chris Wilson',
        'Research',
        72000.50,
        '2020-09-07'
    ),
    (
        'Amy White',
        'Quality Assurance',
        68000.25,
        '2021-11-09'
    ),
    (
        'John Johnson',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Jessica Thompson',
        'Marketing',
        76000.55,
        '2021-06-05'
    ),
    (
        'Michael Harris',
        'Finance',
        81000.25,
        '2020-12-25'
    ),
    (
        'Emma Martinez',
        'IT',
        92000.50,
        '2021-05-30'
    ),
    (
        'James Taylor',
        'Sales',
        66000.00,
        '2020-02-10'
    ),
    (
        'Sophia Anderson',
        'Engineering',
        72000.75,
        '2021-10-10'
    ),
    (
        'William Jackson',
        'Customer Support',
        52500.25,
        '2022-01-15'
    ),
    (
        'Olivia Nelson',
        'Administration',
        59500.40,
        '2019-12-17'
    ),
    (
        'Daniel White',
        'Research',
        73000.50,
        '2020-05-20'
    ),
    (
        'Mia Thomas',
        'Quality Assurance',
        68500.00,
        '2021-11-30'
    ),
    (
        'Emily Garcia',
        'Marketing',
        76000.55,
        '2021-06-15'
    ),
    (
        'Christopher Allen',
        'Finance',
        82000.75,
        '2020-10-25'
    ),
    (
        'Madison Hall',
        'Sales',
        67000.00,
        '2019-09-25'
    ),
    (
        'Abigail Torres',
        'Engineering',
        73000.00,
        '2021-10-20'
    );

SELECT * FROM employees;

DROP TABLE employees

--retrieve all employees whose salary is greater than the highest salary of the HR department
--ethan parker - highest salary

SELECT max(salary) FROM employees WHERE department_name = 'HR';
--85000, the highest salary in hr department
SELECT *
FROM employees
WHERE
    salary > (
        SELECT max(salary)
        FROM employees
        WHERE
            department_name = 'HR'
    );

--can return a single value
--can return multiple rows
--can return a single column

SELECT *, ( SELECT sum(salary) FROM employees ) FROM employees;

--Find all employees who work in the same departments as 'Jane Smith'

-- Step 1: Find departments Jane Smith works in (returns multiple rows if she works in many)
SELECT department_name
FROM employees
WHERE
    employee_name = 'Jane Smith';
--returns a single value 'MArketing'

-- Step 2: Use that result in a subquery to get other employees in the same departments
SELECT *
FROM employees
WHERE
    department_name IN (
        SELECT department_name
        FROM employees
        WHERE
            employee_name = 'Jane Smith'
    );

--show the sum of salary in each department with subquery
SELECT *
FROM (
        SELECT department_name, sum(salary)
        FROM employees
        GROUP BY
            department_name
    ) AS sum_dept_salary;
--the part within bracket also works like a table