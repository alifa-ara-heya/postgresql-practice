--views are virtual tables generated from the result of a SQL query
SELECT * FROM employees;

CREATE VIEW dept_avg_salary AS
SELECT department_name, avg(salary)
FROM employees
GROUP BY
    department_name;

SELECT * FROM dept_avg_salary;
--same result

--simplifying complex queries
--improves security
--enhanced data abstraction