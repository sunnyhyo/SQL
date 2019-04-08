/* CH5 함수 사용하기 

- 집계함수 
- GROUP BY 와 HAVING 
- 다차원 집계함수 
- 조건에 따라 서로 다른 처리가 가능한 CASE
- PIVOT 과 UNPIVOT (생략)
- RANKS (생략)  */

/* 집계함수 
  집계함수는 하나 이상의 행을 그룹으로 묶어 연산하여 총합, 평균 등 하나의 결과로 나타남 
  
  COUNT, AVG, MAX, MIN,STDDEV, COUNT_BIG (그룹의 총 개수)
  
  COUNT(*) 을 제외하고 집계함수는 NULL 값 제외 
  집계함수 옆에 붙는 DISTINCT 연산자는 함수에서 내부적으로 연산을 할 때 중복된 값을 제외하기 위해서 사용
  MIN, MAX 함수에서는 당연히 하나의 값만 나오므로 DISTINCT 라는 것은 의미가 없다*/

SELECT SUM(SALARY) AS [급여총액]
FROM EMPLOYEE;

SELECT SUM(COMMISSION) AS [커미션총액]
FROM EMPLOYEE;

SELECT AVG(SALARY) AS [급여평균]
FROM EMPLOYEE;

SELECT MAX(SALARY) AS 최대급여, MIN(SALARY) AS 최소급여
FROM EMPLOYEE;

-- 집계함수와 단순칼럼 
SELECT MAX(SALARY) AS [최대급여]
FROM EMPLOYEE;

SELECT ENAME, MAX(SALARY) AS [최대급여]
FROM EMPLOYEE; 
/* 오류 
  집계한수의 결과값은 단 한개의 로우, 직원의 이름은 14개 
  각각 산출되는 로우가 달라 둘을 매치시킬 수 없음
  -> SELECT 에 집계함수를 사용하는 경우, 집계함수를 적용하지 않은 단순칼럼은 올 수 없다. 
  -> 최대 급여를 받는 사원의 이름을 출력하려면 서브쿼리문을 배워야 한다. */

-- 로우 개수 구하는 COUNT 함수
SELECT COUNT(COMMISSION) AS [커미션을 받은 사원의 수]  -- COUNT 함수는 NULL값에 대해 개수를 세지 않는다
FROM EMPLOYEE;

SELECT COUNT(*) AS [전체 사원의 수],   -- COUNT(*) 테이블의 전체 로우 개수를 구함
	COUNT(COMMISSION) AS [커미션을 받는 사원의 수] --COUNT(COMMISSION) COMMISSION 칼럼에서 NULL이 아닌 행의 개수를 구함
FROM EMPLOYEE;

SELECT COUNT(JOB) AS [직업의 개수]
FROM EMPLOYEE;

-- 14 건 산출, 같은 내용이 중복되어 산출된다. COUNT 함수로 JOB 칼럼을 카운팅하면 중복된 로우를 카운팅.
SELECT JOB 
FROM EMPLOYEE 
ORDER BY JOB ;

-- 직업의 종류가 몇 개인지, 즉 중복되지 않은 직업의 개수를 카운팅하기 
SELECT COUNT(DISTINCT JOB) AS [업무수]
FROM EMPLOYEE ;

/* GROUP BY 와 HAVING 
	집계함수를 쓰되 어떤 칼럼 값을 기준으로 집계함수를 적용해 줄지 기술해 준다. 
	GROUP BY 절 뒤에 해당 칼럼을 기술
	별칭 x, 컬럼명 o 
	
	SELECT 컬럼명, 집계함수 
	FROM 테이블명
	WHERE 조건 (연산자)
	GROUP BY 칼럼명  */

SELECT DNO
FROM EMPLOYEE
GROUP BY DNO;

SELECT AVG(SALARY) AS [급여 평균] 
FROM EMPLOYEE 
GROUP BY DNO;

SELECT DNO, AVG(SALARY) AS [급여 평균] 
FROM EMPLOYEE 
GROUP BY DNO;

SELECT DNO AS [부서번호], AVG(SALARY) AS [급여 평균] 
FROM EMPLOYEE 
GROUP BY DNO; -- GROUP BY 부서번호 : 오류 

SELECT DNO, SALARY 
FROM EMPLOYEE 
ORDER BY DNO;

/*집계함수 사용 시 단순 칼럼은 SELECT 리스트에 올 수 없다. 
 단, GROUP BY 절 뒤에 묶인 단순 칼럼은 SELECT 리스트에 기술 할 수 있고, 기술해야만 정보로써의 의미가 있다. 
 -> 집계함수 사용 시 GROUP BY 절로 묶이지 않은 단순 칼럼은 SELECT 리스트에 오면 오류 */

-- GROUP BY 절에 명시하지 않ㅇ느 칼럼을 SELECT 절에 사용한 잘못된 예제
SELECT DNO, ENAME, AVG(SALARY) AS [급여평균]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, ENAME, AVG(SALARY) AS [급여평균]
FROM EMPLOYEE
GROUP BY DNO, ENAME;


-- 소속 부서별로 급여총액과 평균급여 구하기
SELECT DNO, SUM(SALARY) AS [급여총액], AVG(SALARY) AS [급여평균]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, SUM(SALARY) AS [급여총액], AVG(SALARY) AS [급여평균1], 
	COUNT(DNO) AS [부서인원수], SUM(SALARY)/COUNT(DNO) AS [급여평균2]
FROM EMPLOYEE
GROUP BY DNO;

/* 예제에서 집계함수를 사용할 때 단순 칼럼과 함께 사용하지 못한다고 했음
   -> 집계함수의 결과값과 단순 칼럼이 매칭 불가능하기 때문
   하지만 DNO 란 칼럼을 GROUP BY 에 사용하여 부서별로 집계함수의 결과값을 구했기 때문에 
   에러가 발생하지 않음  */

SELECT DNO, SALARY 
FROM EMPLOYEE
ORDER BY DNO DESC, SALARY DESC;

SELECT DNO, MAX(SALARY) AS [최대급여], MIN(SALARY) AS [최소급여]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, COMMISSION
FROM EMPLOYEE 
ORDER BY DNO;

SELECT DNO, COUNT(*) AS [부서별 사원 수], COUNT(COMMISSION) AS [커미션 받는 사원 수]
FROM EMPLOYEE
GROUP BY DNO;

/* HAVING 조건 
   SELECT 절에 조건을 사용하여 결과를 제한 할 때는 WHERE 절을 사용하지만 
   그룹의 결과를 제한하려면 HAVING 절을 사용한다. 
   
   WHERE : 테이블에서 결과를 가져올 때 그 테이블에서 특정 조건에 부합하는 자료만 검색하고자 할 때 사용하는 절
   -> 단순 칼럼 사용
   HAVING : 집계함수 사용 시 집계함수를 적용해서 나온 결과 값 중에서 원하는 조건에 부합하는 자료만 산출하고 싶을 때 사용
   -> 집계함수를 사용한 칼럼을 조건으로 사용*/

SELECT DNO, AVG(SALARY) AS [부서별 평균 급여]
FROM EMPLOYEE 
GROUP BY DNO
HAVING AVG(SALARY) >= 500;

SELECT DNO, AVG(SALARY) AS [최소급여], MAX(SALARY) AS [최대급여]
FROM EMPLOYEE 
GROUP BY DNO
HAVING MAX(SALARY) > 500;

-- HAVING, WHERE 함께 사용시 계산 어떻게 되는지?????


/* 03 다차원 집계함수의 사용 

- ROLLUP 
- CUBE */

/* 04 조건에 따라 서로 다른 처리가 가능한 CASE
- CASE  */

/* 05 PIVOT 과 UNPIVOT 
- PIVOT 
- UNPIVOT */

/* 06 RANKS 
- RANK
- DENSE_RANK 
- ROW_NUMBER 
- NTILE 
- PARTITION BY */

/* 07 추가된 비교함수
- IFF 
- CHOOSE
- 시퀀스
*/

