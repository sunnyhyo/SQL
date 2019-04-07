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

select ename, salary*12+isnull(commission, 0) as ����
from employee

select ename, salary*12+isnull(commission, 0) ����
from employee


select ename, salary*12+isnull(commission, 0) "��    ��"
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
where ename='�̹���'

select * from employee 
where hiredate<'2005/01/01'

select * from employee  
where dno=10 and job='����'

select * from employee  
where dno=10 or job='����'

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
where ename like '��%'

select * from employee 
where ename like '%��%'

select * from employee 
where ename like '%��'


select * from employee 
where ename like '_��%'

select * from employee 
where ename like '__��%'

select * from employee 
where ename not like '%��%'

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

select dno �μ���ȣ, dname as �μ���
from department

select distinct job
from employee

select eno, ename, salary
from employee
where salary<=300

select eno, ename, salary
from employee
where ename='����ȣ'

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
where ename  like '��%'

select eno, ename 
from employee 
where ename like '%��%'

select eno, ename 
from employee 
where ename like '%��'

select *
from employee 
where manager IS NULL

select dno, eno, ename, job, hiredate
from employee  
order by dno asc, ename asc