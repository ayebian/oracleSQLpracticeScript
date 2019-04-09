--Restricting and sorting data
--Using where clause
--Character strings and date values must be enclosed with a 'single' quotation
--Data inside tables is case sensitive and date is format sensitive
--Allowed date formats are dd-Month(in words ie JUN or June or jun)-yyyy(or yy 2013 can be 03) or dd/jun/yyyy 
--order by
--b is greater than a Z-A is desc and A-Z is ascending
/*SELECT FIRST_NAME, LAST_NAME, hire_date
FROM EMPLOYEES
WHERE HIRE_DATE >'17/oct/20037'
order by first_name desc; */


--BETWEEN AND

SELECT * 
FROM EMPLOYEES
WHERE SALARY between 10000 and 20000
ORDER BY FIRST_NAME;

--IN (in, iN)
SELECT * 
FROM EMPLOYEES
WHERE SALARY iN (10000, 2000)
ORDER BY FIRST_NAME;

--LIKE operator (%- zero or more characters, _ (underscore means one character))

/*SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'S%';  -- All first names that start with S --still case sensitive

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%s';  -- All first names that end with S --still case sensitive

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '%am%';  -- All first names that contain am --still case sensitive

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '_d%';  -- All first names thatcontain 'd' as the second letter NOTE "_d" wont bring anything

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME LIKE '__s%';  -- All first names thatcontain 's' as the third letter NOTE "_d" wont bring anything*/

--Escaping characters (data containing % and _)

SELECT job_id from jobs
Where Job_id like 'SA/_%' ESCAPE '/'; -- Quotes must be Single -- escape can also work


--IS NULL, NOT NULL

--is null not =null
SELECT FIRST_NAME, COMMISSION_PCT
FROM EMPLOYEES 
WHERE COMMISSION_PCT  IS NULL;

--NOT operator (opposite) can be used as not like, not in, is not null, not between and

/*SELECT * 
FROM EMPLOYEES
WHERE SALARY not iN (10000, 2000)
ORDER BY FIRST_NAME;

SELECT * FROM EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'S%';

SELECT * 
FROM EMPLOYEES
WHERE SALARY NOT between 10000 and 20000
ORDER BY FIRST_NAME;*/


--Order by clause
/*
--Default order is ascending (ASC)
-- desc is descending
Null values in order by appear last in asc order and first in desc 
U can use NULLS FIRST to bring nulls to the top in ASC sort
SELECT * 
FROM EMPLOYEES
WHERE SALARY iN (10000, 2000)
ORDER BY COMMISSION_PCT asc NULLS FIRST ;

--Using Alias to sort
SELECT FIRST_NAME || ' ' || LAST_NAME full_name
FROM EMPLOYEES
WHERE SALARY iN (10000, 2000)
ORDER BY full_name ;

--Order by multiple columns
SELECT FIRST_NAME || ' ' || LAST_NAME full_name
FROM EMPLOYEES
WHERE SALARY iN (10000, 2000)
ORDER BY full_name asc, SALARY desc ;

Order by column number
SELECT FIRST_NAME || ' ' || LAST_NAME full_name
FROM EMPLOYEES
WHERE SALARY iN (10000, 2000)
ORDER BY 1, 2 ;

Order by expression
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY*1000 desc
*/

/*FETCH clause to limit record retrieved
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
FETCH FIRST 5 ROWS ONLY;


SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
FETCH FIRST 5 ROWS ONLY;

SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
FETCH FIRST 50 PERCENT ROWS ONLY;

Using offset that is when u want to fetch but start from a given row.
it comes before fetch clause
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
OFFSET 5 ROWS FETCH NEXT 50 PERCENT ROWS ONLY;

*/

/*Only vs with TIES -- WITH TIES MEANS IF 2 OR MORE ROWS ARE TIES, ALL ARE TAKEN
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY desc
FETCH  FIRST 2 ROWS ONLY;

SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY desc
FETCH  FIRST 2 ROWS with TIES;
*/
--
--
--
/*SUBSTITUTION VARIABLES -- TEMPORARY Variables
--Can be defined by & or &&
Used in
----WHERE conditions,
----ORDER BY Clause,
----Column names,
----Entire select statement

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where EMPLOYEE_ID = &EMPLOYEE_NUM ---When single & sign is used, the temporary variable is will be discarded

-- Use single quotes when dealing with character or date
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME'

Or put the single qoutes in the prompt window 
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = &EMPLOYEE_NAME

--Specifying columnames, expressions and text
--&culumn_name=salary &condition=salary>10000 &ORDER_COLUMN=employee_id
--
--
SELECT employee_id, first_name, last_name,&column_name, department_id
FROM EMPLOYEES
where &condition
ORDER BY &ORDER_COLUMN;
*/

/*
--DEFINE /UNDEFINE --variable not damaged --Variable names not case sensitive
DEFINE employee_name = 'Adam';

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME';

UNDEFINE EMPLOYEE_NAME;-- Damages variable

--ACCEPT/PROMPT Customizing prompt window message -- This statement is run at once with the select statement

--
ACCEPT EMPLOYEE_NAME PROMPT 'Please enter employee_name'
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME';

UNDEFINE EMPLOYEE_NAME;


--Double Ampersand &&- --Define and assign a variable at prompt -- variable is not damaged
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&&EMPLOYEE_NAME';
--UNDEFINE EMPLOYEE_NAME; to damage the new variable


SET VERIFY ON/OFF -- Shows SQL statement before and after execution -- This statement is run at once with the select statement

SET VERIFY ON/OFF
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&&EMPLOYEE_NAME';

SET DEFINE OFF Overriding the & sign not to mean substituition

SET DEFINE OFF

SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%&t';
*/
SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY SALARY*1000 desc
FETCH  FIRST 2 ROWS WITH TIES;

SELECT EMPLOYEE_ID, FIRST_NAME,LAST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID
OFFSET 5 ROWS FETCH NEXT 50 PERCENT ROWS ONLY;

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where EMPLOYEE_ID = &EMPLOYEE_NUM;

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME';


SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = &EMPLOYEE_NAME;


SELECT employee_id, first_name, last_name,&column_name, department_id
FROM EMPLOYEES
where &condition
ORDER BY &ORDER_COLUMN;


DEFINE employee_name = 'Adam';

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME';

UNDEFINE EMPLOYEE_NAME;

ACCEPT employee_name prompt 'Please enter employee_name'
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&EMPLOYEE_NAME';

SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&&EMPLOYEE_NAME';

UNDEFINE EMPLOYEE_NAME;

SET VERIFY ON
SELECT employee_id, first_name, last_name,salary, department_id
FROM EMPLOYEES
where FIRST_NAME = '&&EMPLOYEE_NAME';

SET DEFINe off
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%&t';
