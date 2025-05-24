create Function count_emp()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees;
$$;

--calling the function
SELECT count_emp ();

create Function del_emp()
RETURNS void --because does not return anything
LANGUAGE SQL
AS
$$
   DELETE FROM employees where employee_id = 30;
$$;

SELECT del_emp ();

SELECT * FROM employees;

--functions with parameters
create or REPLACE Function del_emp_by_id(p_emp_id int)
RETURNS void
LANGUAGE SQL
AS
$$
   DELETE FROM employees where employee_id = p_emp_id;
$$;

SELECT del_emp_by_id (29);

create Procedure remove_emp()
LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM employees where employee_id = 28;
    END;
$$;

CALL remove_emp ();

SELECT employee_id FROM employees WHERE employee_id = 10;

--gives 10
create Procedure remove_emp_by_id(p_emp_id int)
LANGUAGE plpgsql
AS
$$
    DECLARE --for declaring variables
    test_var int;
    BEGIN
        SELECT employee_id into test_var FROM employees where employee_id = p_emp_id;
        DELETE FROM employees where employee_id = test_var;

        RAISE NOTICE 'Employee Removed Successfully';
    END
$$;

CALL remove_emp_by_id (11);