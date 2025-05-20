-- Active: 1747519333606@@localhost@5432@ph

SHOW timezone;

--timestamp: date+ time+ timezone
SELECT now();

CREATE TABLE timeZ (
    ts TIMESTAMP WITHOUT TIME ZONE,
    tsz TIMESTAMP WITH TIME ZONE
);

INSERT INTO
    timeZ
VALUES (
        '2024-12-05 10:45:07',
        '2024-12-05 10:45:07'
    );

SELECT * FROM timeZ;
--2024-12-05 10:45:07	  2024-12-05 10:45:07-05

--show today's date
SELECT CURRENT_DATE;

--another way to see today's date
SELECT now()::date;
--date casting

--time right now
SELECT now()::time;
--time casting

SELECT to_char(now(), 'mm-dd-yyyy');
--converts timestamp to string according to the given format, to_char(timestamp, text);

SELECT to_char(now(), 'Mon');
--May
SELECT to_char(now(), 'Month');
--May
SELECT to_char(now(), 'MONTH');
--MAY
SELECT to_char(now(), 'DDD');
--DDD means day of year

--what's the day before one year from today?
SELECT CURRENT_DATE - INTERVAL '1 year';
--2024-05-20 00:00:00

SELECT CURRENT_DATE - INTERVAL '1 year 2 month';
--2024-03-20 00:00:00

--age
SELECT age (CURRENT_DATE, '1995-11-1') --age(timestamp,timestamp) Subtract arguments, producing a “symbolic” result that uses years and months, rather than just days, result example {"years":29,"months":6,"days":19}

-- we can calculate age of people by this age() method
SELECT *, age (CURRENT_DATE, dob) FROM students;

--extracting year from a string
SELECT extract( YEAR FROM '2023-08-12'::date );
--2023

SELECT extract( MONTH FROM '2023-08-12'::date );
--8

SELECT extract( DAY FROM '2023-08-12'::date );
--12

SELECT 1::Boolean;
--true

SELECT 'n'::Boolean;
-- false
SELECT 'y'::Boolean;
-- true
SELECT 'f'::Boolean;
-- false
SELECT 't'::Boolean;
-- true
SELECT 'no'::Boolean;
-- false
SELECT 'yes'::Boolean;
-- true