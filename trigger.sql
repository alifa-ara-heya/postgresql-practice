-- A trigger is a database object in PostgreSQL (and other database management systems) that automatically executes a specified set of actions in response to certain database events or conditions.

-- Table-level Events:
--     INSERT, UPDATE, DELETE, TRUNCATE

-- Database-Level Events:
--     Database Startup, Database Shutdown, Connection start and end etc

-- CREATE TRIGGER trigger_name
-- {BEFORE | AFTER | INSTEAD OF} {INSERT | UPDATE | DELETE | TRUNCATE}
-- ON table_name
-- [FOR EACH ROW]
-- EXECUTE FUNCTION function_name();

SELECT * FROM employees

CREATE TRIGGER TR BEFORE DELETE ON employees FOR EACH ROW EXECUTE FUNCTION function_name();

--suppose we want to store the user's data who has just been deleted.

CREATE TABLE my_users (
    user_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO
    my_users
VALUES ('Mezba', 'mezba@mail.com'),
    ('Mir', 'mir@mail.com');

SELECT * FROM my_users;

CREATE TABLE deleted_users_audit (
    deleted_user_name VARCHAR(50),
    deletedAt TIMESTAMP
)

SELECT * FROM deleted_users_audit;

--trigger function
CREATE or replace FUNCTION save_deleted_user()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        INSERT into deleted_users_audit VALUES(OLD.user_name, now()); --old, because we need the data before deletion
        RAISE NOTICE 'Deleted user audit log created';
        RETURN old;
    end
$$

create or replace trigger save_deleted_user_trigger
before DELETE
on my_users
for each row
EXECUTE function save_deleted_user();

DELETE FROM my_users WHERE user_name = 'Mir'