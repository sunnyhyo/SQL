use MagicCorp
go
select sum(salary) from employee 

select sum(salary) as [�޿� �Ѿ�]
from employee 

select sum(commission) as [Ŀ�̼� �Ѿ�]
from employee 

select avg(salary) as [�޿� ���]
from employee

select max(salary) as [�ִ� �޿�], min(salary) as [�ּ� �޿�]
from employee 

select ename, max(salary) as [�ִ� �޿�]
from employee

select count(commission) as [Ŀ�̼��� ���� ����� ��]
from employee

select count(*) as [��ü ����� ��], 
       count(commission) as [Ŀ�̼� �޴� ��� ��]
from employee

select count(job) as [������]
from employee

select job from employee
order by job

select count(distinct job) as [���� ��]
from employee

select dno from employee
group by dno

select avg(salary) as [�޿� ���] from employee
group by dno

select dno, avg(salary) as [�޿� ���] from employee
group by dno

select dno, ename, avg(salary) as [�޿� ���] 
from employee
group by dno

select dno, sum(salary) as [�޿� �Ѿ�], avg(salary) as [�޿� ���] 
from employee
group by dno

select dno, max(salary) [�ִ� �޿�], min(salary) [�ּ� �޿�]
from employee  
group by dno

select dno, count(*) [�μ��� �����], count(commission) [Ŀ�̼� �޴� �����]
from employee 
group by dno

select dno, avg(salary) 
from employee 
group by dno
having avg(salary) >= 500

select dno, max(salary) [�ִ�޿�], min(salary) [�ּұ޿�]
from employee 
group by dno
having max(salary) > 500;

select dno, job, sum(salary)  as [�޿� �Ѿ�]
from employee 
group by dno, job 
order by dno

select dno, job, sum(salary)  as [�޿� �Ѿ�]
from employee 
group by dno, job with rollup


select dno, job, sum(salary)  as [�޿� �Ѿ�]
from employee 
group by dno, job with cube
order by dno desc, job desc


select ename, dno,
      case when dno=10 then '�渮��' 
            when dno=20 then '�λ��' 
            when dno=30 then '������' 
            when dno=40 then '�����'
       end as dname
from employee

create table test
(
  year int,
  quarter int,
  amount decimal(2,1)
)
go

insert into test values (2009, 1, 1.1) 
insert into test values (2009, 2, 1.2) 
insert into test values (2009, 3, 1.3) 
insert into test values (2009, 4, 1.4) 
insert into test values (2010, 1, 2.1) 
insert into test values (2010, 2, 2.2) 
insert into test values (2010, 3, 2.3) 
insert into test values (2010, 4, 2.4) 
insert into test values (2011, 1, 2.4) 
insert into test values (2011, 2, 2.4) 
insert into test values (2011, 3, 2.2) 
insert into test values (2011, 4, 2.3) 
go 


select year, [1], [2], [3], [4]
from test
pivot(sum(amount)
for quarter
in([1], [2], [3], [4])) as pvt
go

create table test2
(
  year int,
  Q1 decimal(2,1),
  Q2 decimal(2,1),
  Q3 decimal(2,1),
  Q4 decimal(2,1)
)
go 

insert into test2 values (2009, 1.1, 1.2, 1.3, 1.4) 
insert into test2 values (2010, 2.1, 2.2, 2.3, 2.4)
go 

select year, quarter, amount 
from test2
unpivot(amount 
for quarter
in([Q1], [Q2], [Q3], [Q4])) as unpvt
go 

select year, quarter, amount, 
       rank() over(order by amount desc) as ����
from test


select year, quarter, amount, 
  dense_rank() over(order by amount desc) as ����
from test

select dno, job, sum(salary)  as [�޿� �Ѿ�]
from employee 
group by dno, job with rollup

select ename, salary,
        rank() over(order by salary desc) as rank,
        dense_rank() over(order by salary desc) as dense_rank,
        row_number() over(order by salary desc) as row_number,
        ntile(6) over(order by salary desc) as ntile
from employee
select year, quarter, amount, 
   row_number() over(order by amount desc) as ����
from test

select year, quarter, amount, 
       ntile(6) over(order by amount desc) as ����
from test

select year, quarter, amount, 
       ntile(6) over(order by amount desc) as ����
from test

select year, quarter, amount, 
        rank() over(PARTITION BY year order by amount desc) as ����
from test

select sum(salary) as [�޿��Ѿ�]
from employee 

select dno, sum(salary) as [�޿��Ѿ�] from employee
group by dno

select dno, job, sum(salary)  as [�޿��Ѿ�]
from employee
group by dno, job 
order by dno

select ename, IIF(MANAGER is NULL, 'CEO', '�Ϲݻ��') AS ��å
from employee

SELECT CHOOSE (1, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;
SELECT CHOOSE (2, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;
SELECT CHOOSE (3, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;
SELECT CHOOSE (4, 'Manager', 'Director', 'Developer', 'Tester' ) AS Result;

drop table department01 

select * into department01 
from department where 1=0 

select * from department01

drop SEQUENCE deptSequence
CREATE SEQUENCE deptSequence AS INT
START WITH 10 
INCREMENT BY 10;

INSERT INTO department01 VALUES(NEXT VALUE FOR deptSequence, '�渮��', '����'); 
INSERT INTO department01 VALUES(NEXT VALUE FOR deptSequence, '�λ��', '��õ');
INSERT INTO department01 VALUES(NEXT VALUE FOR deptSequence, '������', '����'); 
INSERT INTO department01 VALUES(NEXT VALUE FOR deptSequence, '�����', '����');

select * from department01

SELECT  current_value 
FROM sys.sequences
WHERE name = 'deptSequence' ;



