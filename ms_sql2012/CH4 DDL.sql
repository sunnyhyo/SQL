/* CH4 DDL 테이블 생성하고 데이터 추가하기 */

-- 4.1 CREATE TABLE 테이블 생성 
-- 4.2 ALTER TABLE 테이블 구조 변경 
-- 4.3 TRUNCATE 테이블의 모든 로우 제거 
-- 4.4 DROP TABLE 테이블 구조를 삭제

-- 미션 미리해보기 
CREATE TABLE departemt(
	DNO INT ,
	DNAME VARCHAR(20),
	LOC VARCHAR(20)
	);
ALTER TABLE department
ADD DMGR VARCHAR(10);


-- 4.1 CREATE TABLE 테이블 생성 
CREATE TABLE memberTest(
	ID INT IDENTITY(1,1),  -- IDENTITY 각 회원을 유일하게 구분하기 위한 설정
	NAME VARCHAR(20)
)

-- ID 칼럼에 대한 구체적인 값 입력하지 않음
INSERT memberTest VALUES('김나리')
INSERT memberTest VALUES('이백합')
INSERT memberTest VALUES('김장미')

-- 확인 ID 칼럼에는 1, 2, 3 연속되는 숫자 입력되었음
SELECT *
FROM memberTest

-- 상품 테이블 생성해보기
CREATE TABLE product(
		PCODE VARCHAR(20) CONSTRAINT PK_pcode PRIMARY KEY, 
		PNAME VARCHAR(100) DEFAULT '0',
		PRICE VARCHAR(10) DEFAULT '0'
);

SELECT *
FROM PRODUCT;



-- 4.2 ALTER TABLE 데이터 구조 변경 
/* 새로운 칼럼 추가하기
    ALTER table_name
    ADD colum_name, data_type, expr */

ALTER TABLE PRODUCT
ADD PDATE DATETIME NULL

SELECT *
FROM PRODUCT;

/* 기존 칼럼 속성 변경하기
    ALTER table_name
    ALTER COLUMN column_name, data_type, expr */ 
ALTER TABLE PRODUCT
ALTER COLUMN PRICE VARCHAR(20)

/* 기존 칼럼 삭제하기
    ALTER table_name
    DROP COLUMN column_name; */

ALTER TABLE PRODUCT 
DROP COLUMN PDATE;

SELECT *
FROM PRODUCT;

-- 4.3 TRUNCATE 테이블의 모든 로우 제거
/* 테이블의 모든 로우 제거
    TRUNCATE TABLE table_name
	
	DROP TABLE : 테이블 존재 자체를 지우는 것, 구조가 남아있지 않음
	TRUNCATE TABLE : 테이블은 존재하면서 데이터 내용만 지우기, 구조 남아있음  */

SELECT *
FROM memberTest;

TRUNCATE TABLE memberTest

SELECT *
FROM memberTest;

-- 4.4 DROP TABLE 테이블 구조를 삭제
/* 테이블 구조 삭제 
	DROP TABLE table_name ; 
	
	테이블 삭제와 무결성 조건
	삭제하고자 하는 테이블의 기본키나 고유키를 다른 테이블에서 참조해서 사용하는 경우에는 
	해당 테이블을 삭제할 수 없음*/

DROP TABLE memberTest

