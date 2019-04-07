
USE MagicCorp
go

drop table emp_copy
drop view emp_view30

-- employee을 원본 테이블로 하여 emp_copy 테이블을 새롭게 생성합니다.
select * into emp_copy from employee

-- 생성된 기본 테이블을 확인합니다.
select * from emp_copy

create view emp_view30
as 
select eno, ename, dno
from emp_copy
where dno=30

select * from emp_view30

EXEC SP_helptext EMP_VIEW30

insert into emp_view30
values(1111, 'aaaa', 30)

select * from emp_view30

select * from emp_copy

select e.eno, e.ename, e.salary, e.dno, d.dname, d.loc
from emp_copy e, department d
where e.dno = d.dno



create view emp_view_dept 
as
select e.eno, e.ename, e.salary, e.dno, d.dname, d.loc
from emp_copy e, department d
where e.dno = d.dno

SELECT * FROM EMP_VIEW_DEPT;



create view emp_view20
WITH ENCRYPTION 
as 
select eno, ename, dno
from emp_copy
where dno=20




EXEC SP_HELPTEXT emp_view20




create view emp_view10
WITH SCHEMABINDING
as 
select eno, ename, dno
from dbo.emp_copy
where dno=10


ALTER TABLE emp_copy
ALTER COLUMN ename nvarchar(50)

create view emp_view30_nochk
as 
select eno, ename, salary, commission, dno
from emp_copy
where dno=30

select * from emp_view30_nochk

begin tran      

update emp_view30_nochk set dno=20
where salary>=300


select * from emp_view30_nochk


rollback

create view emp_view30_chk
as 
select eno, ename, salary, commission, dno
from emp_copy
where dno=30 WITH CHECK OPTION

select * from emp_view30_chk


update emp_view30_chk set dno=20
where salary>=300

alter view emp_view30
as 
select eno, ename, salary, commission, dno
from emp_copy
where dno=30



drop view emp_view_dept


create view sal_view
as
select d.dname, max(e.salary) as max_sal , min(e.salary) as min_sal 
from emp_copy e, department d
where e.dno = d.dno
group by d.dname

select * from  sal_view




