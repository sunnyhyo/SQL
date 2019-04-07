 use MagicCorp
 go

select dname
from department
where dno  = ( select dno
               from employee
               where ename='이문세'  )

select ename, salary
from employee 
where salary > ( select avg(salary)
                 from employee )

select ename, salary, dno 
from employee 
where dno IN (select distinct dno 
              from employee 
              where salary>500)

select ename, salary 
from employee 
where salary > ( select max(salary) 
                 from employee 
                 where dno=30)

select ename, salary 
from employee 
where salary > ALL ( select salary
                     from employee
                     where dno=30)

select ename, salary 
from employee 
where salary > ( select min(salary) 
                 from employee 
                 where dno=30)

select ename, salary 
from employee 
where salary > ANY ( select salary 
                     from employee 
                     where dno=30)

select * 
from department 
where EXISTS ( select *  
                from employee 
                where employee.dno=10)

select * 
from department 
where EXISTS ( select *  
               from employee 
               where employee.dno=department.dno)

select ename, salary
from employee 
where dno = ( select dno
               from department
               where  dname='영업부')