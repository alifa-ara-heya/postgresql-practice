--a database index is a strategically designed data structure that enhances the speed of data retrieval activities in a database table

SELECT * FROM employees;

EXPLAIN ANALYSE
SELECT *
FROM employees
WHERE
    employee_name = 'William Jackson';

CREATE INDEX idx_employees_employee_name --idx_table-name_column-name
ON employees (employee_name)

SHOW data_directory;