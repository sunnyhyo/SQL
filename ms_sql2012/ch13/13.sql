use MagicCorp
GO
create table A(
  no int identity primary key, -- �ڵ�����
  name varchar(10)
)
GO
create table B(
  no int identity primary key, -- �ڵ�����
  name varchar(10)
)
GO
--Insert Ʈ���� ����
create trigger AB_Insert
on A      
for insert 
as
-- inserted�� A ���̺��� Insert�� �ӽ� ���̺�
select 'Insert Trigger �߻�', * from inserted   
-- A�� �����Ͱ� Insert �� B�� ���� �����͸� �ִ´�.  
insert into B(name) select name from inserted
GO

insert into A(name) values('ȫ�浿')
insert into A(name) values('�̱浿')
insert into A(name) values('��浿')

select * from A
select * from B

create trigger AB_Delete 
on A
for delete 
as
-- deleted�� A ���̺��� delete �� �ӽ� ���̺�
select 'Delete Trigger �߻� ', * from deleted  
-- A�� �����Ͱ� Delete �� B�� ���� �����͸� �����Ѵ�.
delete B from deleted where B.name = deleted.name

delete A where name='ȫ�浿'

create trigger AB_Update
on A
for update
as
select 'Deleted=>', * from deleted -- old data
select 'Inserted=>', * from inserted -- new data
update B set B.name = inserted.name
from inserted, deleted
where B.name = deleted.name

update A set name='�̱��' where no=2


create table TRGTest(
   no int identity primary key, -- �ڵ�����
)



CREATE TRIGGER DDL_trg
ON DATABASE
AFTER DROP_TABLE
AS
PRINT(' ���̺� ���������ϴ�.')
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
PRINT('���̺��� �����Ͽ����ϴ�.')
ROLLBACK TRANSACTION;
GO

CREATE TABLE TRGTest2(
  no int identity primary key, -- �ڵ�����
  name varchar(10)
)

INSERT INTO TRGTest2 VALUES ('ȫ�浿')



DROP TRIGGER  DDL_trg
ON DATABASE


CREATE TABLE TRGTest2(
  no int identity primary key, -- �ڵ�����
  name varchar(10)
)

INSERT INTO TRGTest2 VALUES ('ȫ�浿')

SELECT * FROM TRGTest2

EXEC sp_configure 'nested trigger', 0

EXEC sp_configure 'nested trigger', 1

EXEC sp_dboption 'database', 'recursive trigger', TRUE 

EXEC sp_configure 'nested trigger' 
GO



EXEC sp_dboption MagicCorp, 'recursive trigger' 
GO

create table orderTbl  (
  order_no int identity  primary key,   -- �ֹ� �Ϸ� ��ȣ �ڵ����� 
  user_id varchar(30),                 -- �ֹ��� ���̵�
  product_name varchar(30),          -- ��ǰ�� 
  order_amount int                    -- ��ǰ ����
)
GO

create table productTbl  (
  product_name varchar(30),          -- ��ǰ�� 
  amount int                         -- ���� ����
)
GO
INSERT INTO productTbl VALUES ('��ǻ��', 50)
INSERT INTO productTbl VALUES ('�ڵ���', 300)
INSERT INTO productTbl VALUES ('PMP', 120)
INSERT INTO productTbl VALUES ('MP3 PLAYER', 200)
INSERT INTO productTbl VALUES ('������ ī�޶�', 150)
INSERT INTO productTbl VALUES ('��Ʈ��', 45)
INSERT INTO productTbl VALUES ('������', 30)

create table deliverTbl(
  deliver_no int identity  primary key,  -- �ֹ� �Ϸ� ��ȣ �ڵ����� 
  product_name varchar(30),          -- ����� ��ǰ�� 
  amount int                         -- ����� ���� ����
)
GO

 CREATE TRIGGER Order_trg
 ON orderTbl
 AFTER INSERT
 AS
    PRINT('Order_trg Ʈ���Ű� �۵� �Ǿ��׿�.')
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
    PRINT('Deliv_trg Ʈ���Ű� �۵��ϰ� �ֽ��ϴ�.')
    DECLARE @C varchar(20)
    DECLARE @D int
    SELECT @C= product_name FROM inserted
    SELECT @D= D.amount - I.amount
    FROM inserted AS I , deleted AS D
    INSERT INTO deliverTbl (product_name, amount) VALUES (@C, @D)
 GO

INSERT INTO orderTbl VALUES('ȫ�浿' , '�ڵ���' , 3 )
INSERT INTO orderTbl VALUES('�̱浿' , 'PMP' , 5 )
GO

SELECT * FROM orderTbl
SELECT * FROM productTbl
SELECT * FROM deliverTbl
GO


EXEC sp_rename 'dbo.deliverTbl.amount' , 'NUM', 'COLUMN'
GO

INSERT INTO orderTbl VALUES('��浿' , '��Ʈ��' , 10 )
GO

SELECT * FROM orderTbl
SELECT * FROM productTbl
SELECT * FROM deliverTbl
GO

create table RecuA(
  no int identity primary key, -- �ڵ�����
  name varchar(50)
)
GO
create table RecuB(
  no int identity primary key, -- �ڵ�����
  name varchar(50)
)
GO
create table RecuC(
  no int identity primary key, -- �ڵ�����
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
    PRINT ' Ʈ���� ����=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuB VALUES ('���� ��� Ʈ����')
 GO

 CREATE TRIGGER RECUR_TrgB
 ON RecuB
 AFTER INSERT
 AS
    IF ( (SELECT trigger_nestlevel() ) >=31 )
    RETURN
    DECLARE @no int 
    SELECT @no = trigger_nestlevel()
    PRINT ' Ʈ���� ����=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuA VALUES ('���� ��� Ʈ����')
 GO

 INSERT INTO RecuA VALUES('ó�� �Է��� ��')

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
    PRINT ' Ʈ���� ����=> ' + CAST(@no AS CHAR(5)) 
    INSERT INTO RecuC VALUES ('���� ��� Ʈ����')
 GO

INSERT INTO RecuC VALUES('ó�� �Է��� ��')

SELECT  * FROM RecuC
GO

CREATE TABLE ��ǰ(
  ��ǰ�ڵ� CHAR(6) PRIMARY KEY,
  ��ǰ�� VARCHAR(12) NOT NULL,
  ������ VARCHAR(12),
  �Һ��ڰ��� INT,
  ������  INT DEFAULT 0
)

CREATE TABLE �԰�(
  �԰��ȣ INT IDENTITY PRIMARY KEY,
  ��ǰ�ڵ� CHAR(6) REFERENCES ��ǰ(��ǰ�ڵ�),
  �԰����� DATETIME DEFAULT GETDATE(),
  �԰���� INT,
  �԰�ܰ� INT,
  �԰�ݾ� INT
)

INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00001','��Ź��', 'LG', 500)

INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00002','��ǻ��', 'LG', 700)

INSERT INTO ��ǰ(��ǰ�ڵ�, ��ǰ��, ������, �Һ��ڰ���)
VALUES('A00003','�����', '�Ｚ', 600)

SELECT * FROM ��ǰ

-- �԰� Ʈ����
CREATE TRIGGER TRG_test
ON �԰�
FOR INSERT 
AS
   DECLARE @A INT
   DECLARE @B CHAR(6)
   SELECT @A= �԰���� FROM inserted
   SELECT @B= ��ǰ�ڵ� FROM inserted
   UPDATE ��ǰ
   SET ������ = ������ + @A
   WHERE ��ǰ�ڵ� = @B

INSERT INTO �԰�(��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES('A00001', 5, 320, 1600)


SELECT * FROM �԰�
SELECT * FROM ��ǰ

INSERT INTO �԰�(��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�)  
VALUES('A00002', 10, 680, 6800)

SELECT * FROM �԰�
SELECT * FROM ��ǰ


INSERT INTO �԰�(��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES('A00003', 3, 220, 660)

INSERT INTO �԰�(��ǰ�ڵ�, �԰����, �԰�ܰ�, �԰�ݾ�) 
VALUES('A00003', 5, 220, 1100)

SELECT * FROM �԰�
SELECT * FROM ��ǰ