INSERT INTO HR.DEPARTMENTS
(department_id, department_name)
VALUES (122, 'New Note');

SELECT *
FROM hr.departments;



INSERT INTO HR.DEPARTMENTS
VALUES (125, 'New Note', NULL, NULL);

DESCRIBE hr.departments;

INSERT INTO hr.employees
(employee_id, first_name, last_name, email, hire_date)
VALUES (1139, 'Louis', 'Robby', SYSDATE);

INSERT INTO hr.employees
VALUES (1994, 'Den', 'Raphealy', 'DRAPHEAL@', '515.127.4561',
        TO_DATE('FEB 3, 1999', 'MON DD, YYYY'),
        'AC_ACCOUNT', 11000, NULL, 100, 30);

DESCRIBE hr.employees;


SELECT *
FROM hr.employees
WHERE employee_id = 1994;

INSERT INTO hr.employees
VALUES (1144, 'Den', 'Raphealy', 'Em', '515.127.4561', '03-FEB-99', 'AC_ACCOUNT', 11000, NULL, 100, 30);

SELECT *
FROM hr.employees
WHERE employee_id = 1144;

SAVEPOINT s1;

ROLLBACK TO s1;

INSERT INTO hr.employees
VALUES (1146, 'Den', 'Raphealy', 'EmE', '515.127.4561', '03-FEB-99', 'AC_ACCOUNT', 11000, NULL, 100, 30);



CREATE TABLE hr.sales_reps (
  id NUMBER(8),
  name VARCHAR2(60 CHAR),
  salary NUMBER(8, 2),
  commission_pct NUMBER(8, 2),
  CONSTRAINT sales_reps_id_pk PRIMARY KEY(id)
);

CREATE SEQUENCE sales_seq
  INCREMENT BY 1
  MINVALUE 1
  NOMAXVALUE;

INSERT INTO hr.sales_reps
(id, name, salary, commission_pct)
  SELECT employee_id, last_name, salary, commission_pct
  FROM hr.employees
  WHERE job_id LIKE '%REP%';


SELECT *
FROM hr.sales_reps;

DESC hr.sales_reps;

UPDATE employees
SET department_id = 70
WHERE employee_id = 123;

INSERT INTO
  (SELECT employee_id, last_name,
         email, hire_date, job_id,
         salary, department_id
  FROM hr.employees
  WHERE department_id = 50)
VALUES
(99999, 'Taylor', 'Dtay', SYSDATE, 'ST_CLERK', 5000, 50);

SELECT *
FROM hr.employees
WHERE employee_id = 99999;

INSERT INTO (SELECT employee_id, last_name, email, hire_date, job_id, salary
             FROM hr.employees
             WHERE department_id = 50 WITH CHECK OPTION)
VALUES (99999, 'Smith', 'JSMITH',
        TO_DATE('07-JUN-99', 'DD-MON-RR'),
        'ST_CLERK', 5000);

CREATE TABLE copy_emp;

MERGE INTO copy_emp c
  USING hr.employees e
  ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
  UPDATE SET
    c.first_name = e.first_name,
    c.last_name = e.last_name
WHEN NOT MATCHED THEN
  INSERT VALUES (e.employee_id, e.first_name, e.last_name, e.email, e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, e.department_id);

CREATE TABLE rhr LIKE hr.employees;

CREATE TABLE copy_emp AS SELECT * FROM hr.employees;

DESCRIBE copy_emp;

SELECT *
FROM copy_emp;

TRUNCATE TABLE copy_emp;

SELECT * FROM copy_emp;

SAVEPOINT savee;

ROLLBACK TO savee;

UNDEFINE savee;

COMMIT;


----------------------------------------
-- LAB 8 DML
----------------------------------------

-- 8.1
CREATE TABLE my_employee (
  id NUMBER(4),
  last_name VARCHAR2(25),
  first_name VARCHAR(25),
  userid VARCHAR2(8),
  salary NUMBER(9, 2)
  CONSTRAINT emp_pk PRIMARY KEY(id)
);

CREATE SEQUENCE emp_seq
MINVALUE 0
NOMAXVALUE
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- 8.2
DESC my_employee;

-- 8.3
INSERT INTO my_employee
VALUES
(emp_seq.nextval, 'Ralph', 'Patel', 'rpatel', 895);

-- 8.4
INSERT INTO my_employee
(id, last_name, first_name, userid, salary)
VALUES
(emp_seq.nextval, 'Dancs', 'Betty', 'bdance', 860);

-- 8.5
SELECT *
FROM my_employee;

-- 8.6
DEFINE last_name = &last_name;
DEFINE first_name = &first_name;
DEFINE salary = &salary;
INSERT INTO my_employee
VALUES
(emp_seq.nextval, '&last_name', '&first_name', LOWER(CONCAT(SUBSTR('&first_name', 0, 1), SUBSTR('&last_name', 0, 7))), &salary);
UNDEFINE last_name, first_name, salary;

-- 8.9
TRUNCATE TABLE my_employee;

-- 8.10
UPDATE my_employee
SET last_name = 'Drexler'
WHERE id = 10;

-- 8.11
UPDATE my_employee
SET salary = 1000
WHERE salary < 900;

-- 8.13
DELETE
FROM my_employee
WHERE last_name = 'Ralph' AND first_name = 'Patel';

-- 8.18
SAVEPOINT newsave;

-- 8.19
DELETE
FROM my_employee;

ROLLBACK TO newsave;

COMMIT;