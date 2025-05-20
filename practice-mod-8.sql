-- Active: 1747519333606@@localhost@5432@practice@public
/* 
Demo Table Overview
All of the following tasks are based on a sample table named students. Use this as a reference while solving the following tasks. Here's a quick overview of the structure:
Column Name    
Description
id           
Auto-incremented primary key
roll          
Unique roll number for each student
name         
Name of the student
age          
Age of the student
department    
Student’s department (e.g., CSE, EEE)
score        
Score achieved by the student
status       
Academic status (e.g., passeded, failed)
last_login    
Last login date
*/

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    roll BIGINT UNIQUE,
    student_name VARCHAR(50),
    age INT,
    department VARCHAR(100),
    score DECIMAL(5, 2),
    status VARCHAR(6),
    last_login DATE
)

--renaming column status to academic_status
ALTER TABLE students RENAME COLUMN status TO academic_status;

INSERT INTO
    students (
        roll,
        student_name,
        age,
        department,
        score,
        academic_status,
        last_login
    )
VALUES (
        1001,
        'John Doe',
        20,
        'Computer Science',
        85.50,
        'passed',
        '2025-05-18'
    ),
    (
        1002,
        'Jane Smith',
        22,
        'Electrical Engineering',
        92.30,
        'passed',
        '2025-05-17'
    ),
    (
        1003,
        'Alice Johnson',
        21,
        'Mechanical Engineering',
        78.25,
        'failed',
        '2025-05-16'
    ),
    (
        1004,
        'Bob Brown',
        23,
        'Civil Engineering',
        65.75,
        'failed',
        '2025-05-15'
    ),
    (
        1005,
        'Charlie Davis',
        20,
        'Mathematics',
        88.90,
        'passed',
        '2025-05-14'
    ),
    (
        1006,
        'David Evans',
        24,
        'Physics',
        79.50,
        'passed',
        '2025-05-13'
    ),
    (
        1007,
        'Emma Wilson',
        21,
        'Chemistry',
        95.20,
        'passed',
        '2025-05-12'
    ),
    (
        1008,
        'Frank Harris',
        22,
        'Biology',
        60.10,
        'failed',
        '2025-05-11'
    ),
    (
        1009,
        'Grace Lewis',
        23,
        'Philosophy',
        72.80,
        'passed',
        '2025-05-10'
    ),
    (
        1010,
        'Henry Clark',
        21,
        'Computer Science',
        82.40,
        'passed',
        '2025-05-09'
    ),
    (
        1011,
        'Isabella Walker',
        22,
        'Engineering',
        64.00,
        'failed',
        '2025-05-08'
    ),
    (
        1012,
        'Jack Robinson',
        23,
        'Mathematics',
        91.60,
        'passed',
        '2025-05-07'
    ),
    (
        1013,
        'Liam Young',
        20,
        'History',
        77.90,
        'passed',
        '2025-05-06'
    ),
    (
        1014,
        'Mia King',
        21,
        'Economics',
        68.50,
        'failed',
        '2025-05-05'
    ),
    (
        1015,
        'Noah Scott',
        22,
        'Sociology',
        85.00,
        'passed',
        '2025-05-04'
    );

--1. Add a column email (VARCHAR) to the existing students table.
ALTER TABLE students ADD COLUMN email VARCHAR(50);

SELECT * FROM students;

--2. Rename the column email to student_email.
ALTER TABLE students RENAME COLUMN email TO student_email;

--3. Add a UNIQUE constraint to student_email.
ALTER TABLE students
ADD CONSTRAINT unique_email UNIQUE (student_email);

--4. Add a PRIMARY KEY to a new table named courses.
CREATE TABLE courses (
    subject_id SERIAL,
    subject_name VARCHAR(50),
    teacher VARCHAR(50),
    PRIMARY KEY (subject_id, subject_name)
);

--5. Drop a column from any existing table.
ALTER TABLE students DROP COLUMN student_email;

--56. Write a query to find all students who have a score greater than 80 and not null.
SELECT * FROM students WHERE (score > 80) AND (score IS NOT NULL);

--7. Use the NOT operator to exclude students from a specific department.
SELECT * FROM students WHERE NOT department = 'Computer Science';

--8. Fetch students whose names start with ‘A’ using LIKE and ILIKE.
SELECT * FROM students WHERE student_name LIKE 'A%';

SELECT * FROM students WHERE student_name ILIKE 'a%';

--9. Select all students whose age is between 18 and 25.
SELECT * FROM students WHERE age BETWEEN 18 AND 25;

--10.Retrieve rows using IN for a specific set of roll numbers.
SELECT * FROM students WHERE roll IN (1004, 1010);

--11. Count how many students exist in the students table.
SELECT count(*) FROM students;

--12. Find the average score of students in a specific department.
SELECT avg(score)
FROM students
WHERE
    department = 'Computer Science';

--13. Update the status of students who scored less than 50 to 'failed'.

--counting how many students scored less than 50;
SELECT count(*) FROM students WHERE score < 50;
--0

--so let's make a student's score less than 50;
UPDATE students SET score = 24 WHERE student_id = 2;
--updating status
UPDATE students SET academic_status = 'failed' WHERE score < 50;