# SQL HR Database Analysis

Performed structured analysis on an HR employee database using MySQL across three projects covering aggregate analysis, window functions, and advanced joins.

## Skills Used
MySQL · SQL · Aggregate Functions · Window Functions · JOINs · GROUP BY · HAVING · ROLLUP · Subqueries · Math Functions

## Project 1 – Aggregate Analysis
- Calculated employee headcount, average, min, and max salary across departments
- Joined employees, departments, and jobs tables to analyze compensation by department and job title
- Used ROLLUP to generate subtotals and grand totals across department groups
- Applied HAVING clauses to filter aggregated results by meaningful business conditions

## Project 2 – Window Functions
- Ranked employees by salary using RANK, DENSE_RANK, and ROW_NUMBER across departments
- Identified the highest paid employee per department using subqueries
- Calculated each employee's salary as a percentage of their department total
- Used PERCENT_RANK and CUME_DIST to analyze salary distribution across the company

## Project 3 – Joins & Math Functions
- Used INNER, LEFT, SELF, and NATURAL JOINs across employees, departments, locations, countries, and regions tables
- Built manager-employee relationship queries using self joins
- Applied math functions including ROUND, TRUNCATE, MOD, and statistical aggregates like STDDEV and VARIANCE
- Identified departments with no employees using outer joins
