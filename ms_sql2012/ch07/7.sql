use MagicCorp
go

select *
from employee, department

select *
from employee, department
where employee.dno = department.dno

select ename, dname                  
from  employee, department             
where employee.dno = department.dno 

select ename, dname                  
from  employee, department             
where employee.dno = department.dno 
and ename='이문세'

select ename, dname, dno       
from  employee, department                  
where employee.dno = department.dno
and ename='이문세'

select employee.ename, department.dname, employee.dno 
from employee, department 
where employee.dno = department.dno
and ename='이문세'

select ename, dname, employee.dno
from  employee, department                  
where employee.dno = department.dno
and ename='이문세'

select ename, salary, grade
from employee, salgrade 
where salary between lowsal and highsal

select e.ename, e.salary, s.grade
from employee e, salgrade s  
where salary >= lowsal and salary <= highsal

select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and e.salary between s.lowsal and s.highsal

select member.ename as [사원이름], manager.ename as [직속상관이름]
from employee member, employee manager
where member.manager = manager.eno

select * 
from employee cross join department

select ename, dname 
from employee, department
where employee.dno=department.dno

select ename, dname 
from employee INNER JOIN department
ON employee.dno=department.dno

select ename, dname
from employee INNER JOIN department
ON employee.dno=department.dno 
where ename='이문세'

select member.ename as [사원이름], manager.ename as [직속상관이름]
from employee member LEFT OUTER JOIN employee manager
ON member.manager = manager.eno

select dno, dname into dept01
from department
where dno in(10, 20)

select * from dept01

select dno, dname into dept02
from department
where dno in(10, 30)

select * from dept02

select *
from dept01 INNER JOIN dept02
ON DEPT01.dno = dept02.dno

select *
from dept01 LEFT OUTER JOIN dept02
ON dept01.dno = dept02.dno

select *
from dept01 RIGHT OUTER JOIN dept02
ON dept01.dno = dept02.dno

select *
from dept01 FULL OUTER JOIN dept02
ON dept01.dno = dept02.dno

create table member(
id int,
name nvarchar(20),
tel nvarchar(13),
address nvarchar(50)
)

insert into member values(1, '김우성', '010-6298-0394', '송파구 잠실2동')
insert into member values(2, '김태희', '010-9596-2048', '강동구 명일동')
insert into member values(3, '하지원', '010-0859-3948', '강동구 천호동')
insert into member values(4, '유재석', '010-3045-3049', '강남구 서초동')

select * 
from member

create table worker(
number int,
irum nvarchar(20),
hp nvarchar(13),
location nvarchar(50)
)

insert into worker values(2, '김태희', '010-9596-2048', '강동구 명일동')
insert into worker values(3, '하지원', '010-0859-3948', '강동구 천호동')
insert into worker values(4, '유재석', '010-3045-3049', '강남구 서초동')
insert into worker values(5, '강호동', '010-2049-5069', '송파구 석촌동')
insert into worker values(10,'안성기', '010-3050-3049', '강남구 압구정동')

select *
from worker


select * 
from member
union 
select *
from worker


select * 
from member
union all
select *
from worker

select e.ename, e.hiredate
from employee e, department d
where e.dno = d.dno
and d.dname='경리부'


select e.ename, e.salary
from employee e INNER JOIN department d
ON e.dno = d.dno
and d.loc='인천'