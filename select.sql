CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    firstName VARCHAR(50) NOT NULL,
    lastName VARCHAR(50) NOT NULL,
    age INT,
    grade char(2),
    course VARCHAR(50),
    email VARCHAR(100),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(50)
);

INSERT INTO
    students (
        firstName,
        lastName,
        age,
        grade,
        course,
        email,
        dob,
        blood_group,
        country
    )
VALUES (
        'Alice',
        'Smith',
        20,
        'A+',
        'Mathematics',
        'alice.smith@example.com',
        '2003-04-12',
        'O+',
        'USA'
    ),
    (
        'Bob',
        'Johnson',
        22,
        'B-',
        'Physics',
        'bob.johnson@example.com',
        '2001-09-15',
        'A+',
        'Canada'
    ),
    (
        'Catherine',
        'Brown',
        19,
        'A',
        'Chemistry',
        'catherine.brown@example.com',
        '2004-01-23',
        'B+',
        'UK'
    ),
    (
        'David',
        'Jones',
        21,
        'C',
        'Biology',
        'david.jones@example.com',
        '2002-06-30',
        'AB+',
        'Australia'
    ),
    (
        'Eva',
        'Garcia',
        23,
        'B+',
        'Computer Science',
        'eva.garcia@example.com',
        '2000-11-11',
        'O-',
        'Spain'
    ),
    (
        'Frank',
        'Martinez',
        20,
        'A-',
        'Engineering',
        'frank.martinez@example.com',
        '2003-08-19',
        'A-',
        'Mexico'
    ),
    (
        'Grace',
        'Lee',
        18,
        'B',
        'Economics',
        'grace.lee@example.com',
        '2005-02-05',
        'B-',
        'South Korea'
    ),
    (
        'Henry',
        'Wilson',
        22,
        'A',
        'History',
        'henry.wilson@example.com',
        '2001-07-22',
        'O+',
        'New Zealand'
    ),
    (
        'Isabel',
        'Moore',
        21,
        'C+',
        'Philosophy',
        'isabel.moore@example.com',
        '2002-03-14',
        'AB-',
        'Ireland'
    ),
    (
        'Jack',
        'Taylor',
        19,
        'B+',
        'Political Science',
        'jack.taylor@example.com',
        '2004-10-01',
        'A+',
        'USA'
    ),
    (
        'Katherine',
        'Anderson',
        20,
        'A',
        'Sociology',
        'katherine.anderson@example.com',
        '2003-05-17',
        'B+',
        'Canada'
    ),
    (
        'Liam',
        'Thomas',
        23,
        'B-',
        'Psychology',
        'liam.thomas@example.com',
        '2000-12-09',
        'O-',
        'UK'
    ),
    (
        'Mia',
        'Jackson',
        18,
        'A+',
        'Art',
        'mia.jackson@example.com',
        '2005-07-28',
        'AB+',
        'Australia'
    ),
    (
        'Noah',
        'White',
        21,
        'B',
        'Music',
        'noah.white@example.com',
        '2002-01-06',
        'A-',
        'Spain'
    ),
    (
        'Olivia',
        'Harris',
        22,
        'C',
        'Literature',
        'olivia.harris@example.com',
        '2001-09-29',
        'B-',
        'Mexico'
    ),
    (
        'Paul',
        'Martin',
        20,
        'B+',
        'Business',
        'paul.martin@example.com',
        '2003-04-08',
        'O+',
        'South Korea'
    ),
    (
        'Quinn',
        'Thompson',
        19,
        'A-',
        'Law',
        'quinn.thompson@example.com',
        '2004-11-12',
        'AB-',
        'New Zealand'
    ),
    (
        'Rachel',
        'Garcia',
        23,
        'B',
        'Medicine',
        'rachel.garcia@example.com',
        '2000-06-18',
        'O-',
        'Ireland'
    ),
    (
        'Samuel',
        'Martinez',
        21,
        'C+',
        'Engineering',
        'samuel.martinez@example.com',
        '2002-08-04',
        'A+',
        'USA'
    ),
    (
        'Tina',
        'Robinson',
        18,
        'A',
        'Nursing',
        'tina.robinson@example.com',
        '2005-03-20',
        'B+',
        'Canada'
    );

SELECT * FROM students;

SELECT email FROM students;

-- viewing multiple columns
SELECT email, age FROM students;

-- alias
SELECT email AS studentEmail FROM students;

SELECT email AS "student email" FROM students;
--use double quote when trying to retrieve column

--ascending order
SELECT * FROM students ORDER BY firstName ASC;
--A-Z

SELECT * FROM students ORDER BY firstName DESC;
--Z-A

--gives us the country list from A to Z
SELECT country FROM students ORDER BY country ASC;

--To see records in ID order, use:
SELECT * FROM students ORDER BY student_id;

--but what if we want to view only distinct countries;
SELECT DISTINCT country FROM students;
--gives us unique countries

--data filtering
-- view students only from the USA (conditional filtering)
SELECT * FROM students WHERE country = 'USA';
--use single quote

-- select students with A grade in physics (multiple conditions)
SELECT * FROM students WHERE grade = 'A' AND course = 'Chemistry';

--select students from the USA or Canada
SELECT * FROM students WHERE country = 'USA' OR country = 'Canada';

--select students from the USA or Canada and the age is 20
SELECT *
FROM students
WHERE (
        country = 'USA'
        OR country = 'Canada'
    )
    AND age = 20;

--select students older than 20 years old;
SELECT * FROM students WHERE age > 20;

--select students older than 20 years old with course history;
SELECT * FROM students WHERE age > 20 AND course = 'History';

--select students except 20 years old
SELECT * FROM students WHERE age <> 20;
--or where age != 20 or where NOT age = 20;

--make every letter of firstName uppercase
SELECT upper(firstName) FROM students;

--make every letter of firstName uppercase and view the whole table
SELECT upper(firstName) AS firstNameInUppercase, * FROM students;

--view the full name
SELECT concat(firstName, ' ', lastName) FROM students;

SELECT length(firstName) FROM students;

-- average age
SELECT avg(age) FROM students;

SELECT max(age) FROM students;

-- how many rows
SELECT count(*) FROM students

-- find the longest name
SELECT max(length(firstName)) FROM students;

SELECT * FROM students WHERE email IS NULL;
-- WHERE email = NULL; --comparing with null, always returns null, not true or false

-- find the student with this email, rachel.garcia@example.com
SELECT * FROM students WHERE email = 'rachel.garcia@example.com';

SELECT * FROM students WHERE email IS NULL;

/* @Scalar functions
UPPER() Converts a string to uppercase.
LOWER() Converts a string to lowercase.
CONCAT() Concatenates two or more strings.
LENGTH() Returns the number of characters in a string.

@Aggregate functions
AVG() Calculate the average of a set of values.
MAX() Returns the max value in a set.
MIN() Returns the minimum value in a set.
SUM() Calculates the sum of values in a set.
COUNT() Counts the number of rows in a set. */

-- using a default placeholder when there is a null value

SELECT COALESCE(email, 'Email Not Provided'), age, blood_group
FROM students;

-- updating a student to have null email (not in course module)
UPDATE students SET email = NULL WHERE student_id = 4;

SELECT * FROM students;

--view students only from USA, UK, and Canada
SELECT *
FROM students
WHERE
    country = 'USA'
    OR country = 'Canada'
    OR country = 'UK';

--short way with IN operator (to shorten multiple OR keyword)
SELECT * FROM students WHERE country IN ('USA', 'UK', 'Canada');

--view students not from USA, UK, and Canada
SELECT * FROM students WHERE country NOT IN ('USA', 'UK', 'Canada');

-- view students with age from 19 to 22
SELECT * FROM students WHERE age BETWEEN 19 AND 22;

SELECT *
FROM students
WHERE
    dob BETWEEN '2001-01-01' AND '2002-12-12';

-- find the first names which contain 'am' at the last
SELECT * FROM students WHERE firstName LIKE '%am';

--names start with a
SELECT * FROM students WHERE firstName LIKE 'A%';
--like is case-sensitive

SELECT * FROM students WHERE firstname ILIKE 'a%';
--ILIKE is case insensitive

--names in which the third letter is 'a', one underscore means one character

SELECT * FROM students WHERE firstname LIKE '__a';
--Eva, Mia

SELECT * FROM students WHERE lastname LIKE '__o__';
--Brown, Moore

-- pagination with limit and offset
--LIMIT gives limited data
SELECT * FROM students LIMIT 5;
--shows first 5 data

SELECT * FROM students WHERE country IN ('USA', 'Canada') LIMIT 3;
--gives first 3 countries who live in the USA, Canada

SELECT * FROM students LIMIT 5 OFFSET 2;
--gives you first 5 students except the first two students, so gives students from 3 to 8 removing the 1 to 2;

SELECT * FROM students LIMIT 5 OFFSET 5 * 0;
--1-6

SELECT * FROM students LIMIT 5 OFFSET 5 * 1;
--7-11

SELECT * FROM students LIMIT 5 OFFSET 5 * 2;
--12-17

SELECT * FROM students;

--delete the whole table

DELETE FROM students;
--running this will delete the whole table;

-- delete students who got B
DELETE FROM students WHERE grade = 'B';

DELETE FROM students WHERE grade = 'C+' AND country = 'Ireland';

-- update
UPDATE students
SET
    email = 'default2@test.com',
    age = 30
WHERE
    student_id = 5