use hr;


select * from employees;


-- AGGREGATE FUNCTION --

SUM
AVG
COUNT
MIN
MAX

select count(*) from employees;


select avg(salary) from employees;
select min(salary) from employees;
select max(salary) from employees;
select min(salary), max(salary), count(*), avg(salary) from employees
where department_id = 90;

select count(*) from employees where department_id = 30;

select department_id, avg(salary) from employees
where region = 'US' 	 -- phase 1
group by department_id		-- phase 2
having avg(salary) > 5000		-- phase 3	-- filter condition
Order by 2;



-- q1 
SELECT NOW() AS execution_time, "ETA230001" AS student_id, @@hostname AS server_host;


SELECT COUNT(*) AS total_employees,
ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

SELECT NOW() AS execution_time, "ETA230001" AS student_id, @@hostname AS server_host;

-- q2

SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary, SUM(salary) AS total_salary,
ROUND(AVG(salary), 2) AS avg_salary
FROM employees
WHERE hire_date > '2005-01-01';

-- q3

SELECT COUNT(DISTINCT department_id) AS dept_count, COUNT(*) AS total_employees, ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

-- q4

SELECT department_id, COUNT(*) AS emp_count, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- q5

SELECT department_id, COUNT(*) AS emp_count, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5
ORDER BY emp_count DESC;

SELECT NOW() AS execution_time, "ETA230001" AS student_id, @@hostname AS server_host;


-- q6

SELECT 
d.department_name,
COUNT(e.employee_id) AS emp_count, SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(e.salary) > 50000
ORDER BY total_salary DESC;

-- q7

SELECT 
d.department_name,
COUNT(e.employee_id) AS emp_count, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary > 5000
GROUP BY d.department_name
HAVING COUNT(e.employee_id) >= 3
ORDER BY avg_salary DESC;


-- q8

SELECT j.job_title, e.department_id, COUNT(e.employee_id) AS emp_count, ROUND(AVG(e.salary), 2) AS avg_salary
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id
GROUP BY j.job_title, e.department_id
HAVING COUNT(e.employee_id) > 1
ORDER BY j.job_title, e.department_id;


-- q9

SELECT department_id, COUNT(*) AS emp_count, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id WITH ROLLUP;


-- q10

SELECT 
    IF(GROUPING(department_id) = 1, 'All Departments', department_id) AS department_id,
    COUNT(*) AS emp_count,
    SUM(salary) AS total_salary
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id WITH ROLLUP;