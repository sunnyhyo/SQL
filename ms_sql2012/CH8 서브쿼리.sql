/* CH08 서브쿼리

 SELECT select_list
 FROM table_list 
 WHERE column = ( select expression 
				  from select_list 
				  where table_list )

 01 서브 쿼리의 기본 개념

 메인쿼리 : 서브 쿼리를 포함하고 있는 쿼리문 
 서브쿼리 : 포함된 하나의 쿼리문. 
			하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 문장

 SELECT, INSERT, UPDATEM DELETE 와 같은 DML(DATA MANUPLATION LANGUAGE) 문 모두에서 사용할 수 있다.

 - 서브 쿼리 안에 서브 쿼리 들어갈 수 있다. 네스팅이라고 하며 메모리 허용 한에서 무제한 중첩 가능 
 - 메인 뭐리에서 서브 쿼리의 결과 값을 조건으로 사용할 때 SOME, ANY, ALL 연산자를 사용하지 않는 일반적인 경우에는
 서브쿼리에서는 하나의 레코드값을 리턴해야 한다. 대부분의 경우 서브쿼리에서는 GROUP BY, HAVING 문을 사용할 수 없다
 - 서브 쿼리에서 ORDER BY 문은 TOP 연산자와 함께 있을 때만 사용 가능
 - 서브 쿼리에서 SELECT 하지 않은 칼럼은 주 쿼리에서 사용할 수 없다

*/

--  사원이름이 이문세인 사원의 부서번호화 부서이름 알아내기 
SELECT DNO
FROM EMPLOYEE
WHERE ENAME = '이문세';

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = 10;

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = (  -- 서브쿼리가 실행되어 10이 구해짐 -> WHERE DNO = 10
			SELECT DNO
			FROM EMPLOYEE
			WHERE ENAME = '이문세'
			);


/* 1.1 단일 행 서브쿼리 
 
  수행 결과가 오직 하나의 로우만을 반환하는 서브 쿼리를 갖는 것을 말한다. */

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = (	-- 메인 쿼리의 WHERE 절에서는 단일 행 비교 연산자인 =, >, => , <, =< , <> 를 사용해야 한다. 
				SELECT DNO
				FROM EMPLOYEE
				WHERE ENAME = '이문세'  );


/* 1.2 서브 쿼리에서 그룹 함수의 사용
  사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색해 봅니다 .
*/

-- 평균급여 
SELECT AVG(SALARY)
FROM EMPLOYEE; 


-- 평균급여 보다 더 많은 급여를 받는 사원 출력하기 
SELECT ENAME, SALARY
FROM EMPLOYEE 
WHERE SALARY > ( -- 사원들의 평균 급여는 하나의 값이므로 단일행 서브 쿼리
				SELECT AVG(SALARY)
				FROM EMPLOYEE);


/* 02 다중 행 서브쿼리 
 다중 행 서브쿼리는 서브 쿼리에서 반환되는 결과가 하나 이상의 행일 때 사용하는 서브 쿼리입니다. 
 다중 행 서브 쿼리느 반드시 다중 행 연산자와 함게 사용된다 */

/* 2.1 IN 연산자 
 메인 쿼리의 비교 조건에서 서브 쿼리의 출력 결과와 하나라도 일치하면 메인 쿼리의 WHERE 절의 참이 되도록 하는 연산자.*/

-- 급여가 500을 초과하는 사원이 소속된 부서의 부서 번호 출력하기 

SELECT DISTINCT DNO
FROM EMPLOYEE 
WHERE SALARY > 500;

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE 
WHERE DNO = (SELECT DISTINCT DNO
			FROM EMPLOYEE 
			WHERE SALARY > 500);

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE 
WHERE DNO IN (SELECT DISTINCT DNO
			FROM EMPLOYEE 
			WHERE SALARY > 500);


/* 2.2 ALL 연산자 
  ALL 조건은 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 모든 값이 일치하면 참이다. 
  찾아진 값에 대해서 AND 연산을 해서 모두 참이면 참이된다. */

-- 30번 부서의 최대 급여 구하기
SELECT MAX(SALARY)
FROM EMPLOYEE 
WHERE DNO = 30;

-- 30번 부서의 최대 급여보다 많은 급여를 받는 사원 출력하기 
-- 단일서브쿼리 

SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (
				SELECT MAX(SALARY)
				FROM EMPLOYEE
				WHERE DNO = 30);


-- 30번 부서의 최대 급여보다 많은 급여를 받는 사원 출력하기 

SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > ALL ( -- >ALL 연산자는 서브쿼리의 모든 결과값에 대해서 커야만 한다. 
					 -- 30 번 부서의 최대 급여보다 많은 급여를 받는 사원들에 대해서 출력  
					SELECT SALARY 
					FROM EMPLOYEE
					WHERE DNO = 30);

/* 2.3 ANY 연산자 
 ANY 조건은 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참
 > ANY 는 찾아진 값에 대해서 하나라도 크면 참이 된다. */

-- 30번 부서 소속 사원들 중에서 가장 적은 급여 출력
SELECT MIN(SALARY)
FROM EMPLOYEE
WHERE DNO =30;

-- 30번 부서 최소 급여보다 많은 급여를 받는 사원 출력
-- 단일서브쿼리문
SELECT ENAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY >  (   SELECT MIN(SALARY)
					FROM EMPLOYEE
					WHERE DNO =30);


-- 30 번 부서 소속의 사원들의 급여 출력 
SELECT SALARY 
FROM EMPLOYEE 
WHERE DNO = 30;

-- 30 번 부서의 최소 급여보다 많은 급여를 받는 사원 출력
-- 다중행서브쿼리문  >ANY 
SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > ANY ( SELECT SALARY	
					FROM EMPLOYEE
					WHERE DNO = 30);

-- 구해지는 부서 번호가 30번인 사원들의 급여들 중 어느 하나에 대해서 크면 조건에 만족
-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원들을 조회

/* 2.3 EXISTS 연산자 

  주로 서브쿼리문에서 주로 사용하며 서브 쿼리의 결과값이 참이 나오기만 하면 바로 메인 쿼리의 
  결과 값을 리턴한다. 서브 쿼리의 결과값이 존재하지 않는다면, 메인쿼리의 어떤 값도 리턴되지 않는다, 
  속도는 IN 보다 EXISTS 가 빠름 */

SELECT *
FROM DEPARTMENT 
WHERE EXISTS(   SELECT *
				FROM EMPLOYEE
				WHERE EMPLOYEE.DNO =30);


-- EXISTS 연산자와 주테이블의 칼럼을 참조하는 서브쿼리
SELECT *
FROM DEPARTMENT 
WHERE EXISTS (SELECT *
			  FROM EMPLOYEE 
			  WHERE EMPLOYEE.DNO = DEPARTMENT.DNO)  -- 메인쿼리 테이블을 참조
-- 서브쿼리와 메인쿼리가 INNER JOIN으로 같이 묶였다. 
-- 보통의 SQL 구문은 이러한 식으로 메인 쿼리와서브 쿼리를 서로 연관성 있게 묶어서 표현하는 구문 많음


-- 연습문제 
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = (SELECT DNO FROM DEPARTMENT WHERE DNAME = '영업부');
