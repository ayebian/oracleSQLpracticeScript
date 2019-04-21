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
/*
--Character functions

--Upper()/ Lower() / Initcap()

SELECT employee_id, upper(first_name),lower(first_name), initcap(first_name)
FROM EMPLOYEES
WHERE upper(first_name) = upper('patrick')
Order by upper(first_name);
*/
/*
--Character Manipulation functions
--Concat, substr, length

Concat function -- Takes only two arguments -- || is more flexible as it takes more than two arguments

SELECT employee_id, concat(first_name,last_name)
FROM EMPLOYEES;

-- substr function

substr(column or expression, m,n)
m  is starting position
n is the characters long 

SELECT employee_id,first_name, substr(first_name,1,3),
substr(first_name,2,4),
substr(first_name,2) ,--if u dnt specifify the n, it counts to the last value
substr(first_name,-3) --if m is negative, it counts from the end.
FROM EMPLOYEES;

--Length function

SELECT employee_id,length(first_name),first_name, substr(first_name,1,3),
substr(first_name,2,4),
substr(first_name,2) ,--if u dnt specifify the n, it counts to the last value
substr(first_name,-3) --if m is negative, it counts from the end.
FROM EMPLOYEES;

instr (instring)

--instr (column/expression ,m,n)
--m is the start searching position
--n is occurance
--default m is 1
--default n is 1
Returns the numeric position of the named string

SELECT employee_id,first_name,
instr(first_name,'E'),
instr(first_name,'e',2), --starts from 2nd position but returns the position of e from the start of the string not from second position
instr(first_name,'e',5), --starts from 5th position but returns the position of e from the start of the string not from second position
instr(first_name,'e',5,2) --starts from 1st position but returns the position of the SECOND e from the start of the string not from second position
instr(first_name,'zabe',3,1)-- String can be more than one character
FROM EMPLOYEES
WHERE FIRST_NAME = 'Nanette';

-LPAP, RPAD, TRIM, REPLACE
--lPAD -- Returns an expression left-padded to length n characters of a character expression
--rPAD -- Returns an expression left-padded to length n characters of a character expression

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, LPAD (SALARY,10,'#'), RPAD(salary,10,'*')
FROM EMPLOYEES;

--REPLACE --finds character(s) and replaces them with the specified character

SELECT EMPLOYEE_ID, FIRST_NAME, REPLACE(FIRST_NAME,'a', '*'), REPLACE (FIRST_NAME, 'en','#')
FROM EMPLOYEES;
*/
/*
--DUAL TABLE -- dummy table
--Used to test expressions or functions
--contains only one column an one row
 SELECT 3+5 FROM DUAL;
*/

/*
--TRIM FUNCTION
SELECT TRIM (' ' FROM ' Ayebare Ian ') trimmed from DUAL; -- if leading or trailing is not specified, the function trims from both both ends

--Leading
SELECT TRIM (leading ' ' FROM ' Ayebare Ian ') trimmed from DUAL; -- trims only from the start of the string

TRAILING
SELECT TRIM (TRAILING ' ' FROM ' Ayebare Ian ') trimmed from DUAL; -- trims only from the end of the string
*/


/* Number /Numeric Functions
ROUND(Column/expression) -- Rounds off
TRUNC(Column/expression ) -- Truncates
MOD(colum/expression) -- Returns modulus / remainder of a division

--Round

SELECT ROUND(10.56) FROM DUAL; --Rounds off to the whole number (no decimal place) when no decimal size is specified
SELECT ROUND(10.56,1) FROM DUAL; --Rounds off to one decimal place.
SELECT ROUND(10.5634,2) FROM DUAL; --Rounds off to two decimal places.
SELECT ROUND(19.5634,-1) FROM DUAL; --Rounds off the first number on the left of the decimal point ie 9 is rounded makeking the answer 20 
SELECT ROUND(555.493,-2) FROM DUAL; --Evaluates to 600.
SELECT ROUND(470.92,-3) FROM DUAL; --Evaluates to 0 since 4 is less than 5.

TRUNC

SELECT TRUNC(10.56) FROM DUAL; --Cuts off to the whole number (no decimal place) when no decimal size is specified
SELECT TRUNC(10.56,1) FROM DUAL; --Cuts off to one decimal place.
SELECT TRUNC(10.5634,2) FROM DUAL; --Cuts off to two decimal places. Answer = 10.56
SELECT TRUNC(19.5634,-1) FROM DUAL; --Cuts off the first number on the left of the decimal point ie 9 becomes 0 making the answer 10.. The rest of the digits become zero SELECT TRUNC(555.493,-2) FROM DUAL; -- Evaluates to 600.
SELECT TRUNC(870.92,-3) FROM DUAL; --Evaluates to 0  

--MOD
SELECT MOD (5,2) FROM DUAL; -- Returns 1

*/
/*
--DATE FUNCTIONS
--rr formart 
--In general if the value is between 50-99 this returns 19xx year
--Avalue between 0-49 returns a 20xx year

select sysdate from dual

--Date Arithmetic
--date - number
select sysdate, sysdate-3, sysdate + 3 from dual --gives date - plus number = date
--Date -date
SELECT EMPLOYEE_ID, SYSDATE, HIRE_DATE, SYSDATE- HIRE_DATE, ROUND(SYSDATE- HIRE_DATE) 
FROM EMPLOYEES; --date - date = number of days

--MONTHS_BETWEEN -- Takes 2 dates as parameters and returs the number of months between them.

SELECT EMPLOYEE_ID, FIRST_NAME, MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEES;

The latest date should always be the first parameter otherwise it will return a negative result.

--add_months
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(SYSDATE,4)
FROM EMPLOYEES;

--If the number to add is -ve, it deducts the months
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(SYSDATE,-4)
FROM EMPLOYEES;

NEXT_DAY (DATE, day) -- U can put day or the day identifier eg 1= sunday

SELECT EMPLOYEE_ID, FIRST_NAME, NEXT_DAY(SYSDATE, 'FRIDAY')
FROM EMPLOYEES;

-- U can put day or the day identifier eg 1= Monday

SELECT EMPLOYEE_ID, FIRST_NAME, NEXT_DAY(SYSDATE, 'FRIDAY'), NEXT_DAY(SYSDATE, 5)
FROM EMPLOYEES;

-- Last_day - retrieves last date of the month.

SELECT LAST_DAY(SYSDATE) FROM DUAL;

--ROUND(DATE,'MONTH') --Rounds to the nearest beginning of the month ie, if date is 1-15, results in the first day of the current month
--If date is 16-31, results to the first day of the next month

--ROUND(DATE,'YEAR') --Rounds to the nearest beginning of the year ie, if month is  1-6, results in the first day of the current year
--If month is 7-12, results to the first day of the next year.

--TRUNC(HIRE_DATE,'MONTH') -- Results in the first day of the current month despite the date
--TRUNC(HIRE_DATE,'YEAR') -- Results in the first day of the current year despite the month

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ROUND(HIRE_DATE,'MONTH'), ROUND(HIRE_DATE,'YEAR'), TRUNC(HIRE_DATE,'MONTH'), TRUNC(HIRE_DATE,'YEAR')
FROM EMPLOYEES;

--NESTED FUNCTIONS
--Nested functions are evaluated from the deepest level and the result is passed to the next function until the top most function.

SELECT SUBSTR(UPPER(FIRST_NAME),1,3) FROM
EMPLOYEES;



.
--*/
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

SET DEFINE OFF
SELECT * FROM DEPARTMENTS
WHERE DEPARTMENT_NAME LIKE '%&t';

SELECT employee_id,length(first_name),first_name, substr(first_name,1,3),
substr(first_name,2,4),
substr(first_name,2) ,--if u dnt specifify the n, it counts to the last value
substr(first_name,-3) --if m is negative, it counts from the end.
FROM EMPLOYEES;

SELECT employee_id,first_name,
instr(first_name,'E'),
instr(first_name,'e',2), --starts from 2nd position but returns the position of e from the start of the string not from second position
instr(first_name,'e',5), --starts from 5th position but returns the position of e from the start of the string not from second position
instr(first_name,'zabe',3,1) --starts from 1st position but returns the position of the SECOND e from the start of the string not from second position
FROM EMPLOYEES
--WHERE FIRST_NAME = 'Nanette'
;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, LPAD (SALARY,10,'#'), RPAD(salary,10,'*')
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, REPLACE(FIRST_NAME,'a', '*'), REPLACE (FIRST_NAME, 'en','#')
FROM EMPLOYEES;

select 1+1 from SYS.DUAL;

SELECT TRIM (' ' FROM ' Ayebare Ian ') trimmed from DUAL; -- Leading or trailing is not specified, the function trims from both both ends

SELECT TRIM (leading 'A' FROM 'Ayebare Ian ') trimmed from DUAL; -- Trims only from the strart of the string

SELECT TRIM (trailing ' ' FROM ' Ayebare Ian ') trimmed from DUAL; -- If leading or trailing is not specified, the function trims from both both ends


SELECT ROUND(10.56,1) FROM DUAL;
SELECT ROUND(10.5634,2) FROM DUAL; --Rounds off to two decimal places.
SELECT ROUND(555.493,-2) FROM DUAL; --Evaluates to 600.
SELECT ROUND(470.92,-3) FROM DUAL; --Evaluates to 0 since 4 is less than 5.
SELECT TRUNC(10.56) FROM DUAL;
SELECT TRUNC(10.56,1) FROM DUAL; --Cuts off to one decimal place.
SELECT TRUNC(19.5634,-1) FROM DUAL; --Cuts off the first number on the left of the decimal point ie 9 becomes 0 making the answer 10.. The rest of the digits become zero 
SELECT TRUNC(870.92,-3) FROM DUAL; --Evaluates to 0 since 4 is less than 5.

SELECT MOD (5,2) FROM DUAL;

--Date Arithmetic
--date - number
select sysdate, sysdate-3, sysdate + 3 from dual --gives date - plus number = date
--Date -date
SELECT EMPLOYEE_ID, SYSDATE, HIRE_DATE, SYSDATE- HIRE_DATE, ROUND(SYSDATE- HIRE_DATE) 
FROM EMPLOYEES; --date - date = number of days

SELECT EMPLOYEE_ID, FIRST_NAME, MONTHS_BETWEEN(SYSDATE, HIRE_DATE)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(SYSDATE,4)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ADD_MONTHS(SYSDATE,-4)
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, NEXT_DAY(SYSDATE, 'FRIDAY')
FROM EMPLOYEES;

SELECT EMPLOYEE_ID, FIRST_NAME, NEXT_DAY(SYSDATE, 'FRIDAY'), NEXT_DAY(SYSDATE, 7)
FROM EMPLOYEES;

SELECT (LAST_DAY(SYSDATE)) FROM DUAL;

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, ROUND(HIRE_DATE,'MONTH'), ROUND(HIRE_DATE,'YEAR'), TRUNC(HIRE_DATE,'MONTH'), TRUNC(HIRE_DATE,'YEAR')
FROM EMPLOYEES;

SELECT FIRST_NAME, SUBSTR(UPPER(FIRST_NAME),1, 3) FROM
EMPLOYEES;  
