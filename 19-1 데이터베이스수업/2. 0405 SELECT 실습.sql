/* 0405 실습 SELECT */

/* 1. 전체부서의 모든 애트리뷰트를 검색 */ 
SELECT *
FROM DEPARTMENT;

/* 2. 모든 부서의 부서번호와 부서 이름을 검색*/
SELECT DEPTNO, DEPTNAME
FROM DEPARTMENT;

/* 3. 모든 사원의 직급을 검색*/
SELECT TITLE
FROM EMPLOYEE;

/* 4. 모든 사원의 상이한 직급을 검색*/
SELECT DISTINCT TITLE 
FROM EMPLOYEE;

/* 5. 2번 부서에 근무하는 사원들에 관한 모든 정보 검색*/
SELECT *
FROM EMPLOYEE
WHERE DNO = 2 ;

/* 6. 이씨 성을 가진 사원들의 이름, 직급, 소속, 부서번호 검색*/
SELECT E.EMPNAME, E.TITLE, D.DEPTNAME, E.DNO
FROM EMPLOYEE E, DEPARTMENT AS D
WHERE E.DNO = D.DEPTNO AND E.EMPNAME LIKE '이%';

/* 7. 이씨 성이 아닌 사원들의 이름 */
SELECT E.EMPNAME
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO = D.DEPTNO AND E.EMPNAME NOT LIKE '이%'

/* 8. 이름의 세번째 글자가 래인 사원의 이름을 검색하라*/
SELECT EMPNAME
FROM EMPLOYEE
WHERE EMPNAME LIKE '__래%'

/* 9. 직급이 대리이면서 2번 부서에서 근무하는 사원들의 이름과 급여를 검색*/
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '대리' AND DNO = 2;


/* 10. 직급이 과장이면서 1번 부서에 속하지 않은 사원들의 이름과 급여를 검색*/
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '과장' AND DNO <> 1 ;

/* 11. 급여가 3000000원 이상이고, 45000000원 이하인 사원들의 이름과 급여를 검색*/
SELECT EMPNAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY >= 3000000 AND SALARY <= 45000000;

SELECT EMPNAME, SALARY 
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 45000000;

/* 12. 1번 부서나 3번 부서에 소속된 사원들에 대하여 이름과 현대의 급여, 
급여가 10% 인상되었을 때의 값을 검색하여 급여의 오름차순으로 정렬하라. 
급여가 동일할 때는 사원이름의 내림차순으로 정렬*/

SELECT EMPNAME, SALARY, SALARY * 1.1 AS NEWSALARY
FROM EMPLOYEE 
WHERE DNO = 2 OR DNO = 3
ORDER BY NEWSALARY ASC, EMPNAME DESC;

/* 13. 부서별로 그룹 후 직원 수가 3명 이상 부서에 대해서 부서번호, 평균급여*/
SELECT DNO, AVG(SALARY) AS AVGSAL
FROM EMPLOYEE
GROUP BY DNO
HAVING COUNT(DNO) >= 3;


SELECT EMPNAME, DNO, SALARY 
FROM EMPLOYEE AS E 
WHERE SALARY > 
	  (SELECT AVG(SALARY)
	  FROM EMPLOYEE 
	  WHERE DNO = E.DNO);