SELECT * FROM students;

SELECT country FROM students GROUP BY country;
--shows country lists by groups

SELECT country, count(*) FROM students GROUP BY country;
--shows how many students in each group of countries

SELECT country, avg(age) FROM students GROUP BY country;
--shows the average age of students in each group of countries.

--filtering `GROUP By` with 'having

--filter group of countries having students with average age above 20.
SELECT country, avg(age)
FROM students
GROUP BY
    country
HAVING
    avg(age) > 20;

--why not WHERE, because WHERE runs on individual data, but HAVING works on group of data

--count students born in each year
SELECT extract(
        YEAR
        FROM dob
    ) AS birth_year, count(*)
FROM students
GROUP BY
    birth_year;
--gives the group of years and the number of students in each year