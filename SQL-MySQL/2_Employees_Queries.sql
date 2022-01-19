###########
--  Loading the 'employees' Database:
-- open 'employees.sql'  file sent u.
-- select all the lines and exeute. 
###########


USE employees;


##########################################################
##########################################################

--  The SQL SELECT Statement

##########################################################
##########################################################


###########
--  SELECT - FROM

SELECT 
    first_name, last_name
FROM
    employees;
    
SELECT 
    *
FROM
    employees;


###########
--  WHERE

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
    
###########
--  AND

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';
    

###########
--  OR

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND first_name = 'Elvis';
    

###########
--  Operator Precedence

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND gender = 'M' OR gender = 'F';


SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M' OR gender = 'F');


###########
--  IN / NOT IN

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR first_name = 'Mark'
        OR first_name = 'Nathan';

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');


SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');
    

###########
--  LIKE / NOT LIKE 

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('%ar');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE('%ar%');

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');


###########
--  BETWEEN - AND
   
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2000-01-01';
    
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2000-01-01';    
    
    
###########
--  IS NOT NULL / IS NULL
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;


###########
--  Other Comparison Operators

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Mark';
    
SELECT 
	*
FROM 
	employees
WHERE
	first_name <> 'Mark';
    
SELECT 
	*
FROM 
	employees
WHERE
	first_name != 'Mark';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date > '2000-01-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
WHERE
    hire_date < '1985-02-01';
    
SELECT 
    *
FROM
    employees
WHERE
    hire_date <= '1985-02-01';


###########
--  SELECT DISTINCT

SELECT 
    gender
FROM
    employees;
    
SELECT DISTINCT
    gender
FROM
    employees;
    
    
###########
--  Introduction to Aggregate Functions    
    
SELECT 
    COUNT(emp_no)
FROM
    employees;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
SELECT 
    COUNT(first_name)
FROM
    employees;

SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

SELECT 
    COUNT(DISTINCT gender)
FROM
    employees;

###########
--  ORDER BY

SELECT 
    *
FROM
    employees
ORDER BY first_name;

SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name desc;

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;


###########
--  GROUP BY

SELECT 
    first_name
FROM
    employees;
    
SELECT 
    first_name
FROM
    employees
GROUP BY first_name;


SELECT DISTINCT
    first_name
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


###########
--  Using Aliases (AS)

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC;


###########
--  HAVING

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01';

SELECT 
    *
FROM
    employees
HAVING
    hire_date >= '2000-01-01';

-- WHERE vs. HAVING :
-- after HAVING , you can have a condition with an aggregate function,
-- while WHERE cannot use aggregate functions within its conditions
/*
SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
WHERE
    COUNT(first_name) > 250
GROUP BY first_name
ORDER BY first_name;
*/

SELECT 
    first_name, COUNT(first_name) as names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;


###########
--  WHERE vs HAVING - 
-- Aggregate functions : GROUP BY and HAVING
-- General conditions : WHERE

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;


###########
--  WHERE vs HAVING - 
-- can't use both non-aggregated and aggregated condition in the having clause:
/*
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) < 200
    AND hire_date > '1999-01-01'
ORDER BY first_name DESC;
*/

###########
--  LIMIT

SELECT 
    *
FROM
    salaries;
    
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC;

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name
LIMIT 100;





##########################################################
##########################################################

--  The SQL INSERT Statement

##########################################################
##########################################################


###########
--  The INSERT Statement - 

SELECT 
    *
FROM
    employees
LIMIT 10;


INSERT INTO employees
(
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
--  The INSERT Statement - 

INSERT INTO employees
(
	birth_date,
    emp_no,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	'1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'
);

INSERT INTO employees
VALUES
(
	999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01'
);

insert into titles(emp_no,title,from_date)values(999903,'Senior Engineer','1997-10-01');
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
--  Inserting Data INTO a New Table

SELECT 
    *
FROM
    departments
LIMIT 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

drop table employees.departments_dup;

SELECT 
    *
FROM
    departments_dup;

INSERT INTO departments_dup
(
    dept_no,
    dept_name
)
SELECT 
	*
FROM 
	departments;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;





##########################################################
##########################################################

--  The SQL UPDATE Statement

##########################################################
##########################################################


###########
--  The UPDATE Statement - 

/*
INSERT INTO employees
(
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date
) VALUES 
(
	999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'
);
*/

USE employees;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;

UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999909;

SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC
LIMIT 10;


###########
--  The UPDATE Statement - 

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;

UPDATE departments_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

ROLLBACK;

commit;




##########################################################
##########################################################

--  The SQL DELETE Statement

##########################################################
##########################################################


###########
--  The DELETE Statement - 

USE employees;

COMMIT;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

DELETE FROM employees 
WHERE
    emp_no = 999903;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;

ROLLBACK;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    

###########
--  The DELETE Statement - 

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

DELETE FROM departments_dup;

ROLLBACK;



-- ----------------------------

##########################################################
##########################################################

--  MySQL Aggregate Functions

##########################################################
##########################################################


###########
--  COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

SELECT 
    COUNT(salary)
FROM
    salaries;   

SELECT 
    COUNT(from_date)
FROM
    salaries;

SELECT 
    COUNT(DISTINCT from_date)
FROM
    salaries;
    
SELECT 
    COUNT(*)
FROM
    salaries;
    

###########
--  SUM()

SELECT 
    SUM(salary)
FROM
    salaries;
    
/*
SELECT 
    SUM(*)
FROM
    salaries;
*/    


###########
--  MIN() and MAX()

SELECT 
    MAX(salary)
FROM
    salaries;

SELECT 
    MIN(salary)
FROM
    salaries;
    

###########
--  AVG()

SELECT 
    AVG(salary)
FROM
    salaries;


###########
--  ROUND()
    
SELECT 
    ROUND(AVG(salary))
FROM
    salaries;

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    

###########
--  COALESCE() - Preamble

ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;
 
INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC; 

ALTER TABLE employees.departments_dup 
ADD COLUMN dept_manager VARCHAR(255) NULL after DEPT_NAME;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

COMMIT;


###########
--  IFNULL() and COALESCE()

SELECT 
    dept_no,
    IFNULL(dept_name, 
           'Department name not provided') 
FROM
    departments_dup;

SELECT 
    dept_no,
    IFNULL(dept_name, 
           'Department name not provided') AS dept_name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    COALESCE(dept_name, 
            'Department name not provided') AS dept_name
FROM
    departments_dup;

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC; 

ROLLBACK;


###########
--  Another Example of Using COALESCE()

SELECT 
    dept_no,
    dept_name,
    COALESCE('deparment manager name') AS fake_col
FROM
    departments_dup;
    
/*
SELECT 
    dept_no,
    dept_name,
    IFNULL('deparment manager name') AS fake_col
FROM
    departments_dup;
*/





##########################################################
##########################################################

--  SQL Joins

##########################################################
##########################################################


###########
--  INNER JOIN - 

-- dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no;

-- departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


###########
--  INNER JOIN - 

# if you currently have ‘departments_dup’ set up:

ALTER TABLE departments_dup
DROP COLUMN dept_manager;
 

ALTER TABLE departments_dup
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;


ALTER TABLE departments_dup
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;


-- --------------------------------------- 
DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );

 

INSERT INTO dept_manager_dup

select * from dept_manager;

 

INSERT INTO dept_manager_dup (emp_no, from_date)

VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');

 

DELETE FROM dept_manager_dup

WHERE

    dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');

 

DELETE FROM departments_dup

WHERE

    dept_no = 'd002'; 

-- --------------------------- 

/*SELECT 
    dept_manager_dup.dept_no, dept_manager_dup.emp_no, departments_dup.dept_name
FROM
    dept_manager_dup
        INNER JOIN
    departments_dup ON dept_manager_dup.dept_no = departments_dup.dept_no
ORDER BY dept_manager_dup.dept_no;
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;


# Equi join:
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m ,departments_dup d where m.dept_no = d.dept_no
ORDER BY m.dept_no;

# NonEqui join:
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m ,departments_dup d where m.dept_no in ('d002','d003')
ORDER BY m.dept_no;


# natural join:
SELECT 
    *
FROM
    dept_manager_dup
        NATURAL JOIN
    departments_dup;

# withoutnatural join:
SELECT 
    *
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no;



SELECT 
    *
FROM
    dept_manager_dup ,
    departments_dup;
###########
--  A Note on Using Joins

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;
*/

-- add m.to_date and d.dept_name
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- JOIN
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- d.dept_no = m.dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY m.dept_no;

-- ORDER BY d.dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY d.dept_no;

-- ORDER BY dept_no
SELECT 
    m.dept_no, m.emp_no, m.from_date, m.to_date, d.dept_name
FROM
    dept_manager_dup m
		JOIN
    departments_dup d ON d.dept_no = m.dept_no
ORDER BY dept_no;


###########
--  Duplicate Records

-- duplicate records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- dept_manager_dup
SELECT 
    *
FROM
    dept_manager_dup
ORDER BY dept_no ASC;

-- departments_dup
SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no ASC;

-- inner join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- add GROUP BY m.emp_no
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY dept_no;


###########
--  LEFT JOIN - 

-- remove the duplicates from the two tables
DELETE FROM dept_manager_dup 
WHERE emp_no = '110228';
        
DELETE FROM departments_dup 
WHERE dept_no = 'd009';

-- add back the initial records
INSERT INTO dept_manager_dup 
VALUES 	('110228', 'd003', '1992-03-21', '9999-01-01');
        
INSERT INTO departments_dup 
VALUES	('d009', 'Customer Service');

-- left join
/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;
*/

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
GROUP BY m.emp_no
ORDER BY m.dept_no;


###########
--  LEFT JOIN - 

-- d LEFT JOIN m
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
		LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- LEFT OUTER JOIN
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT OUTER JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY d.dept_no;

-- m LEFT JOIN d
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- add WHERE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
WHERE
    dept_name IS NULL
ORDER BY m.dept_no;


###########
--  RIGHT JOIN

/*
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        LEFT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;
*/

-- right join
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- SELECT d.dept_no
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        RIGHT JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;

-- d LEFT JOIN m
SELECT 
    d.dept_no, m.emp_no, d.dept_name
FROM
    departments_dup d
        LEFT JOIN
    dept_manager_dup m ON m.dept_no = d.dept_no
ORDER BY dept_no;


###########
--  The New and the Old Join Syntax

-- JOIN
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
		INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

-- WHERE
SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m,
    departments_dup d
WHERE
    m.dept_no = d.dept_no
ORDER BY m.dept_no;


###########
--  JOIN and WHERE Used Together

SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;

SELECT 
    e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > 145000
;


###########
--  Using Aggregate Functions with Joins

SELECT 
    e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender;    

-- SELECT e.emp_no
SELECT 
    e.emp_no, e.gender, AVG(s.salary) AS average_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
GROUP BY gender; 


###########
--  CROSS JOIN

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        INNER JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.*, d.*
FROM
    departments d
        CROSS JOIN
    dept_manager dm
        JOIN
	employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.emp_no , d.dept_no;


###########
--  Join more than Two Tables in SQL

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no
;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;

-- RIGHT JOIN - JOIN
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        RIGHT JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no
;

-- JOIN - RIGHT JOIN
SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        RIGHT JOIN
    employees e ON m.emp_no = e.emp_no
;


###########
--  Tips and Tricks for Joins

SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
;

-- add GROUP BY d.dept_name
SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
;

-- add ORDER BY d.dept_no
SELECT 
    d.dept_name, AVG(salary) as avg_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
having AVG(salary) >60000
ORDER BY avg_salary desc
;


-- GROUP BY dept_name
SELECT 
    d.dept_name, AVG(salary)
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY dept_name
ORDER BY d.dept_no
;


-- AVG(salary) AS aaverage_salary 
-- add back GROUP BY d.dept_name
SELECT 
    d.dept_name, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
ORDER BY d.dept_no
;
###########
-- UNION vs UNION ALL


DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup (
   emp_no int(11),
   birth_date date,
   first_name varchar(14),
   last_name varchar(16),
   gender enum('M','F'),
   hire_date date
  );
  
INSERT INTO employees_dup 
SELECT 
    *
FROM
    employees
LIMIT 10;

-- Check
SELECT 
    *
FROM
    employees_dup
;

INSERT INTO employees_dup VALUES
('10001', '1953-09-02', 'Georgi', 'Facello', 'M', '1986-06-26');

-- Check
SELECT 
    *
FROM
    employees_dup;

-- UNION ALL
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;

-- UNION 
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e 
UNION SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;

##########################################################
##########################################################

--  Subqueries

##########################################################
##########################################################    


###########
--  Subqueries with IN nested inside WHERE

SELECT 
    *
FROM
    dept_manager;


# Select the first and last name from the Employees table for the same employee numbers that can be found in the department manager table.

# We know this:
SELECT 
    e.first_name, e.last_name
FROM
    employees e
        JOIN
    dept_manager m ON m.emp_no = e.emp_no;
    
# through Sub-queries/ Inner-queries/ nested-queries:
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    e.emp_no IN (SELECT 
            dm.emp_no
        FROM
            dept_manager dm);
            
SELECT 
    dm.emp_no
FROM
    dept_manager dm;


###########
--  Subqueries with EXISTS-NOT EXISTS nested inside WHERE

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no);
       
    
    
-- add ORDER BY emp_no
SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no
        ORDER BY emp_no);

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            dept_manager dm
        WHERE
            dm.emp_no = e.emp_no)
ORDER BY emp_no;


###########
--  Subqueries nested in SELECT and FROM
# Exercise 1:
# assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), 
# and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).

-- 1) 
SELECT 
    emp_no
FROM
    dept_manager
WHERE
    emp_no = 110022;

-- 2) 
SELECT 
    e.emp_no AS employee_ID,
    MIN(de.dept_no) AS department_code,
    (SELECT 
            emp_no
        FROM
            dept_manager
        WHERE
            emp_no = 110022) AS manager_ID
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
WHERE
    e.emp_no <= 10020
GROUP BY e.emp_no
ORDER BY e.emp_no;

-- 3) 
SELECT 
    a.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a;

-- 4)
SELECT 
    a.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a 
UNION SELECT 
    b.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b;

-- ------------------
# Exercise 2:
# Fill emp_manager with data about employees, the number of the department they are working in, and their managers.
# assign employee number 110022 as a manager to all employees from 10001 to 10020 (this must be subset A), 
# and employee number 110039 as a manager to all employees from 10021 to 10040 (this must be subset B).
# create subset C, where you must assign employee number 110039 as a manager to employee 110022.
# create subset D. Here you must do the opposite - assign employee 110022 as a manager to employee 110039.

# Your query skeleton must be:

-- Insert INTO emp_manager SELECT
-- U.*
-- FROM
-- (A) UNION (B) UNION (C) UNION (D) AS U;


DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

-- EXERCISE 2: Solution:
INSERT INTO emp_manager
SELECT 
    u.*
FROM
    (SELECT 
        a.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        b.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS b UNION SELECT 
        c.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS c UNION SELECT 
        d.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS d) as u;
    





##########################################################
##########################################################

--  SQL Self Join

##########################################################
########################################################## 


###########
--  Self Join


SELECT 
   *
FROM
    emp_manager
ORDER BY emp_manager.emp_no;

SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;    
    
-- Select e2.*
SELECT 
    e2.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    

-- SELECT e1.emp_no, e1.dept_no, e2.manager_no
SELECT 
    e1.emp_no, e1.dept_no, e2.manager_no
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT DISTINCT
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
SELECT 
    e1.*
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            emp_manager);
            
-- inner select 
SELECT 
    manager_no
FROM
    emp_manager
GROUP BY manager_no;





##########################################################
##########################################################

--  SQL Views

##########################################################
########################################################## 


###########
--  Using SQL Views

SELECT 
    *
FROM
    dept_emp;

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    dept_emp
GROUP BY emp_no
HAVING Num > 1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
    SELECT 
        emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
    FROM
        dept_emp
    GROUP BY emp_no;
        
-- The SELECT statement
SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM
    dept_emp
GROUP BY emp_no;





##########################################################
##########################################################

--  Stored Routines

##########################################################
########################################################## 


###########
--  The MySQL Syntax for Stored Procedures

USE employees;


###########
--  Stored Procedures :

DROP procedure IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
          
			SELECT * FROM employees
			LIMIT 1000;
            
END$$

DELIMITER ;



call employees.select_employees();
call employees.select_employees;

call select_employees();
call select_employees;


###########
--  Another Way to Create a Procedure in MySQL

DROP PROCEDURE select_employees;

# try by right clicking stored procedures. 

###########
--  Stored Procedures with an Input Parameter

USE employees;
DROP procedure IF EXISTS emp_salary;

DELIMITER $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;


-- emp_avg_salary with SELECT e.first_name, e.last_name, avg(s.salary)
DROP procedure IF EXISTS emp_avg_salary;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary (in p_emp_no integer)
BEGIN
SELECT 
    e.first_name, e.last_name, avg(s.salary)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

CALL emp_avg_salary(11300);


###########
--  Stored Procedures with an Output Parameter

DROP procedure IF EXISTS emp_avg_salary_out;

DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no integer, out p_avg_salary decimal(10,2))
BEGIN
SELECT 
    AVG(s.salary)
INTO p_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

###########
--  Variables

set @v_avg_salary = 0;
call employees.emp_avg_salary_out(11300, @v_avg_salary);
select @v_avg_salary;


###########
--  User-Defined Functions in MySQL

USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL(10,2)
deterministic          #to get rid of Error code:1418.
BEGIN

DECLARE v_avg_salary DECIMAL(10,2);

SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

RETURN v_avg_salary;
END$$

DELIMITER ;


SELECT f_emp_avg_salary(11300);


###########
--  Stored Routines - Conclusion

SET @v_emp_no = 11300; 

SELECT 
    emp_no,
    first_name,
    last_name,
    f_emp_avg_salary(@v_emp_no) AS avg_salary
FROM
    employees
WHERE
    emp_no = @v_emp_no;



##########################################################
##########################################################

-- Task1:
# Create a visualization that provides a breakdown between 
# the male and female employees working in the company 
# each year, starting from 1990:
 
SELECT 
    YEAR(d.from_date) AS calendar_year,
    e.gender,
    COUNT(e.emp_no) AS num_of_employees
FROM
    employees e
        JOIN
    dept_emp d ON d.emp_no = e.emp_no
GROUP BY calendar_year , e.gender
HAVING calendar_year >= 1990;

# After u get the o/p, Export it to csv then visualize in Tableau.