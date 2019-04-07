use MagicCorp
GO
create table A(
  no int identity primary key, -- 자동증가
  name varchar(10)
)
GO
create table B(
  no int identity primary key, -- 자동증가
  name varchar(10)
)
GO
--Insert 트리거 생성
create trigger AB_Insert
on A      
for insert 
as
-- inserted는 A 테이블에서 Insert된 임시 테이블
select 'Insert Trigger 발생', * from inserted   
-- A에 데이터가 Insert 시 B에 같은 데이터를 넣는다.  
insert into B(name) select name from inserted
GO

insert into A(name) values('홍길동')
insert into A(name) values('이길동')
insert into A(name) values('삼길동')

select * from A
select * from B

create trigger AB_Delete 
on A
for delete 
as
-- deleted는 A 테이블에서 delete 된 임시 테이블
select 'Delete Trigger 발생 ', * from deleted  
-- A에 데이터가 Delete 시 B에 같은 데이터를 삭제한다.
delete B from deleted where B.name = deleted.name

delete A where name='홍길동'

create trigger AB_Update
on A
for update
as
select 'Deleted=>', * from deleted -- old data
select 'Inserted=>', * from inserted -- new data
update B set B.name = inserted.name
from inserted, deleted
where B.name = deleted.name

update A set name='이길당' where no=2


create table TRGTest(
   no int identity primary key, -- 자동증가
)



CREATE TRIGGER DDL_trg
ON DATABASE
AFTER DROP_TABLE
AS
PRINT(' 테이블 삭제였습니다.')
ROLLBACK TRANSACTION
GO



DROP TABLE TRGTest
GO
SELECT * FROM TRGTest
GO


ALTER TRIGGER DDL_trg
ON DATABASE
AFTER CREATE_TABLE
AS
PRINT('테이블을 생성하였습니다.')
ROLLBACK TRANSACTION;
GO

CREATE TABLE TRGTest2(
  no int identity primary key, -- 자동증가
  name varchar(10)
)

INSERT INTO TRGTest2 VALUES ('홍길동')



DROP TRIGGER  DDL_trg
ON DATABASE


CREATE TABLE TRGTest2(
  no int identity primary key, -- 자동증가
  name varchar(10)
)

INSERT INTO TRGTest2 VALUES ('홍길동')

SELECT * FROM TRGTest2

EXEC sp_configure 'nested trigger', 0

EXEC sp_configure 'nested trigger', 1

EXEC sp_dboption 'database', 'recursive trigger', TRUE 

EXEC sp_configure 'nested trigger' 
GO



EXEC sp_dboption MagicCorp, 'recursive trigger' 
GO

create table orderTbl  (
  order_no int identity  primary key,   -- 주문 일련 번호 자동증가 
  user_id varchar(30),                 -- 주문자 아이디
  product_name varchar(30),          -- 상품명 
  order_amount int                    -- 상품 수량
)
GO

create table productTbl  (
  product_name varchar(30),          -- 상품명 
  amount int                         -- 남은 수량
)
GO
INSERT INTO productTbl VALUES ('컴퓨터', 50)
INSERT INTO productTbl VALUES ('핸드폰', 300)
INSERT INTO productTbl VALUES ('PMP', 120)
INSERT INTO productTbl VALUES ('MP3 PLAYER', 200)
INSERT INTO productTbl VALUES ('디지털 카메라', 150)
INSERT INTO productTbl VALUES ('노트북', 45)
INSERT INTO productTbl VALUES ('스쿠터', 30)

create table deliverTbl(
  deliver_no int identity  primary key,  -- 주문 일련 번호 자동증가 
  product_name varchar(30),          -- 배송할 상품명 
  amount int                         -- 배송할 물건 개수
)
GO

 CREATE TRIGGER Order_trg
 ON orderTbl
 AFTER INSERT
 AS
    PRINT('Order_trg 트리거가 작동 되었네요.')
    DECLARE @A varchar(20)
    DECLARE @B int
    SELECT @A= product_name FROM inserted
    SELECT @B= order_amount FROM inserted
    UPDATE productTbl SET amount=amount-@B
    WHERE product_name=@A;
 GO

 CREATE TRIGGER Deliv_trg
 ON productTbl
 AFTER UPDATE
 AS
    PRINT('Deliv_trg 트리거가 작동하고 있습니다.')
    DECLARE @C varchar(20)
    DECLARE @D int
    SELECT @C= product_name FROM inserted
    SELECT @D= D.amount - I.amount
    FROM inserted AS I , deleted AS D
    INSERT INTO deliverTbl (product_name, amount) VALUES (@C, @D)
 GO

INSERT INTO orderTbl VALUES('홍길동' , '핸드폰' , 3 )
INSERT INTO orderTbl VALUES('이길동' , 'PMP' , 5 )
GO

SELECT * FROM orderTbl
SELECT * FROM productTbl
SELECT * FROM deliverTbl
GO


EXEC sp_rename 'dbo.deliverTbl.amount' , 'NUM', 'COLUMN'
GO

INSERT INTO orderTbl VALUES('삼길동' , '노트북' , 10 )
GO

SELECT * FROM orderTbl
SELECT * FROM productTbl
SELECT * FROM deliverTbl
GO

create table RecuA(
  no int identity primary key, -- 자동증가
  name varchar(50)
)
GO
create table RecuB(
  no int identity primary key, -- 자동증가
  name varchar(50)
)
GO
create table RecuC(
  no int identity primary key, -- 자동증가
  name varchar(50)
)
GO

CREATE TRIGGER RECUR_TrgA
 ON RecuA
 AFTER INSERT
 AS
    IF ( (SELECT trigger_nestlevel() ) >=31 )
    RETURN
    DECLARE @no int
    SELECT @no = trigger_nestlevel()
    PRINT ' 트리거 레벨=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuB VALUES ('간접 재귀 트리거')
 GO

 CREATE TRIGGER RECUR_TrgB
 ON RecuB
 AFTER INSERT
 AS
    IF ( (SELECT trigger_nestlevel() ) >=31 )
    RETURN
    DECLARE @no int 
    SELECT @no = trigger_nestlevel()
    PRINT ' 트리거 레벨=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuA VALUES ('간접 재귀 트리거')
 GO

 INSERT INTO RecuA VALUES('처음 입력한 값')

SELECT  * FROM RecuA
GO

SELECT  * FROM RecuB
GO

EXEC sp_dboption 'database', 'recursive trigger', TRUE 
GO

CREATE TRIGGER RECUR_TrgC
 ON RecuB
 AFTER INSERT
 AS
    IF ( (SELECT trigger_nestlevel() ) >=31 )
    RETURN
    DECLARE @no int 
    SELECT @no = trigger_nestlevel()
    PRINT ' 트리거 레벨=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuC VALUES ('직접 재귀 트리거')
 GO

INSERT INTO RecuC VALUES('처음 입력한 값')

SELECT  * FROM RecuC
GO

CREATE TABLE 상품(
  상품코드 CHAR(6) PRIMARY KEY,
  상품명 VARCHAR(12) NOT NULL,
  제조사 VARCHAR(12),
  소비자가격 INT,
  재고수량  INT DEFAULT 0
)

CREATE TABLE 입고(
  입고번호 INT IDENTITY PRIMARY KEY,
  상품코드 CHAR(6) REFERENCES 상품(상품코드),
  입고일자 DATETIME DEFAULT GETDATE(),
  입고수량 INT,
  입고단가 INT,
  입고금액 INT
)

INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00001','세탁기', 'LG', 500)

INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00002','컴퓨터', 'LG', 700)

INSERT INTO 상품(상품코드, 상품명, 제조사, 소비자가격)
VALUES('A00003','냉장고', '삼성', 600)

SELECT * FROM 상품

-- 입고 트리거
CREATE TRIGGER TRG_test
ON 입고
FOR INSERT 
AS
   DECLARE @A INT
   DECLARE @B CHAR(6)
   SELECT @A= 입고수량 FROM inserted
   SELECT @B= 상품코드 FROM inserted
   UPDATE 상품
   SET 재고수량 = 재고수량 + @A
   WHERE 상품코드 = @B

INSERT INTO 입고(상품코드, 입고수량, 입고단가, 입고금액) 
VALUES('A00001', 5, 320, 1600)


SELECT * FROM 입고
SELECT * FROM 상품

INSERT INTO 입고(상품코드, 입고수량, 입고단가, 입고금액)  
VALUES('A00002', 10, 680, 6800)

SELECT * FROM 입고
SELECT * FROM 상품


INSERT INTO 입고(상품코드, 입고수량, 입고단가, 입고금액) 
VALUES('A00003', 3, 220, 660)

INSERT INTO 입고(상품코드, 입고수량, 입고단가, 입고금액) 
VALUES('A00003', 5, 220, 1100)

SELECT * FROM 입고
SELECT * FROM 상품