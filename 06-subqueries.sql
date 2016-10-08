-- 6.1
SELECT last_name, hire_date
FROM hr.employees
WHERE department_id = (
  SELECT department_id
  FROM hr.employees
  WHERE last_name LIKE 'Zlotkey')
AND last_name <> 'Zlotkey'
ORDER BY last_name;

-- 6.2
SELECT employee_id, last_name, salary
FROM hr.employees
WHERE salary > (
  SELECT AVG(salary)
  FROM hr.employees
) ORDER BY salary ASC;

-- 6.3
SELECT employee_id, last_name, department_id
FROM hr.employees
WHERE department_id IN (
  SELECT department_id
  FROM hr.employees
  WHERE last_name LIKE '%u%'
);

-- 6.4
SELECT e.last_name, d.department_id, e.job_id
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE d.location_id = 1700
ORDER BY department_id, job_id;

-- 6.5
SELECT last_name, salary
FROM hr.employees
WHERE manager_id IN (
  SELECT employee_id
  FROM hr.employees
  WHERE last_name = 'King'
);

-- 6.6
SELECT e.department_id, e.last_name, e.job_id
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
WHERE department_name = 'Executive';