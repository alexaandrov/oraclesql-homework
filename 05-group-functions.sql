-- Групповые функции. Глава 5.

-- 5.4
SELECT job_id,
       MAX(salary),
       MIN(salary),
       SUM(salary),
       AVG(salary)
FROM hr.employees
GROUP BY job_id;

-- 5.6
SELECT job_id, COUNT(employee_id)
FROM hr.employees
GROUP BY job_id;

-- 5.7
SELECT COUNT(DISTINCT manager_id) "Number of Managers"
FROM hr.employees
WHERE manager_id IS NOT NULL;

-- 5.8
SELECT  (MAX(salary) - MIN(SALARY)) DIFFERENCE
FROM hr.employees;

-- 5.9
SELECT DISTINCT manager_id, MIN(salary)
FROM hr.employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(SALARY) > 6000
ORDER BY MIN(SALARY);

-- 5.10
SELECT d.department_name "Name",
       d.location_id "Location",
       COUNT(employee_id) "Num. of People",
       ROUND(AVG(salary), 2) "Salary"
FROM hr.employees
LEFT JOIN hr.departments d
USING (department_id)
GROUP BY d.department_name, d.location_id
ORDER BY d.department_name;

-- 5.11
SELECT COUNT(employee_id)
FROM hr.employees;