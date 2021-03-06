-- 테이블 생성
CREATE TABLE DEPARTMENTPHS(
	DEPTNO INT,
	DEPTNAME VARCHAR(10),
	FLOOR INT,

	PRIMARY KEY(DEPTNO)
);
-- 데이터 삽입
INSERT DEPARTMENTPHS VALUES(1, '영업', 8)
INSERT DEPARTMENTPHS VALUES(2, '기획', 10)
INSERT DEPARTMENTPHS VALUES(3, '개발', 9)
INSERT DEPARTMENTPHS VALUES(4, '총무', 7)

CREATE TABLE EMPLOYEEPHS(
	EMPNO INT,
	EMPNAME VARCHAR(10), 
	TITLE VARCHAR(10),
	MANAGER INT, 
	SALARY INT, 
	HIREDATE DATETIME,
	DNO INT,

	PRIMARY KEY(EMPNO),
	FOREIGN KEY(DNO) REFERENCES DEPARTMENTPHS(DEPTNO),
	FOREIGN KEY(MANAGER) REFERENCES EMPLOYEEPHS(EMPNO)
);

INSERT EMPLOYEEPHS VALUES(2106, '김창섭', '대리', 3228, 2500000, '2000-03-05', 2)
INSERT EMPLOYEEPHS VALUES(3426, '박영권', '과장', 1234, 3000000, '1998-07-20', 1)
INSERT EMPLOYEEPHS VALUES(3011, '이수민', '부장', 4377, 4300000, '1996-04-30', 3)
INSERT EMPLOYEEPHS VALUES(1003, '조민희', '대리', 2468, 2600000, '2001-02-19', 2)
INSERT EMPLOYEEPHS VALUES(3427, '최종철', '사원', 1003, 1500000, '2005-10-28', 3)
INSERT EMPLOYEEPHS VALUES(1365, '김상원', '사원', 3426, 1600000, '2004-02-26', 1)  -- 자료 잘못 입력
INSERT EMPLOYEEPHS VALUES(4377, '이성래', '사장', NULL, 5000000, '1996-01-05', 2)
INSERT EMPLOYEEPHS VALUES(1234, '장건호', '부장', 4377, 4200000, '1996-11-23', 1)
INSERT EMPLOYEEPHS VALUES(1099, '이재원', '사원', 3426, 1800000, '2003-12-21', 1)
INSERT EMPLOYEEPHS VALUES(2468, '조범수', '과장', 3011, 3500000, '1998-12-17', 3)
INSERT EMPLOYEEPHS VALUES(2544, '오준석', '대리', 2468, 2700000, '2001-08-25', 3)
INSERT EMPLOYEEPHS VALUES(3228, '김주훈', '부장', 4377, 4000000, '1997-03-06', 2)


SELECT * FROM EMPLOYEEPHS
UPDATE EMPLOYEEPHS
SET SALARY = 1600000
WHERE EMPNAME = '김상원'


-- 3)
SELECT DISTINCT TITLE
FROM EMPLOYEEPHS
WHERE HIREDATE BETWEEN '2000-01-01' AND '2003-12-31';

-- 4) 
SELECT DEPTNAME, TITLE, AVG(SALARY*1.5) 평균급여
FROM EMPLOYEEPHS E, DEPARTMENTPHS D
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME, TITLE
ORDER BY DEPTNAME, AVG(SALARY*1.5)

-- 5)
SELECT DNO, MIN(SALARY) AS 최저급여
FROM EMPLOYEEPHS
GROUP BY DNO
HAVING AVG(SALARY) >= ALL (SELECT AVG(SALARY)
							FROM EMPLOYEEPHS
							GROUP BY DNO);

-- 6) 
SELECT E.EMPNAME, E.TITLE, M.EMPNAME AS 매니저이름
FROM EMPLOYEEPHS AS E, EMPLOYEEPHS AS M 
WHERE E.MANAGER = M.EMPNO
	AND E.DNO = (	SELECT DNO 
					FROM EMPLOYEEPHS
					WHERE EMPNAME = '김상원')
	AND M.EMPNO = (	SELECT MANAGER
					FROM EMPLOYEEPHS
					WHERE EMPNAME = '김상원');

SELECT E.EMPNAME, E.TITLE, E1.EMPNAME AS [매니저 이름]
FROM EMPLOYEEPHS AS E, EMPLOYEEPHS AS E1
WHERE E.MANAGER = E1.EMPNO
	AND EXISTS (SELECT * 
				FROM EMPLOYEEPHS AS E2
				WHERE E2.EMPNAME= '김상원' 
					AND E.MANAGER = E2.MANAGER 
					AND E.DNO = E2.DNO)
-- 7) 
SELECT DEPTNO, DEPTNAME, FLOOR
FROM DEPARTMENTPHS
WHERE DEPTNO NOT IN (SELECT DNO 
					FROM EMPLOYEEPHS AS E, DEPARTMENTPHS AS D
					WHERE E.DNO = D.DEPTNO
					GROUP BY DNO );

SELECT DEPTNO, DEPTNAME, FLOOR 
FROM DEPARTMENTPHS AS D
WHERE NOT EXISTS (SELECT *
				  FROM EMPLOYEEPHS AS E 
				  WHERE E.DNO = D.DEPTNO)

-- 8) 
SELECT DEPTNAME, COUNT(EMPNO) AS 부서인원, AVG(SALARY) AS 평균급여
FROM EMPLOYEEPHS AS E, DEPARTMENTPHS AS D 
WHERE E.DNO = D.DEPTNO
GROUP BY DEPTNAME
HAVING AVG(SALARY) BETWEEN 3000000 AND 5000000


-- 9)
SELECT  E.EMPNAME, E.TITLE, M.EMPNAME, D.DEPTNAME, E.SALARY
FROM EMPLOYEEPHS AS E, 
	DEPARTMENTPHS AS D,
	EMPLOYEEPHS AS M,
	(SELECT TITLE, AVG(SALARY) AS 평균급여 
	FROM EMPLOYEEPHS
	GROUP BY TITLE) AS S
WHERE E.TITLE = S.TITLE 
	AND E.DNO = D.DEPTNO
	AND E.MANAGER = M.EMPNO
	AND E.SALARY > S.평균급여
ORDER BY SALARY DESC






-- 10)
ALTER TABLE EMPLOYEEPHS
	ADD FOREIGN KEY(DNO) REFERENCES DEPARTMENTPHS(DEPTNO)
	ON UPDATE CASCADE

SELECT * FROM DEPARTMENTPHS;

UPDATE DEPARTMENTPHS
SET DEPTNO = 5
WHERE DEPTNO = 1

SELECT * FROM EMPLOYEEPHS;



-- 연습
SELECT  *
FROM EMPLOYEEPHS AS E, 
	DEPARTMENTPHS AS D,
	EMPLOYEEPHS AS M,
	(SELECT TITLE, AVG(SALARY) AS 평균급여 
	FROM EMPLOYEEPHS
	GROUP BY TITLE) AS S
WHERE E.DNO = D.DEPTNO
	AND E.MANAGER = M.EMPNO
	AND E.TITLE = S.TITLE


