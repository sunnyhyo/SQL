USE MagicCorp
GO

select eno, ename
from employee

select * 
from employee

select ename, salary, salary*12
from employee

select ename, salary, job, dno, commission, 
      salary*12, salary*12+commission
from employee

select ename, salary, job, dno, isnull(commission, 0), 
       salary*12, salary*12+isnull(commission, 0) 
from employee

select ename, salary*12+isnull(commission, 0) as 연봉
from employee

select ename, salary*12+isnull(commission, 0) 연봉
from employee


select ename, salary*12+isnull(commission, 0) "연    봉"
from employee

select dno
from employee         

select distinct dno
from employee  

select * from employee 
where salary >= 500     

select * from employee 
where dno=10   

select * from employee 
where ename='이문세'

select * from employee 
where hiredate<'2005/01/01'

select * from employee  
where dno=10 and job='과장'

select * from employee  
where dno=10 or job='과장'

select * from employee  
where dno=10

select * from employee  
where not dno=10

select * from employee  
where dno <> 10

select * from employee 
where salary>=400 and salary<=500

select * from employee 
where salary<400 or salary>500

select * from employee 
where commission=80 or commission=100 or commission=200

select * from employee 
where salary between 400 and 500

select * from employee 
where salary not between 400 and 500

select * from employee 
where hiredate between '2003/01/01' and '2003/12/31'

select * from employee 
where commission in(80, 100, 200)

select * from employee 
where commission<>80 and commission<>100 and commission<>200

select * from employee 
where commission not in(80, 100, 200)

select * from employee 
where ename like '이%'

select * from employee 
where ename like '%성%'

select * from employee 
where ename like '%성'


select * from employee 
where ename like '_성%'

select * from employee 
where ename like '__성%'

select * from employee 
where ename not like '%성%'

select ename, dno, commission
from employee

select * from employee 
where commission is null

select * from employee 
where commission is not null

select * from employee 
order by salary asc

select * from employee 
order by salary 


select * from employee 
order by salary desc

select * from employee 
order by ename

select * from employee 
order by hiredate desc

select * from employee 
order by salary desc, ename asc

select top(5) *   
from employee
order by salary desc

select top(5) with ties *  
from employee
order by salary desc

select top(20) percent *  
from employee
order by salary desc

select ename, salary, hiredate 
from employee

select dno 부서번호, dname as 부서명
from department

select distinct job
from employee

select eno, ename, salary
from employee
where salary<=300

select eno, ename, salary
from employee
where ename='오지호'

select eno, ename, salary 
from employee
where salary=250 or salary=300 or salary=500 

select eno, ename, salary 
from employee
where salary IN (250, 300, 500)

select eno, ename, salary 
from employee
where salary <> 250 and  salary <> 300 and  salary <> 500

select eno, ename, salary 
from employee
where salary not IN (250, 300, 500)

select eno, ename 
from employee 
where ename  like '김%'

select eno, ename 
from employee 
where ename like '%기%'

select eno, ename 
from employee 
where ename like '%기'

select *
from employee 
where manager IS NULL

select dno, eno, ename, job, hiredate
from employee  
order by dno asc, ename asc