-- CH7 테이블 조인하기 

/* 01 조인의 필요성 
 SELECT *
 FROM EMPLOYEE */

-- 사원테이블 정보에는 부서 번호만 있고, 부서 이름은 없음
SELECT *
FROM EMPLOYEE;

-- 특정 사원에 대한 부서이름을 알기 위해서 부서테이블을 사용해야한다
SELECT ENAME, DNO
FROM EMPLOYEE
ORDER BY DNO;

SELECT DNO, DNAME
FROM DEPARTMENT;

-- 관계 데이터베이스에는 두개 이상의 테이블 정보가 나누어져 있음. 중복저장을 지양하기 때문임

-- 이문세 사원의 부서번호 알아내기. 그 부서번호의 이름 알아내기
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE ENAME = '이문세';

SELECT DNO, DNAME
FROM DEPARTMENT
WHERE DNO = 10;


/* 02 CROSS JOIN 
SELECT 문의 FROM 절에 EMPLOYEE 테이블과 DEPARTMENT 테이블을 콤마로 연결해서 연속으로 기술하는 것*/

SELECT *
FROM EMPLOYEE, DEPARTMENT;
-- 결합되긴 했지만, 조인될 때 아무런 조건을 제시하지 않았기 때문에 사원 한 명에 대해서 테이블 4개의 로우와 결합되었다, 의미 없음

/*의미 있는 조인 결과가 되려면, 조인할 때 조건을 제시해야 한다. 
  조인 조건에 따라 조인의 종류가 결정된다. 
  
  - EQUI JOIN : 동일한 칼럼을 기준으로 조인
  - NON-EQUI JOIN : 동일 칼럼이 없이 다른 조건을 사용하여 조인
  - OUTER JOIN : 조인 조건에 만족하지 않는 행도 나타난다
  - SEIF JOIN : 한 테이블 내에서 조인 */


/* 03 EQUI JOIN 
  SELECT *
  FROM EMPLOYEE, DEPARTMENT
  WHERE EMPLOYEE.DNO = DEPARTMENT.DNO; 
(EMPLOYEE 테이블의 DNO 칼럼) = (DEPARTMENT 테이블의 DNO 칼럼)

  - 가장 많이 사용하는 조인 방법
  - 조인 대상이 되는 두 테이블에서 공통적으로 존재하는 칼럼의 값이 일치되는 행을 연결하여 결과 생성 */


SELECT ENAME, DNAME						-- SELECT 특정 칼럼을 추출하기 위함
FROM EMPLOYEE AS E, DEPARTMENT AS D     -- FROM 특별한 키워드 없이 테이블 2개 콤마로 연결 
WHERE E.DNO = D.DNO;					-- WHERE 절에 조인 조건을 올바르게 기술해야 의미있는 결과 


-- 3.1 EQUI JOIN 에 AND 연산하기 

SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

-- 이문세의 이름과 소속 부서 이름 출력하기 
SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO AND ENAME = '이문세';  -- WHERE 절에서 AND 연산자를 추가해서 이문세의 이름만 알기 

-- 3.2 칼럼의 모호성 해결
SELECT ENAME, DNAME, DNO			-- 두 테이블에서 동일한 이름으로 정의된 칼럼을 구분없이 사용하면 애매모호한 상태 
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT EMPLOYEE.ENAME, DEPARTMENT.DNAME, EMPLOYEE.DNO
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME, EMPLOYEE.DNO
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

-- 3.3 별칭 지정 

SELECT E.ENAME, D.DNAME, E.DNO
FROM EMPLOYEE E, DEPARTMENT D		-- FROM 절에서 테이블명 다음에 공백을 두고 별칭을 부여
WHERE E.DNO = D.DNO;				-- FROM 절에서 지정한 별칭을 SELECT 절과 WHERE 절에서 사용하고 있음


/* NON- EQUI JOIN
 조인 조건에 특정 범위 내에 있는지를 조사하기 위해서 
 WHERE 절에 조인 조건을 = 연산자 이외의 비교 연산자를 사용한다.  */ 

-- 급여 등급 테이블 출력하기 
SELECT *
FROM SALGRADE;


-- 사원의 급여가 몇 등급인지 알기 
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOWSAL AND HIGHSAL;

SELECT E.ENAME, E.SALARY, S.GRADE
FROM EMPLOYEE E, SALGRADE S 
WHERE SALARY >= LOWSAL AND SALARY <= HIGHSAL;

-- 3개의 테이블 조인하기 

SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMPLOYEE E, DEPARTMENT D, SALGRADE S
WHERE E.DNO = D.DNO 
      AND E.SALARY BETWEEN S.LOWSAL AND S.HIGHSAL;

/* SEIF JOIN
  자기 자신과 조인을 맺는 것 
  조인은 두 개 이상의 서로 다른 테이블을 서로 연결하는 것뿐만 아니라, 
  하나의 테이블 내에서 조인을 해야만 원하는 자료를 얻을 수 있다. 
  */

-- 이문세의 매니저 이름알기 : 감우성

-- EMPLOYEE 테이블에서 이름이 '이문세' 사원의 담당 매니저의 사원번호 MANAGER 가 1008 인 것을 알았다. 
SELECT *
FROM EMPLOYEE;

-- 매니저의 사원번호인 1008 (MANAGER) 로 일치하는 사원번호(ENO)를 사원 테이블(EMPLOYEE)에서 찾는다
SELECT ENO, ENAME
FROM EMPLOYEE;


/* 이문세 사원의 매니저 이름을 알기 위해서는 두개의 테이블이 조인되어야 한다. 
   매니저 역시 그 회사의 사원이기 때문에 데이터 중복 문제가 발생하므로 매니저를 위한 테이블을 따로 마련하지는 않는다.
   따라서 이문세의 담당 매니저도 사원 테이블을 참조해야함
   
   EMPLOYEE 테이블이 EMPLOYEE 테이블과 조인되어야 한다. 
   FROM 절 다음에 같은 테이블이 나란히 두번 기술할 수는 없다. 
   그러므로 자신과 같은 테이블이 하나 더 존재하는 것처럼 생각하도록 테이블 별칭 사용 
   EMPLOYEE 테이블을 MEMBER 와 MANAGER 라는 별칭으로 지정해서 두개의 테이블이 존재하는 것 처럼 사용*/


SELECT MEMBER.ENAME AS [사원이름], MANAGER.ENAME AS [직속상관이름]
FROM EMPLOYEE AS MEMBER, EMPLOYEE AS MANAGER
WHERE MEMBER.MANAGER = MANAGER.ENO;

/* 안성기 는 사장이라서 MANAGER NULL 값. 14명의 사원정보에서 13명의 사원정보만 나온다
  사원번호 ENO 가 NULL인 사원은 없기 때문에 조건에 만족하지 않아서 안성기는 SEIF JOIN 의 결과에서 배제됨 */


/* 05 ANSI JOIN 
  ANSI 조인은 SQL 조인보다 더욱 간편하게 사용 가능. 더 완벽한 포괄 조인 가능 (OUTER - JOIN) 지원 */

-- 5.1 ANSI CROSS JOIN
SELECT *
FROM EMPLOYEE, DEPARTMENT 

SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT 

-- 5.2 ANSI INNER JOIN 
SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME
FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO 
AND EMPLOYEE.ENAME = '이문세';

SELECT ENAME, DNAME
FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DNO = DEPARTMENT.DNO
WHERE EMPLOYEE.ENAME = '이문세';


-- 5.3 ANSI OUTER JOIN 

SELECT MEMBER.ENAME AS [사원이름], MANAGER.ENAME AS [직속상관이름]
FROM EMPLOYEE AS MEMBER, EMPLOYEE AS MANAGER
WHERE MEMBER.MANAGER = MANAGER.ENO;

/* 안성기 는 사장이라서 MANAGER NULL 값. 14명의 사원정보에서 13명의 사원정보만 나온다
  사원번호 ENO 가 NULL인 사원은 없기 때문에 조건에 만족하지 않아서 안성기는 SEIF JOIN 의 결과에서 배제됨 */

SELECT MEMBER.ENAME AS [사원이름], MANAGER.ENAME AS [직속상관이름]
FROM EMPLOYEE MEMBER LEFT OUTER JOIN EMPLOYEE MANAGER 
ON MEMBER.MANAGER = MANAGER.ENO;

/* 안성기의 직속상관이 없지만 사원의 정보가 출력되도록 하기 위해서 OUTER JOIN 한다. 
  LEFT JOIN 왼쪽 테이블이 기준이 되어서 그 테이블에 있는 모든 데이터를 가져온다. 
  기준으로 지정되지 않은 오른쪽 테이블에서 가져올 수 없는 열은 NULL로 처리 
  
  안성기의 직속상관이 없지만 사원의 정보가 출력되도록 하기 위해서 OUTER JOIN 했다. */

/* 06 UNION 과 UNION ALL 
  UNION : 두 쿼리의 결과를 하나의 결과 집합으로 만드는 것이다. 
  정규화된 테이블을 연결시킬 경우에는 거의 사용하지 않으나 비정규화된 테이블을 가지고 작업을 할 때는 자주 사용됨
  
  - 열 이름은 달라도 상관 없음
  - 집합의 열의 개수가 같아야 함, 열 단위로 같거나 서로 호환이 되어야 한다!
  - 집합의 열의 형식이 같아야 함
  - UNION 문 이 된 결과 집합의 열 이름은 첫번째 SELECT 절에 지정된 열 이름을 따라가므로 
    첫번째 SELECT 절에는 열 이름이 반드시 존재해야 한다. 
	
	SELECT 열이름1
	FROM 첫 번째 테이블
	UNION(ALL)
	SELECT 열이름2
	FROM 두 번째 테이블  */

-- 회원 정보를 저장하는 MEMBER 테이블
CREATE TABLE MEMBER (
	ID INT ,
	NAME NVARCHAR(20) ,
	TEL NVARCHAR(13), 
	ADDRESS NVARCHAR(50)
)

INSERT INTO MEMBER VALUES(1, '김우성', '010-6298-0394', '송파구 잠실2동')
INSERT INTO MEMBER VALUES(2, '김태희', '010-9596-2048', '강동구 명일동')
INSERT INTO MEMBER VALUES(3, '하지원', '010-0859-3948', '강동구 천호동')
INSERT INTO MEMBER VALUES(4, '유재석', '010-3045-3049', '강남구 서초동')

SELECT *
FROM MEMBER;

-- 관리자 정보를 저장하는 WORKER 테이블 생성
CREATE TABLE WORKER(
	NUMBER INT, 
	IRUM NVARCHAR(20),
	HP NVARCHAR(13), 
	LOCATION NVARCHAR(50)
)

INSERT INTO WORKER VALUES(2, '김태희', '010-9596-2048', '강동구 명일동')
INSERT INTO WORKER VALUES(3, '하지원', '010-0859-3948', '강동구 천호동')
INSERT INTO WORKER VALUES(4, '유재석', '010-3045-3049', '강남구 서초동')
INSERT INTO WORKER VALUES(5, '강호동', '010-2049-5069', '송파구 석촌동')
INSERT INTO WORKER VALUES(10, '안성기', '010-3050-3049', '강남구 압구정동')

SELECT * 
FROM MEMBER;

SELECT * 
FROM WORKER;

-- UNION 한 결과 
SELECT * 
FROM MEMBER
UNION
SELECT * 
FROM WORKER;

-- UNION ALL 한 결과 집합에 중복값도 나온다 
SELECT * 
FROM MEMBER
UNION ALL
SELECT * 
FROM WORKER;



-- 연습문제 
-- 경리부에 근무하는 사원의 이름과 입사일 출력
SELECT ENAME, HIREDATE
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO AND DEPARTMENT.DNAME = '경리부';

-- 인천에서 근무하는 사원의 이름과 급여 출력
SELECT ENAME, SALARY 
FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DNO = DEPARTMENT.DNO
WHERE LOC = '인천';
