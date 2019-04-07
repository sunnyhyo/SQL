USE MagicCorp
GO

DROP PROCEDURE usp_emp

CREATE PROCEDURE usp_emp
AS
SELECT eno, ename, salary, commission, dno
FROM employee
where commission is NOT NULL
order by ename 

EXEC usp_emp

ALTER PROCEDURE usp_emp
AS
SELECT eno, ename, salary, commission, dno, job
FROM employee
where commission is NOT NULL
order by ename desc 

DROP PROCEDURE usp_emp


CREATE PROCEDURE usp_emp2
  @ename NVARCHAR(20) = '%',
  @job NVARCHAR(20) = '%'
AS
SELECT *
FROM employee
where ename LIKE @ename
AND job LIKE @job

EXEC usp_emp2 

EXEC usp_emp2 '%��%' 

EXEC usp_emp2 @job = '%����%'

EXEC usp_emp2 '%��%', '%����%'

CREATE PROC usp_emp3
 @ename NVARCHAR(20) = '%',
 @CNT INT OUTPUT,
 @avgsalary INT OUTPUT
AS
 SELECT @CNT=COUNT(dno), @avgsalary=AVG(salary)
 FROM employee
 WHERE ename LIKE @ename

 DECLARE @CNT INT, @AVG INT
 EXEC usp_emp3 '%', @CNT OUTPUT,  @AVG OUTPUT
 SELECT @CNT,  @AVG


 
DROP PROC TEST1

CREATE PROC TEST1
 @job NVARCHAR(20) = '%',
 @maxsalary INT OUTPUT
AS
 SELECT @maxsalary=MAX(salary)
 FROM employee
 WHERE job LIKE @job

DECLARE @max INT
EXEC TEST1 '%����%', @max OUTPUT
SELECT @max [���޺� �ִ�޿�]

