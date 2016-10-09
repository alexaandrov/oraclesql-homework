ALTER TABLE dept80
ADD (job_id VARCHAR2(9));

DESC dept80;

SELECT * FROM dept80;

ALTER TABLE dept80
MODIFY (last_name NUMBER(10));

DROP TABLE dept80;

CREATE TABLE dept80
  AS
    SELECT employee_id, last_name,
           salary * 12 ANNSAL,
           hire_date
    FROM   hr.employees
    WHERE department_id = 80;


SELECT * FROM dept80;

RENAME dept80 TO dept90;

SELECT table_name
FROM user_tables;

TRUNCATE TABLE dept90;

SELECT * FROM dept90;

COMMENT ON TABLE table_name
IS 'Employee Information';


ALTER TABLE dept80
DROP COLUMN job_id;

ALTER TABLE dept80
SET UNUSED (last_name);

ALTER TABLE dept80
SET UNUSED (annsal);

ALTER TABLE dept80
DROP UNUSED COLUMNS;

DESC dept80;

DROP TABLE dept80;

SELECT * FROM USER_TAB_COMMENTS;

----------------------------------------
-- LAB 9. DDL.
----------------------------------------

-- 8.1
CREATE TABLE departments (
  id    NUMBER(7),
  name  VARCHAR2(25),
  CONSTRAINT id_pk PRIMARY KEY (id);
);

-- 8.2
INSERT INTO departments
  SELECT department_id,
         department_name
  FROM   hr.departments;

-- 8.3
CREATE TABLE emp (
  id NUMBER(7),
  last_name VARCHAR2(25),
  first_name VARCHAR2(25),
  dept_id NUMBER(7),
  CONSTRAINT emp_id_pk PRIMARY KEY (id),
  CONSTRAINT emp_dept_id_fk FOREIGN KEY (dept_id)
    REFERENCES departments(id) ON DELETE CASCADE
);

-- 8.5
SELECT table_name
FROM user_tables;

-- 8.6
CREATE TABLE employees2
  AS
    SELECT employee_id id, first_name,
           last_name, salary, department_id dept_id
    FROM hr.employees;

SELECT * FROM employees2;

-- 8.7
DROP TABLE emp;

-- 8.8
RENAME employees2 TO emp;
RENAME departments TO dept;

-- 8.9
COMMENT ON TABLE emp
IS 'Comment 1';

COMMENT ON TABLE dept
IS 'Comment 2';

-- 8.10
ALTER TABLE emp
DROP COLUMN first_name;
DESC emp;

-- 8.11
ALTER TABLE emp
SET UNUSED (dept_id);

-- 8.12
ALTER TABLE emp
DROP UNUSED COLUMNS;
DESC emp;