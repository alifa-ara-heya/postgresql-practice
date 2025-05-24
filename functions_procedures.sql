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

create Procedure remove_emp()
LANGUAGE plpgsql
AS
$$
    BEGIN
        DELETE FROM employees where employee_id = 28;
    END;
$$;