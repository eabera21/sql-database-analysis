use hr;

select * from (  
SELECT department_id, employee_id, salary , RANK ()  OVER (partition by   department_id order by salary desc )  as  rnk  FROM employees
) table1 where rnk < 2;


    SELECT department_id, employee_id, salary , 
			RANK ()  OVER (partition by   department_id order by salary desc )  as  rnk  ,
            DENSE_RANK ()  OVER (partition by   department_id order by salary desc )  as  dense_rnk ,
           ROW_NUMBER  ()  OVER (partition by   department_id order by salary desc )  as  Serial_no 
from employees ;
 


    use ap3;
    SELECT vendor_id, invoice_date, invoice_total,
       SUM(invoice_total) OVER() AS total_invoices,  --- Total invoice irrespective of department 
        SUM(invoice_total) OVER(PARTITION BY vendor_id)  -- want to group by vendor_id and get sum 
           AS vendor_total
FROM invoices
WHERE invoice_total > 5000;



-- q1

use hr;

 SELECT NOW() AS execution_time, "ETA230001" AS student_id, @@hostname AS server_host;
 
 SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       RANK() OVER (ORDER BY SALARY DESC) AS salary_rank
FROM employees;

-- q2

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       DENSE_RANK() OVER (ORDER BY SALARY DESC) AS dense_salary_rank
FROM employees;


-- q3
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY,
       ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS row_num
FROM employees;

-- q4
SELECT * FROM (
    SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY,
           ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS row_num
    FROM employees
) ranked
WHERE row_num = 1;

-- q5
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY,
       RANK() OVER (PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC) AS dept_rank
FROM employees;

-- q6
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       ROUND(AVG(SALARY) OVER(), 2) AS company_avg,
       ROUND(AVG(SALARY) OVER(PARTITION BY DEPARTMENT_ID), 2) AS dept_avg
FROM employees;

-- q7
SELECT DEPARTMENT_ID, EMPLOYEE_ID, FIRST_NAME, SALARY,
       SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID) AS dept_total,
       ROUND(SALARY * 100.0 / SUM(SALARY) OVER (PARTITION BY DEPARTMENT_ID), 1) AS pct_of_dept
FROM employees;

SELECT NOW() AS execution_time, "ETA230001" AS student_id, @@hostname AS server_host;
-- q8
SELECT DEPARTMENT_ID, EMPLOYEE_ID, SALARY,
       RANK() OVER (ORDER BY SALARY DESC) AS rnk,
       DENSE_RANK() OVER (ORDER BY SALARY DESC) AS dense_rnk,
       ROW_NUMBER() OVER (ORDER BY SALARY DESC) AS row_num
FROM employees
WHERE DEPARTMENT_ID = 50;

-- q9
SELECT DEPARTMENT_ID, EMPLOYEE_ID, SALARY,
       SUM(SALARY) OVER dept_win AS dept_total,
       ROUND(AVG(SALARY) OVER dept_win, 2) AS dept_avg,
       MAX(SALARY) OVER dept_win AS dept_max,
       MIN(SALARY) OVER dept_win AS dept_min
FROM employees
WINDOW dept_win AS (PARTITION BY DEPARTMENT_ID);

-- q10
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY,
       ROUND(PERCENT_RANK() OVER (ORDER BY SALARY), 4) AS pct_rank,
       ROUND(CUME_DIST() OVER (ORDER BY SALARY), 4) AS cum_dist
FROM employees;