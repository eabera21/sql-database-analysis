use hr;

-- q1 --
SELECT
  l.location_id,
  l.street_address,
  l.postal_code,
  l.city,
  l.state_province,
  d.department_id,
  d.department_name
FROM locations AS l
INNER JOIN departments AS d
  ON l.location_id = d.location_id
WHERE l.location_id = 1400;

-- q2 --

SELECT @@hostname, NOW() execution_time, 'eta230001';

SELECT
  c.country_name,
  c.region_id,
  r.region_name
FROM countries AS c
JOIN regions AS r
  ON c.region_id = r.region_id
WHERE r.region_name = 'Americas';

-- q3 --

SELECT
  e.first_name,
  e.last_name,
  e.hire_date,
  e.job_id,
  j.job_title,
  j.max_salary
FROM employees AS e
JOIN jobs AS j
  ON e.job_id = j.job_id
WHERE j.max_salary > 12000;

-- q4 --
SELECT
  j.job_title,
  e.first_name,
  e.last_name,
  e.email
FROM employees AS e
JOIN jobs AS j
  ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Clerk';

-- q5 --

SELECT
  e.employee_id,
  e.first_name AS employee_first_name,
  e.last_name  AS employee_last_name,
  e.manager_id,
  m.first_name AS manager_first_name,
  m.last_name  AS manager_last_name
FROM employees AS e
JOIN employees AS m
  ON e.manager_id = m.employee_id;

-- q6 --

SELECT @@hostname, NOW() execution_time, 'eta230001';

SELECT
  l.location_id,
  l.city,
  d.department_name
FROM departments AS d
JOIN locations AS l
  ON d.location_id = l.location_id
JOIN countries AS c
  ON l.country_id = c.country_id
WHERE c.country_name = 'Canada';

-- q7 --

SELECT
  e.manager_id,
  e.department_id,
  d.department_name,
  e.first_name,
  e.last_name
FROM employees AS e
JOIN departments AS d
  ON e.department_id = d.department_id
WHERE e.department_id IN (80, 90, 110, 190);

-- q8 --

SELECT
  e.employee_id,
  e.last_name,
  e.department_id,
  d.department_name,
  e.hire_date
FROM employees AS e
JOIN departments AS d
  ON e.department_id = d.department_id
WHERE e.hire_date = '1994-06-07';

-- q9 --

SELECT @@hostname, NOW() execution_time, 'eta230001';

SELECT
  e.last_name  AS Employee,
  e.employee_id AS `Emp#`,
  m.last_name  AS Manager,
  m.employee_id AS `Mgr#`
FROM employees AS e
JOIN employees AS m
  ON e.manager_id = m.employee_id;

-- q10 --

SELECT
  e.employee_id,
  e.first_name,
  e.last_name,
  e.manager_id,
  m.first_name AS manager_first_name,
  m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.manager_id = m.employee_id
ORDER BY e.last_name, e.first_name;

-- q11 --

SELECT @@hostname, NOW() execution_time, 'eta230001';

SELECT
  last_name,
  salary,
  ROUND(salary / 1.55, 2) AS rounded_salary_div_155
FROM employees
WHERE employee_id BETWEEN 100 AND 102;

-- q12 --

SELECT
  last_name,
  salary,
  TRUNCATE(salary * 1.05333, 2) AS salary_plus_5333pct
FROM employees
WHERE department_id = 80;

-- q13 --

SELECT @@hostname, NOW() execution_time, 'eta230001';

SELECT
  38873 AS n,
  MOD(38873, 2) AS remainder,
  CASE
    WHEN MOD(38873, 2) = 0 THEN 'Even'
    ELSE 'Odd'
  END AS even_or_odd;

-- q14 --

SELECT 
	AVG(salary) AS avg_salary,
	COUNT(*) AS total_employees,
	MAX(salary) AS max_salary,
	MIN(salary) AS min_salary,
	STDDEV(salary) AS stddev_salary,
	SUM(salary) AS total_salary,
	VARIANCE(salary) AS variance_salary
FROM employees;

-- q15 --


-- (a) NATURAL JOIN example (countries + regions share region_id)
SELECT
  country_name,
  region_id,
  region_name
FROM countries
NATURAL JOIN regions;

-- (b) SELF JOIN example (employees to their managers)
SELECT
  e.employee_id,
  e.last_name  AS employee_last_name,
  e.manager_id,
  m.last_name  AS manager_last_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.manager_id = m.employee_id;

-- (c) OUTER JOIN example (show all departments even if they have no employees)
SELECT
  d.department_id,
  d.department_name,
  e.employee_id,
  e.last_name
FROM departments AS d
LEFT JOIN employees AS e
  ON d.department_id = e.department_id
ORDER BY d.department_id, e.employee_id;