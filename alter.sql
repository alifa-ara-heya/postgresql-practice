-- Active: 1747519333606@@localhost@5432@ph
SELECT * FROM person3;

-- add column
ALTER TABLE person3
ADD COLUMN email VARCHAR(25) DEFAULT 'default@email.com' NOT NULL;

-- inserting column
INSERT INTO person3 VALUES ( 5, 'test2', 45, 'test@gmail.com' );

-- deleting column
ALTER TABLE person3 DROP COLUMN email;

-- renaming column
ALTER TABLE person3 RENAME COLUMN age TO user_age;

-- change data type
ALTER TABLE person3 ALTER COLUMN user_name TYPE VARCHAR(50);

-- add constraint in existing column
ALTER TABLE person3 ALTER COLUMN user_age SET NOT NULL;
--DEFAULT, UNIQUE, PRIMARY KEY, FOREIGN KEY will not work like this, because they can accept multiple values

-- deleting constraint
ALTER TABLE person3 ALTER COLUMN user_age DROP NOT NULL;
--DEFAULT, UNIQUE, PRIMARY KEY, FOREIGN KEY will not work

--
ALTER TABLE person3 ALTER COLUMN user_name DROP UNIQUE;
-- will show syntax error

ALTER TABLE person3 ADD COLUMN user_address VARCHAR(255);

INSERT INTO person3 VALUES (11, 'test3', 20, 'sylhet');

-- add constraint Unique
ALTER TABLE person3
ADD CONSTRAINT unique_person3_user_address UNIQUE (user_address);

--drop constraint unique
ALTER TABLE person3 DROP CONSTRAINT unique_person3_user_address;