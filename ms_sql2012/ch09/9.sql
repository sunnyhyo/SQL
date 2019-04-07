use MagicCorp
go

insert into department
(dno, dname, loc)
values(50, '토목부', '일산')

select * from department

insert into department
(dno, dname, loc)
values(60, '생산부')

insert into department
(dno, dname, loc)
values(60, '생산부', '포천', 20)

insert into department
(num, dname, loc)
values(60, '생산부', '포천')

insert into department
(dno, dname, loc)
values(60, 생산부, '포천')

insert into department
values(60, '생산부', '포천')


select * from department

insert into department
values(80, '회계부', NULL)

insert into department
values(90, '기획부', '')

drop table  department2

select * into department2
from department where 0=1

insert into department2
select top(3) * from department 

select * from department2

select * into employee01 from employee

select * from employee01

update employee01
set dno=30

select * from employee01 

update employee01 
set salary = salary * 1.1

select * from employee01  

update employee01 
set hiredate = getdate()

select * from employee01 


select * into employee02 from employee

select * from employee02

update employee02
set dno=30
where dno=10

select * from employee02

update employee02
set salary = salary * 1.1 
where salary >= 500

select * from employee02

update employee02
set hiredate = getdate()
where hiredate like '%2005%'

select * from employee02

drop table employee01

select * into employee01 from employee

select * from employee01


update employee01
set dno=20, job='이사'
where ename='이문세'

select * from employee01 where ename='이문세'

update employee01
set hiredate = getdate(), salary=700, commission=100
where ename='이문세'

select * into department01 from department

update  department01
set loc=(select loc 
         from department01
         where dno=40)
where dno=20

select * from department01

delete from department01

insert into department01
select * from department

delete from department01
where dno=30

delete from employee01

insert into employee01
select * from employee 

select * from employee01

delete from employee01
where dno=(select dno
            from department
            where dname='영업부')


select * from employee01

delete from department01

insert into department01
select * from department

select * from department01

BEGIN TRAN

delete from department01

select * from department01

ROLLBACK TRAN 

select * from department01

BEGIN TRAN

delete from department01 where dno=20

select * from department01

COMMIT TRAN


BEGIN TRAN
ROLLBACK TRAN

select * from department01


create table employee03(    
   eno int not null,
   ename nvarchar(20),
   job nvarchar(20),
   salary int
)

insert into employee03 values(1000, 'APPLE', 'POLICE', 100)
insert into employee03 values(1010, 'BANANA', 'NURSE', 150)
insert into employee03 values(1020, 'ORANGE', 'DOCTOR', 250)
insert into employee03 values(1030, 'VERY', NULL, 250)
insert into employee03 values(1040, 'CAT', '', 200)

select * from employee03

insert into employee03
select eno, ename, job, salary from employee where dno=10

update employee03 set salary=salary-50
where salary>=300

select * from employee03

delete from employee03
where job is null or job=''