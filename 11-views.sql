----------------------------------------
-- LAB 11. VIEWS.
----------------------------------------
-- 11.1 - 11.2
CREATE VIEW employees_vu
AS SELECT employee_id,
          last_name Employee,
          department_id
  FROM hr.employees;
SELECT * FROM employees_vu;

-- 11.4
SELECT employee, department_id FROM employees_vu;

-- 11.5
CREATE VIEW dept50
AS SELECT employee_id Empno,
          last_name Employee,
          department_id Deptno
  FROM hr.employees
  WHERE department_id = 50
  WITH READ ONLY;

-- 11.6
DESC dept50;
SELECT * FROM dept50;

-- 11.7
UPDATE dept50
SET deptno = 80
WHERE employee = 'Fripp';

-- 11.8
CREATE VIEW salary_vu
AS SELECT e.last_name "Employee",
          d.department_name "Department",
          e.salary "Salary"
   FROM hr.employees e
   LEFT JOIN hr.departments d
   ON e.department_id = d.department_id;


SELECT e.last_name "Employee",
          d.department_name "Department",
          e.salary "Salary"
   FROM hr.employees e
   LEFT JOIN hr.departments d
   ON e.department_id = d.department_id
   UNION ALL
   SELECT j.job_id
   FROM hr.jobs j, hr.employees e
   WHERE e.salary BETWEEN j.min_salary AND j.max_salary;
