# SQL 공부하기

#### 목차 
1. [DDL (데이터 정의어)](#1.-DDL-(데이터-정의어))
   - CREATE TABLE 
   - ALTER TABLE
   - RENAME TABLE 
   - DROP TABLE
   - TUNCATE TABLE
2. [DML(데이터 조작어)](#2.-DML-(데이터-조작어))
   - INSERT 
   - UPDATE
   - DELETE
   - SELECT
   - 산술연산자, 합성연산자
3. WHERE
4. FUNCTION 
5. GROUP BY, HAVING 
6. ORDER BY 
7. JOIN
8. SUB QUERY





-----------------------
## 1. DDL (데이터 정의어)
- CREATE TABLE 
- ALTER TABLE
- RENAME TABLE 
- DROP TABLE
- TUNCATE TABLE
- * 제약조건



### 1.1 CREATE TABLE 
테이블 생성. 테이블에 입력될 데이터 정의하고, 정의한 데이터를 어떠한 데이터 유형으로 선언할 것인지 결정한다. 
```
-- 테이블 생성
CREATE TABLE table_name (
	col_name1	DATATYPE	[DEFUALT 형식],
	col_name2	DATATYPE 	[DEFUALT 형식],
	col_name3	DATATYPE	[DEFUALT 형식],

	[CONSTRAINT constraint_name] CONSTRAINT_TYPE(COLNAME1) [],
	[CONSTRAINT constraint_name] CONSTRAINT_TYPE(COLNAME2)
)
```

### 2. ALTER TABLE
테이블 변경. 칼럼 추가/ 삭제, 제약조건 추가/삭제.
```
-- 기존 테이블에 필요한 칼럼 추가
ALTER TABLE table_name
ADD column_name datatype  [DEFUALT 형식];

-- 기존 테이블에 필요 없는 칼럼 삭제
ALTER TABLE table_name
DROP COLUMN col_name;
-- MODIFY COLUMN
-- RENAME COLUMN
```


```
-- 제약조건 추가 
ALTER TABLE table_name 
ADD [CONSTRAINT constraint_name] CONSTRAINT_TYPE(col_name)

-- 제약조건 삭제
ALTER TABLE table_name
DROP [CONSTRAINT constraint_name] CONSTRAINT_TYPE(col_name)
```

참조 제약조선을 추가하면 참조 무결성 옵션에 따라서 참조되는 테이블을 삭제 하지 못하게 제약할 수도 있다. 즉, FK 를 설정함으로써 실수에 의한 테이블 삭제나 필요한 데이터의 의도하지 않은 삭제 등 방지 가능하다.


### 1.3 RENAME TABLE 
### 1.4 DROP TABLE 
테이블 삭제. 테이블의 모든 데이터 및 구조 삭제. 
```
DROP TABLE table_name [CASCADE CONSTRAINT];
```
테이블을 삭제하기 전에 참조하는 FOREIGN KEY 제약 조건 또는 참조하는 테이블(자식테이블)을 먼저 삭제해야 한다. 
- DELETE 명령어와 구분하기

### 1.5 TUNCATE TABLE



-----------------------------
#### * 제약조건 
- PRIMARY KEY 
- UNIQUE
- NOT NULL
- CHECK 
- FOREIGN KEY 

#### * FOREIGN KEY 제한
```
-- CREATE TABLE table_name
-- ALTER TABL table_name ADD / DROP 
[CONSTRAINT constraint_name] FOREIGN KEY[id] (index_col_name) 
	REFERENCES table_name(index_col_name)
	[ON DELETE {RISTRICT | CASCADE | SET NULL | NO ACTION}]
	[ON UPDATE {RISTRICT | CASCADE | SET NULL | NO ACTION}]
```

-------------------------
## 2. DML (데이터 조작어)
- INSERT 
- UPDATE
- DELETE
- SELECT
- 산술연산자, 합성연산자

### 2.1 INSERT 
테이블에 데이터 입력. 두가지 유형있음. 한번에 한 건만 입력.
```
-- 테이블 칼럼 정의
INSERT INTO table_name(col_name_list)
VALUES(value_list)

-- 모든 칼럼에 데이터 입력
INSERT INTO table_name
VALUES(전체 column 에 넣을 value_list)
```
해당 칼럼명과 입력되어야 하는 값을 서로 1:1로 매핑해서 입력해야 한다. 
- 테이블 칼럼을 정의하는 경우
칼럼의 순서는 테이블 칼럼의 순서와 매치할 필요 없음. 정의하지 않은 칼럼은 DEFUALT 로 NULL 입력된다. 단, PK 나 NOT NULL 로 지정된 칼럼은 NULL 이 허용되지 않음. 
- 모든 칼럼에 데이터를 입력하는 경우
칼럼 리스트를 입력하지 않아도 됨. 칼럼의 순서대로 빠짐없이 데이터가 입력되어야함. NULL 적기. 

### 2.2 UPDATE 
정보 수정. 
```
UPDATE table_name
SET 수정되어야할 칼럼명 = 수정되기를 원하는 값
```

### 2.3 DELETE
데이터 삭제 
```
DELETE FROM table_name
[WHERE conditions];
```
### 2.4 SELECT
데이터 조회. 
```
SELECT [ALL/DISTINCT] 칼럼명 [AS 별칭],...
FROM 해달 칼럼들이 있는 테이블 명
WHERE 조건식;
```
-------------------------------------
## 3. WHERE (조건절)
- 칼럼명 (조건식 왼쪽)
- 비교 연산자
- 문자, 숫자, 표현식 (조건식 오른쪽)
- 비교 칼럼명 (JOIN 사용시)

### 3.1 연산자 종류
 - 비교 연산자
 - SQL 연산자
 - 논리 연산자

 

| 구분             | 연산자                                                       | 연산자 의미                                      |
| ---------------- | ------------------------------------------------------------ | ------------------------------------------------ |
| 비교 연산자      | = , >, >=, <, <=                                             |                                                  |
| SQL 연산자       | BETWEEN A AND B<br />IN(list)<br />LIKE '비교문자열' (%, _ 사용)<br />IS NULL |                                                  |
| 논리 연산자      | AND, OR, NOT                                                 |                                                  |
| 부정 비교 연산자 | != , ^=, <><br />NOT 칼럼명 = <br />NOT 칼럼명 >             | 같지않다<br />~와 같지 않다<br />~보다 크지 않다 |
| 부정 SQL 연산자  | NOT BETWEEN A AND B<br />NOT IN (list)<br />IS NOT NULL      |                                                  |

### 3.2 NULL 관련 함수
NVL/ISNULL 