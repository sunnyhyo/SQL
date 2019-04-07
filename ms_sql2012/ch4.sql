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
		PCODE VARCHAR(20) PRIMARY KEY, 
		PNAME VARCHAR(100),
		PRICE VARCHAR(10)
);

SELECT *
FROM PRODUCT;