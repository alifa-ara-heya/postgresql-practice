SELECT * FROM students;

CREATE TABLE departments (
    id serial PRIMARY KEY,
    name varchar(20)
);

INSERT INTO
    departments (name)
VALUES ('Science'),
    ('Arts'),
    ('Commerce'),
    ('Engineering'),
    ('Law');

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name varchar(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE CASCADE,
    last_login DATE
)

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name varchar(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (id) ON DELETE SET NULL,
    last_login DATE
)

CREATE TABLE students (
    id SERIAL PRIMARY KEY,
    name varchar(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments (id),
    last_login DATE
)

INSERT INTO
    students (
        name,
        department_id,
        last_login
    )
VALUES ('Alice', 3, '2025-02-23'),
    ('Bob', 2, '2025-03-17'),
    ('Charlie', 1, '2025-04-29'),
    ('Diana', 5, '2025-04-14'),
    ('Ethan', 2, '2025-04-01'),
    ('Fiona', 5, '2025-03-23'),
    ('George', 4, '2025-03-06'),
    ('Hannah', 2, '2025-03-23'),
    ('Ian', 4, '2025-04-07'),
    ('Jane', 3, '2025-04-10'),
    ('Kevin', 1, '2025-03-20'),
    ('Lily', 4, '2025-03-31'),
    ('Mike', 4, '2025-03-18'),
    ('Nina', 4, '2025-03-11'),
    ('Oscar', 2, '2025-02-26'),
    ('Paula', 4, '2025-03-21'),
    ('Quinn', NULL, '2025-04-26'), -- No department
    ('Rita', 4, '2025-02-23'),
    ('Steve', 3, '2025-03-10'),
    ('Tina', NULL, '2025-04-17');
-- No department

DROP TABLE students;

CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title varchar(20)
)

INSERT INTO
    courses (title)
VALUES ('Math'),
    ('Physics'),
    ('History'),
    ('Economics'),
    ('Biology'),
    ('Chemistry');

DROP TABLE courses;

DROP TABLE students;

SELECT * FROM departments;

DROP TABLE departments;

SELECT * FROM courses;

--1.Retrieve students who have logged in within the last 30 days.
SELECT name
FROM students
WHERE
    last_login >= CURRENT_DATE - INTERVAL '30 days';

--2. Extract the login month from the last_login and group students by month.
SELECT extract(
        MONTH
        FROM last_login
    ) AS login_month, count(*) AS student_count
FROM students
GROUP BY
    login_month;

SELECT extract(
        MONTH
        FROM last_login
    ) AS login_month, string_agg(name, ', ') AS student_names
FROM students
GROUP BY
    login_month,
    name;

SELECT extract(
        MONTH
        FROM last_login
    ) AS login_month, name
FROM students
GROUP BY
    login_month,
    name;

SELECT extract(
        MONTH
        FROM last_login
    ) AS login_month
FROM students

SELECT extract(
        MONTH
        FROM last_login
    )
FROM students;

SELECT extract( MONTH FROM '2025-02-23'::date );

SELECT EXTRACT(
        MONTH
        FROM last_login::date
    ) AS login_month
FROM students;

SELECT column_name, data_type
FROM information_schema.columns
WHERE
    table_name = 'students';

-- GROUP BY
--     login_month;

SELECT last_login, EXTRACT(
        MONTH
        FROM last_login
    ) AS login_month
FROM students
ORDER BY last_login;

--Count how many students logged in per month and show only those months where login count is more than 3.
SELECT extract(
        MONTH
        FROM last_login
    ) AS login_month, count(*) AS student_count
FROM students
WHERE
    last_login IS NOT NULL
GROUP BY
    extract(
        MONTH
        FROM last_login
    )
HAVING
    count(*) > 3
ORDER BY login_month;

--Create a foreign key constraint on department_id in the students table referencing departments(id).

ALTER TABLE students
ADD CONSTRAINT fk_department_id FOREIGN KEY (department_id) REFERENCES departments (id)

--Try inserting a student with a department_id that doesn’t exist and observe the behavior.
INSERT INTO
    students (
        name,
        department_id,
        last_login
    )
VALUES ('Alice', 10, '2025-02-23') --Error: insert or update on table "students" violates foreign key constraint "students_department_id_fkey"

--Delete a department and see how students are affected using ON DELETE CASCADE and ON DELETE SET NULL.
DELETE FROM departments WHERE id = 3;

--Join students and departments using INNER JOIN to display each student's department name.
SELECT
    students.name AS student_name,
    departments.name AS department_name
FROM students
    JOIN departments ON students.department_id = departments.id;
--Only includes students who have a matching department_id in the departments table (i.e., excludes students with NULL department).

--Use a LEFT JOIN to show all students including those without a department.
SELECT *
FROM students
    LEFT JOIN departments ON students.department_id = departments.id;

--Use a RIGHT JOIN to show all departments including those without students.
SELECT *
FROM students
    RIGHT JOIN departments ON students.department_id = departments.id;

SELECT
    departments.name AS department_name,
    students.name AS student_name
FROM departments
    RIGHT JOIN students ON departments.id = students.department_id;

--Perform a FULL JOIN to get all records from both students and departments.
SELECT *
FROM students
    FULL OUTER JOIN departments ON students.department_id = departments.id
ORDER BY students.id;

--Create a cross-product of all students and courses using CROSS JOIN.
SELECT * FROM students CROSS JOIN courses;

--Use NATURAL JOIN between tables that have a shared column like department_id.
SELECT * FROM students NATURAL JOIN departments;