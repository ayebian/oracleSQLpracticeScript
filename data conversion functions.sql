/*
--Using Conversion functions and conditional expressions
--Implicit vs explicit conversion
--Conversion functions
--to_date
--to_char
--to_number
-- Implicit data conversion
Oracle can implicitly convert:-
--EXPRESSIONS

--Varchar2 or Char to NUMBER
--Varchar2 or Char to date

example

SELECT * FROM employees
WHERE EMPLOYEE_ID = '100' --'100' is implicitly converted to 100 because 100 is a valid number 
OR HIRE_DATE='21-SEP-05'; --'21-SEP-05' is implicitly converted to '21-SEP-05' because '21-SEP-05' is a valid date

--EXPRESSION EVALUATIONS
Number to Varchar or Char
Date to Varchar or char

SELECT CONCAT(EMPLOYEE_ID, FIRST_NAME),
CONCAT(HIRE_DATE,FIRST_NAME)
FROM employees;
*/

SELECT * FROM employees
WHERE EMPLOYEE_ID = '100' --'100' is implicitly converted to 100 because 100 is a valid number 
OR HIRE_DATE='21-SEP-05'; --'21-SEP-05' is implicitly converted to '21-SEP-05' because '21-SEP-05' is a valid date

SELECT CONCAT(EMPLOYEE_ID, FIRST_NAME),--Number "EMPLOYEE_ID" is implicitily converted to varchar
CONCAT(HIRE_DATE,FIRST_NAME)--DATE  "HIRE_DATE" is implicitily converted to varchar
FROM employees;