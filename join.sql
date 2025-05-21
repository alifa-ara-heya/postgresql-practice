CREATE TABLE "user" (
    id SERIAL PRIMARY KEY,
    userName VARCHAR(25) NOT NULL
)

CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    user_id INTEGER REFERENCES "user" (id)
);

INSERT INTO
    "user" (username)
VALUES ('ayesha'),
    ('fatima'),
    ('khadija'),
    ('maryam');

INSERT INTO
    post (title, user_id)
VALUES ('My first post!', 2),
    ('Just another update!', 1),
    ('Learning SQL is fun!', 1),
    ('Post number four!', 4),
    ('Quick post for practice.', 2);

DROP TABLE post;

DROP TABLE "user";

SELECT * FROM "user";

SELECT * FROM post;

-- how can we see the post title and the username in a table- when posts and usernames are in different tables? we will use JOIN here

--inner join
SELECT title, userName
FROM post
    JOIN "user" ON post.user_id = "user".id;
--filters out the unrelated posts and users, only show the data which meet condition

--if we want to see both of the combined tables
SELECT * FROM post JOIN "user" ON post.user_id = "user".id;

--if we want to the id of the user table, sql can not differentiate between the same column name 'id'. So we need to provide context.
SELECT "user".id FROM post JOIN "user" ON post.user_id = "user".id;

SELECT post.id FROM post JOIN "user" ON post.user_id = "user".id;

--we can alias the name of the tables
SELECT p.id FROM post p JOIN "user" u ON p.user_id = u.id;

--'as' is also ok
SELECT p.id FROM post AS p JOIN "user" AS u ON p.user_id = u.id;

INSERT INTO
    post (title, user_id)
VALUES (
        'this is test post title',
        NULL
    );

--if we run the join query SELECT * FROM post JOIN "user" ON post.user_id = "user".id; now, the last post will not be shown here. so, if we need to select/view the whole post table along with the user table, we can use Left join. This is include all of the posts

SELECT * FROM post AS p LEFT JOIN "user" u ON p.user_id = u.id;
--here post is in left to see all posts

--similarly if we need to see all of the user table, we can use RIGHT JOIN.
SELECT * FROM post AS p RIGHT JOIN "user" AS u ON p.user_id = u.id;
--here user is in right to see all users

---=table order matters

--full join
SELECT * FROM post AS p FULL OUTER JOIN "user" u ON p.user_id = u.id;
--will list both tables as a single table, even contain the null values

-- Create employees table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Create department table
CREATE TABLE department (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert sample data into employees
INSERT INTO employees VALUES (1, 'John Doe', 101);

INSERT INTO employees VALUES (2, 'Jane Smith', 102);

INSERT INTO department VALUES (101, 'Human Resources');

INSERT INTO department VALUES (102, 'Marketing');

SELECT * FROM employees;

SELECT * FROM department;

--less common joins
--cross join
SELECT * FROM employees CROSS JOIN department;

--natural join
SELECT * FROM employees NATURAL JOIN department;
--must have a common column