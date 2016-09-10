-- Выборка данных из нескольких таблиц

-- 4.2
-- Выведите список всех должностей в отделе 80
-- (должности в списке не должны повторятся)
-- и местоположение отдела
SELECT DISTINCT e.job_id, l.location_id
FROM hr.employees e
LEFT JOIN hr.departments d
ON e.department_id = d.department_id
LEFT JOIN hr.locations l
ON d.location_id = l.location_id
LEFT JOIN hr.jobs j
ON e.job_id = j.job_id
WHERE e.department_id = 80;

-- 4.3
-- Напишите запрос для вывода фамилии,
-- названии отдела, идентификатора,
-- местоположения отдела и города,
-- в котором он находится, для всех служащих,
-- зарабатывающих комиссионные
SELECT e.last_name, d.department_name, l.location_id, l.city
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
INNER JOIN hr.locations l
ON d.location_id = l.location_id
WHERE NVL(e.commission_pct, 0) <> 0
ORDER BY e.last_name;

-- 4.4
-- Выведите фамилии служащих, содержащие букву 'a'
-- в строчном регистре, с названиями отделов.
SELECT e.last_name, d.department_name
FROM hr.employees e
INNER JOIN hr.departments d
ON e.department_id = d.department_id
WHERE INSTRC(e.last_name, 'a') <> 0;

SELECT e.employee_id, e.last_name, d.location_id
FROM hr.employees e
NATURAL JOIN hr.departments d;