/* CH9 데이터 조작과 트랜잭션
  01 테이블에 새로운 행을 추가하는 INSERT 문
  
  INSERT INTO table_name
  (column_name ...)
  VALUES(column_name, ...) */

-- 토목부를 DEPARTMENT 테이블에 추가 
INSERT INTO DEPARTMENT(DNO, DNAME, LOC)
VALUES(50, '토목부', '일산');
SELECT * FROM DEPARTMENT;

/* 오류 나는 법
- 칼럼명에 기술된 목록의 수보다 VALUES 다음에 나오는 괄호 안에 기술한 값의 개수가 적으면 에러
- 칼럼명에 기술된 목록의 수보다 VLAUES 다음에 나오는 괄호 안에 기술한 값의 개수보다 많으면 에러
- 칼럼명이 잘못 입력되었을 때도 에러가 발생 
- 칼럼과 입력할 값의 데이터 타입이 서로 맞지 않을 경우에도 에러가 발생  */

/* 칼럼 명을 생략한INSERT 구문 

  테이블에 로우를 추가할 때 모든 칼럼에 모두 자료를 입력하는 경우에는 굳이 칼럼 목록을 기술하지 않아도 된다.
  칼럼 목록이 생력되면 VALUES 값은 케이블 기본 순서로 따라간다. 
  */

INSERT INTO DEPARTMENT VALUES(60, '생산부', '포천', '');
SELECT * FROM DEPARTMENT;

/*NULL 값을 삽입하는 다양한 방법 
  - 암시적인 방법 : 칼럼 명 리스트에 칼럼을 생략하는 것, 다른 칼럼은 값을 입력하지만 생략한 칼럼에는 암시적으로 NULL 값이 할당
  - 명시적인 방법 : VALUES 리스트에 명시적으로 NULL 입력
*/

-- 암시적으로 NULL 값 삽입
/* 저장할 값을 명확하게 알고 있는 칼럼 멸만 명시적으로 기술한 후에 그에 매치되는 값을 VALUES 절 다음에 기술. 
  INSERT INTO 절에서 칼럼 멸과 값으 지정하는 것을 생략하면 생략된 칼럼에 대해서는 NULL 값이 입력된다. 
  */

INSERT INTO DEPARTMENT(DNO, DNAME)
VALUES(70, '총무부');
SELECT * FROM DEPARTMENT;

INSERT INTO DEPARTMENT 
VALUES(80, '회계부');
-- 컬럼명을 명시적으로 기술하지 않으면 테이블이 갖고 있는 모든 컬럼에 값을 지정해야 한다.
-- 3개의 컬럼으로 구성되어 있는데 위 예제에서는 2개만 주어서 에러 발생


-- 명시적으로 NULL 값 삽입
INSERT INTO DEPARTMENT
VALUES(80, '회계부', NULL);
SELECT * FROM DEPARTMENT;

-- 공백문자 삽입하기
INSERT INTO DEPARTMENT 
VALUES (90, '기획부', ''); -- NULL 대신 공백문자 컬럼에 추가 
SELECT * FROM DEPARTMENT; 

/* 1.4 서브 쿼리로 데이터 삽입하기
  INSERT INTO 다음에 VALUES 절을 사용하는 대신에 서브 쿼리를 사용할 수 있다. 
  기존의 테이블에 있던 여러 행을 복사해서 다른 테이블에 삽입할 수 있다. 
  이때 주의할 점은 INSERT 명령문에서 지정한 칼럼의 개수나 데이터 타입이 서브 쿼리를 수행한 결과와 동일해야한다. */

-- 서브쿼리로 데이터 삽입하는 예제

-- 서브 쿼리로 데이터를 삽입하기 위해 테이블을 생성하되 DEPARTMENT 와 구조 동일하게 생성 
SELECT * INTO DEPARTMENT2
FROM DEPARTMENT WHERE 0=1;
SELECT * FROM DEPARTMENT2;

-- 테이블 구조만 있고 내용을 갖지 않는 테이블에 서브 쿼리로 로우 입력하기 
-- 하나의 테이블에 서브 쿼리가 리턴하는 행 수만큼 즉, 다중 행이 입력된다. 

INSERT INTO DEPARTMENT2
SELECT TOP(3) * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT2;


/* 02 UPDATE 테이블의 내용을 수정
  UPDATE 문은 테이블에 지정된 데이터를 수정하기 위해서 사용
  
  UPDATE table_name
  SET column_name1 = value1, column_name2 = value2, ...
  WHERE conditions; 
   */

/* 2.1 테이블의 모든 행 변경
  UPDATE 문을 사용할 때 WHERE 절을 추가하지 않으면 테이블의 모든 행이 변경된다.
  */

-- 실습을 위한 테이블 만들기 
SELECT * INTO EMPLOYEE01 FROM EMPLOYEE;

-- EMPLOYEE01 테이블의 내용 확인 
SELECT * FROM EMPLOYEE01;

-- 모든 사원의 부서 번호를 30 번으로 수정
UPDATE EMPLOYEE01
SET DNO = 30;
 
-- 부서번호가 30번으로 수정되었음을 확인 
SELECT * FROM EMPLOYEE01;

-- 이번에는 모든 사원의 급여를 10% 인상시키는 UPDATE 문
UPDATE EMPLOYEE01
SET SALARY = SALARY *1.1; 

-- 사원의 급여가 10% 인상되었음을 확인
SELECT * FROM EMPLOYEE01;

-- 모든 사원의 입사일을 오늘로 쉉하기 
UPDATE EMPLOYEE01
SET HIREDATE = GETDATE();

-- 모든 사원의 입사일을 오늘로 수정되었음을 확인
SELECT * FROM EMPLOYEE01;

/* 2.2 테이블의 특정 행만 변경 
  UPDATE 문에 WHERE 절을 추가하면 테이블의 특정 행이 변경된다. 
  */
-- 새 테이블 만들기 
SELECT * INTO EMPLOYEE02 FROM EMPLOYEE;

-- 새 테이블 확인
SELECT * FROM EMPLOYEE02;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정한다. 
UPDATE EMPLOYEE02
SET DNO = 30    -- 바꾼 후
WHERE DNO = 10  -- 바꾸기 전
-- 부서번호가 10인 자료를 부서번호 30으로 수정

-- 부서번호 20, 30만
SELECT * FROM EMPLOYEE02;

-- 급여가 500 이상인 사원만 급여를 10% 인상한다. 
UPDATE EMPLOYEE02
SET SALARY = SALARY * 1.1 
WHERE SALARY >= 500;

-- 급여 인상 확인
SELECT * FROM EMPLOYEE02;

-- 2005 년에 입사한 사원의 입사일을 오늘로 수정
UPDATE EMPLOYEE02
SET HIREDATE = GETDATE()
WHERE HIREDATE LIKE '%2005%';

-- 입사일 변경 확인
SELECT * FROM EMPLOYEE02;


/* 2.3 테이블에서 2개 이상의 칼럼값 변경
   테이블에서 복수의 칼럼의 값을 변경하려면 기존 SET 절에 콤마를 추가하고 칼럼 = 값을 추가 기술*/

-- 실습을 위한 테이블 만들기 
DROP TABLE EMPLOYEE01;
SELECT * INTO EMPLOYEE01 FROM EMPLOYEE;
-- 확인
SELECT * FROM EMPLOYEE01;
-- 이문세 사원의 부서번호 20 번, 직급은 이사로 변경 
UPDATE EMPLOYEE01
SET DNO = 20, JOB = '이사'
WHERE ENAME = '이문세';
-- 확인
SELECT * FROM EMPLOYEE01 
WHERE ENAME = '이문세';
-- 이문세 사원의 입사일자는 오늘, 급여는 700, 커미션은 100 으로 수정
UPDATE EMPLOYEE01
SET HIREDATE = GETDATE(), SALARY = 700, COMMISSION = 100
WHERE ENAME = '이문세';
-- 확인
SELECT * FROM EMPLOYEE01 
WHERE ENAME = '이문세';

/* 2.4 서브 쿼리를 이용한 데이터 변경 
  UPDATE 문의 SET 절에서 서브 쿼리를 기술하면 서브 쿼리를 수행한 결과로 내용이 변경된다. 
  이 방법으로 다른 테이블에 저장된 데이터로 해당 컬럼 값을 변경할 수 있다.*/

-- 테이블 생성 , 확인
SELECT * INTO DEPARTMENT01 FROM DEPARTMENT;
SELECT * FROM DEPARTMENT01;

-- 20 번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브 쿼리문. 확인
UPDATE DEPARTMENT01
SET LOC = (SELECT LOC
			FROM DEPARTMENT01
			WHERE DNO = 40)
WHERE DNO = 20;
SELECT * FROM DEPARTMENT01;


/* DELETE 문 테이블에 불필요한 행을 삭제
  DELETE FROM table_name 
  WHERE conditions 
  
  DELETE 문은 테이블의 기존 행을 삭제하며 특정한 로우를 삭제하기 위해서 WHERE절을 이용하여 조건 지정
  DELETE 절에 WHERE 을 사용하지 않은 경우 테이블에 있는 모든 행이 삭제됨
  
  DROP 과 DELETE 삭제  */

-- 삭제하기
DELETE FROM DEPARTMENT01;
SELECT * FROM DEPARTMENT01;

-- 테이블에 내용 추가 
INSERT INTO DEPARTMENT01 
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT01;

-- 30번 부서를 삭제하고 부서 테이블 살펴보기 
DELETE FROM DEPARTMENT01
WHERE DNO = 30;
SELECT * FROM DEPARTMENT01;

/* 3.1 서브 쿼리를 이용한 데이터 삭제
  사원테이블에서 부서명이 영업부인 사원을 모두 삭제하기
  사원테이블에는 부서명이 기록되어 있지 않음. 부서명은 부서 테이블에 저장되어 있음
  부서 테이블에서 영업부의 부서번호를 알아내야 한다.  -> 사원테이블에 적용하기 위해서 서브ㅌ쿼리 사용 
*/

-- 사원테이블에서 영업부인 사원 모두 삭제하기
DELETE FROM EMPLOYEE01;
INSERT INTO EMPLOYEE01 SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE01;

-- 서브쿼리에서 부서명이 영업부인 사원을 찾아서 사원테이블에서 영업부부서소속 사원 삭제
DELETE FROM EMPLOYEE01
WHERE DNO = (SELECT DNO
			 FROM DEPARTMENT
			 WHERE DNAME = '영업부');
SELECT *
FROM EMPLOYEE01;


DROP TABLE EMPLOYEE03;

-- 연습문제 
CREATE TABLE EMPLOYEE03(
	ENO INT, 
	ENAME VARCHAR(20), 
	JOB VARCHAR(20) NULL, 
	SALARY INT

);


INSERT INTO EMPLOYEE03 VALUES(1000, 'APPLE', 'POLICE', 100)
INSERT INTO EMPLOYEE03 VALUES(1010, 'BANANA', 'NURSE', 150)
INSERT INTO EMPLOYEE03 VALUES(1020, 'ORANGE', 'DOCTOR', 250)
INSERT INTO EMPLOYEE03 VALUES(1030, 'VERY',NULL , 250)
INSERT INTO EMPLOYEE03 VALUES(1040, 'CAT', '',200)

SELECT * FROM EMPLOYEE03;

SELECT * FROM EMPLOYEE WHERE DNO =10;


-- 서브 쿼리로 데이터 입력
INSERT INTO EMPLOYEE03
SELECT ENO, ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE DNO = 10

SELECT * FROM EMPLOYEE03;

-- 데이터 수정
UPDATE EMPLOYEE03
SET SALARY = SALARY - 50
WHERE ENAME IN (SELECT ENAME
			  FROM EMPLOYEE03
			  WHERE SALARY >= 300)
SELECT * FROM EMPLOYEE03;

UPDATE EMPLOYEE03
SET SALARY = SALARY - 50
WHERE SALARY >= 300;


-- 직급이 정해지지 않은 사원 삭제 
DELETE FROM EMPLOYEE03
WHERE JOB IS NULL OR JOB = '';
SELECT * FROM EMPLOYEE03;
