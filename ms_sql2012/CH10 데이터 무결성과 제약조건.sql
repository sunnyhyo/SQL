/* CH10 ������ ���Ἲ�� �������� 

- ������ ���Ἲ �������� : ���̺� �������� �ڷᰡ �ԷµǴ� ���� �����ϱ� ���ؼ�
  ���̺��� ������ �� �� Į���� ���ؼ� �����ϴ� �������� ��Ģ�� ���Ѵ�. 

- ���Ἲ : �����ͺ��̽� ���� �������� ��Ȯ���� �����ϴ� �� �ǹ�
- �������� : �ٶ������� �ʴ� �����Ͱ� ����Ǵ� ���� �����ϴ� �� �ǹ�

���Ἲ �������� 5���� 
- NOT NULL : NULL�� ������� �ʴ´�
- UNIQUE : �ߺ��� ���� ������� �ʴ´�. �׻� ������ ���� ������ �Ѵ�. 
- PRIMARY KEY : NULL ������� ����, �ߺ��� ���� ������� ����. NOT NULL + UNIQUE
- FOREIGN KEY : �����Ǵ� ���̺��� Į���� ���� �����ϸ� ����Ѵ�. 
- CHECK : ���尡���� �������� ���� ������ ������ �����Ͽ� ������ ������ ����Ѵ�. 
- DEFAULT : �ƹ��� ���� �Է����� �ʾ��� �� ����Ʈ �� �Է�
*/

-- �������� ���� ���̺� ����
CREATE TABLE CUSTOMER (
	ID VARCHAR(20), 
	PWD VARCHAR(20), 
	NAME VARCHAR(20),
	PHONE1 VARCHAR(3),
	PHONE2 VARCHAR(8),
	BIRTHYEAR INT,
	ADDRESS VARCHAR(100)
);

SELECT * FROM CUSTOMER;

-- ������ �߰� 
INSERT INTO CUSTOMER VALUES(NULL, NULL, NULL, '010', '77727777', 1988, '����� ������ ������');
SELECT * FROM CUSTOMER;

-- Į�� ���� ���� ������� ���� ���� �����ϱ� 
DROP TABLE CUSTOMER; 
CREATE TABLE CUSTOMER (
	ID VARCHAR(20) NOT NULL, 
	PWD VARCHAR(20) NOT NULL, 
	NAME VARCHAR(20) NOT NULL,
	PHONE1 VARCHAR(3) NULL,
	PHONE2 VARCHAR(8) NULL,
	BIRTHYEAR INT NULL,
	ADDRESS VARCHAR(100) NULL
);
INSERT INTO CUSTOMER VALUES(NULL, NULL, NULL, '010', '77727777', 1988, '����� ������ ������');
-- ID, PWD, NAME �� NOT NULL���������� �����߱� ������ NULL�� �߰��ϴ� ��ɾ�� ������ �߻�
SELECT * FROM CUSTOMER;
INSERT INTO CUSTOMER VALUES('ONE', '1111', '�質��', '010', '77727777', 1988, '����� ������ ������')
SELECT * FROM CUSTOMER;

/* 03 ������ ���� ����ϴ� UNIQUE �������� 
  UNIQUE : Ư�� Į���� ���� �ڷᰡ �ߺ����� �ʰ� �ϴ� ��
  ������ Į������ ������ ���� ���ϵǰ� �Ѵ�. 
  
  ���ο� ���� ȸ�� ������ �߱� ������ �� ȸ���� ������ �Է��ߴµ�, �̹� �����ϴ� ȸ���� ���̵�� ������ ���̵� ����Ϸ��� �Ѵٸ� �̸� ���� �����ؾ� �ϴ°�? 
  �ߺ��� ���� �����ϸ� �ߺ��� ���� ������ �� ���� �ȴ� 
  */

DROP TABLE CUSTOMER;

CREATE TABLE CUSTOMER(
	ID VARCHAR(20) UNIQUE, 
	PWD VARCHAR(20) NOT NULL, 
	NAME VARCHAR(20) NOT NULL,
	PHONE1 VARCHAR(3) NULL,
	PHONE2 VARCHAR(8) NULL,
	BIRTHYEAR INT NULL,
	ADDRESS VARCHAR(100) NULL
);

INSERT INTO CUSTOMER VALUES('ONE', '1111', '�質��', '010', '77727777', 1988, '����� ������ ������')
SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER VALUES('ONE', '2222', '�̹���', '010', '12324567', 1979, '����� ���ı� ��ǵ�')
SELECT * FROM CUSTOMER;


-- 3.1 Į�� �������� ���������� ����ؼ� ���� ������ �����ϱ� 
DROP TABLE CUSTOMER 
CREATE TABLE CUSTOMER(
	ID VARCHAR(20) CONSTRAINT UK_ID UNIQUE, 
	PWD VARCHAR(20) CONSTRAINT NN_PWD NOT NULL, 
	NAME VARCHAR(20) CONSTRAINT NN_NAMW NOT NULL,
	PHONE1 VARCHAR(3) NULL,
	PHONE2 VARCHAR(8) NULL,
	BIRTHYEAR INT NULL,
	ADDRESS VARCHAR(100) NULL
);
SELECT * FROM CUSTOMER;

INSERT INTO CUSTOMER VALUES('ONE', '1111', '�質��', '010', '77727777', 1988, '����� ������ ������');
INSERT INTO CUSTOMER VALUES('ONE', '2222', '�̹���', '010', '12324567', 1979, '����� ���ı� ��ǵ�');


/* 04 PRIMARY KEY �������� 
  ������ ������ ���� 
  
  - UNIQUE ���������� �ߺ��� �����͸� �����ϴ� ���� ��������, NULL ���� ������ ���� �ִ� 
  ���������� �Ի��ߴٸ� ������ �� �ִ� ����Ű���� �־�� ������ ID �� NULL ���� ����Ǵ� �ٶ��� ������ ���� ���� 
  
  ���̺� ���� �ش� ���� �ٸ� ��� ���� �� �� �ֵ��� �ϴ� Į���� �ݵ�� �����ؾ� �Ѵ�. 
  �ĺ������ ���� Į���� �����ϸ鼭�� NULL ���� ������� ���ƾ� �Ѵ�. 
  
  UNIQUE �������ǰ� NOT NULL ���������� ���ÿ� ���� PRIMARY KEY ���� ���� 
  */

DROP TABLE CUSTOMER 
CREATE TABLE CUSTOMER(
	ID VARCHAR(20) CONSTRAINT PK_ID PRIMARY KEY, 
	PWD VARCHAR(20) CONSTRAINT NN_PWD NOT NULL, 
	NAME VARCHAR(20) CONSTRAINT NN_NAMW NOT NULL,
	PHONE1 VARCHAR(3) NULL,
	PHONE2 VARCHAR(8) NULL,
	BIRTHYEAR INT NULL,
	ADDRESS VARCHAR(100) NULL
);
SELECT * FROM CUSTOMER;

-- UNIQUE �������ǿ� �ɸ�
INSERT INTO CUSTOMER VALUES('ONE', '1111', '�質��', '010', '77727777', 1988, '����� ������ ������');
INSERT INTO CUSTOMER VALUES('ONE', '2222', '�̹���', '010', '12324567', 1979, '����� ���ı� ��ǵ�');
-- NOT NULL �������ǿ� �ɸ�
INSERT INTO CUSTOMER VALUES(NULL, '2222', '�̹���', '010', '12324567', 1979, '����� ���ı� ��ǵ�');


/* 05 ���� ���Ἲ�� ���� FOREIGIN KEY ��������
  - ���� ���Ἲ: ���̺� ������ ���迡�� �߻��ϴ� ����. 
  FOREGIN KEY �� �Ϲ������� ���� ��Ģ���� �������谡 �ִ� �� ���̺� ���� ���Ǹ� 
  ���ӵǴ� ���̺��� Ű Į���� �ְ� �Ǵ� ���̺��� PRIMARY KEY �Ǵ� UNIQUE Į���� �������� �ǹ���

  �θ����̺�     �ڽ����̺� 
  PRIMARY KEY    FOREIGIN KEY  
  (UNIQUE)
  
  */

-- �ܷ�Ű ���� ���� �����ϱ� 
-- CUSTOMER ���̺�� ���踦 ���� ���̺� ���� 


CREATE TABLE PRODUCTS (
	PCODE VARCHAR(20) CONSTRAINT PK_PCODE PRIMARY KEY ,
	PNAME VARCHAR(100),
	PRICE INT
)
SELECT * FROM PRODUCTS


-- ���� �����ϴ� ORDERS ���̺��� ID�� CUSTOMER ���̺��� ID Į���� �����ϰ� �ܷ�Ű �������� ����
-- ���� �����ϴ� ORDERS ���̺��� ID�� PRODUCTS ���̺��� PCODE Į���� �����ϰ� �ܷ�Ű �������� ���� 
CREATE TABLE ORDERS (
	OSEQ  INT IDENTITY(1,1) CONSTRAINT PK_OSEQ PRIMARY KEY,
	QUANTITY VARCHAR(20) NULL,
	INDATE DATETIME NULL,
	ID VARCHAR(20) CONSTRAINT FK_ID REFERENCES CUSTOMER(ID),
	PCODE VARCHAR(20) CONSTRAINT FK_PCODE REFERENCES PRODUCTS(PCODE) 
)


-- PRODUCTS ���̺� ������ �߰�
INSERT INTO PRODUCTS VALUES('P1', '����', 55000)
INSERT INTO PRODUCTS VALUES('P2', '����', 58000)
INSERT INTO PRODUCTS VALUES('P3', '��Ʈ', 53000)
SELECT * FROM PRODUCTS

-- CUSTOMER ���̺� ������ �߰� 
INSERT INTO CUSTOMER VALUES('TWO', '2222', '�̹���', '010', '12324567', 1979, '����� ������ ��ǵ�')
SELECT * FROM CUSTOMER

-- ONE �̶� ���̵��� ���� ������ �ϳ� �ֹ����� ���. �ֹ����̺� ������ �߰� 
INSERT INTO ORDERS(QUANTITY, ID, PCODE) VALUES(5, 'ONE', 'P1')
SELECT * FROM ORDERS

-- ���� CUSTOMER ���̺� �������� �ʴ� ���̵� ���� ���� �ֹ��� �ߴٰ� ����
INSERT INTO ORDERS(QUANTITY, ID, PCODE) VALUES(5, 'TEST', 'P1')


/* 06 ���� ���� �����ϴ� CHECK �������� 
  �ԷµǴ� ���� üũ�Ͽ� ������ �� �̿��� ���� ������ ���� �޽����� �Բ� ����� ������� ���ϰ� �ϴ� �� 
  �������� �������� ���� ������ Ư�� ������ ���ڳ� ���� ���� ������ �� �ִ�. 
  */
  DROP TABLE CUSTOMER2
CREATE TABLE CUSTOMER2(
	ID	VARCHAR(20) CONSTRAINT PK_ID2 PRIMARY KEY,
	PWD	VARCHAR(20) NOT NULL, 
	NAME VARCHAR(20) NOT NULL, 
	PHONE1 VARCHAR(3) NULL
	CHECK(PHONE1 IN('010', '011', '016', '017', '018', '019')),
	PHONE2 VARCHAR(8) NULL, 
	BIRTHYEAR INT NULL
	CHECK(BIRTHYEAR >= 1900 AND BIRTHYEAR <= YEAR(GETDATE())),
	ADDRESS VARCHAR(100) NULL
);
SELECT * FROM CUSTOMER2;

-- ������ �߰� 
INSERT INTO CUSTOMER2 VALUES('THREE', '3333', '�����', '000', '32127654', 1982, '����� ������ �б�����')
-- ������ ���� �� ����
INSERT INTO CUSTOMER2 VALUES('THREE', '3333', '�����', '010', '32127654', 1882, '����� ������ �б�����')
INSERT INTO CUSTOMER2 VALUES('THREE', '3333', '�����', '010', '32127654', 1982, '����� ������ �б�����')
SELECT * FROM CUSTOMER2;


/* 07 DEFUALT ��������

������ �Է����� ������ ����Ʈ�� 1�� ��µǰ�, �ֹ����ڸ� �Է����� ������ ���� ��¥�� ����Ʈ�� �Է��Ѵ� */

CREATE TABLE ORDER2(
	ID	VARCHAR(20) NOT NULL,
	PCODE VARCHAR(20) NOT NULL,
	OSEQ INT IDENTITY, 
	QUANTITY VARCHAR(20) NULL DEFAULT '1',
	INDATE DATETIME NULL DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM ORDER2
INSERT INTO ORDER2(ID, PCODE) VALUES('ONE', 'P1')
INSERT INTO ORDER2(ID, PCODE) VALUES('TWO', 'P2')
SELECT * FROM ORDER2


/* 08 ���̺� ���� ���� ���� �����ϱ� 

Į���� ��� �����ϰ� ���� ���̺� ���Ǹ� ������ ���� ���� ���� ������ Į���鿡 ���� ���� ������ �Ѳ����� �����ϴ� ��
- ���� Ű�� �⺻ Ű�� ������ ��� : ���� Ű (2�� �̻��� Į���� �ϳ��� �⺻ Ű�� �����ϴ� ��) Į������� �ƴ϶� ���̺� ���� ��� ����
- ALTER TABLE �� ���������� �߰� �� �� : ���̺��� ���ǰ� �Ϸ�Ǿ ���̺��� ������ ������ �Ŀ� ���߿� ���̺� ���� ������ �߰��Ҷ�
���̺� ���� ������� ���� ������ �����ؾ��Ѵ�. 
*/

-- �÷� ������ �������� �����ϱ� 
-- �÷��� �����ϸ鼭 ���������� ����

CREATE TABLE ORDER3 (
	OSEQ	INT IDENTITY(1,1) CONSTRAINT PD_OSEQ3 PRIMARY KEY, 
	QUENTITY	VARCHAR(20) NULL,
	INDATE		DATETIME NULL, 
	ID			VARCHAR(20) CONSTRAINT FK_ID3 REFERENCES CUSTOMER(ID), 
	PCODE		VARCHAR(20) CONSTRAINT FK_PCODE3 REFERENCES PRODUCTS(PCODE)
);

-- ���̺� ���� ��� �������� �����ϱ�

CREATE TABLE ORDER4(
	-- Į�� ���� 
	OSEQ INT IDENTITY(1,1), 
	QUANTITY VARCHAR(20) NULL, 
	INDATE DATETIME NULL, 
	ID VARCHAR(20),
	PCODE VARCHAR(20),

	-- ���̺� ���� ��� �������� ����
	CONSTRAINT PK_OSEQ4 PRIMARY KEY(OSEQ),
	CONSTRAINT FK_ID4 FOREIGN KEY(ID) REFERENCES CUSTOMER(ID), 
	CONSTRAINT FK_PCODE4 FOREIGN KEY(PCODE) REFERENCES PRODUCTS(PCODE)
);
SELECT * FROM ORDER4;


-- ���� Ű�� �⺻ Ű�� ���� (�̸� + �ڵ�����ȣ)

CREATE TABLE CUSTOMER3(
	NAME VARCHAR(20), 
	PHONE VARCHAR(11), 
	BIRTHDAY DATETIME, 
	ADDRESS VARCHAR(100),
	
	CONSTRAINT CUSTOMER3_COMBO_PK PRIMARY KEY(NAME, PHONE)
);

SELECT * FROM CUSTOMER3;

/* 09 ���� ���� �����ϱ� 
�̹� �����ϴ� ���̺� ���� ���� �߰�, ����, ���� 

�������� �߰�
ALTER TABLE table_name 
ADD [CONSTRAINT constraint_name ] constraint_type (column_name ) 

�������� ����
ALTER TABLE table_name 
DROP [CONSTRAINT constraint_name]  */

CREATE TABLE ORDERS5(
	OSEQ INT IDENTITY(1,1) ,
	QUANTITY VARCHAR(20) NULL, 
	INDATE DATETIME NULL, 
	ID VARCHAR(20), 
	PCODE VARCHAR(20)
);
SELECT * FROM ORDERS5;

-- OSEQ Į���� �⺻ Ű ����
ALTER TABLE ORDERS5
ADD CONSTRAINT PK_OSEQ5 PRIMARY KEY(OSEQ)

-- ID Į���� �ܷ� Ű ����
ALTER TABLE ORDERS5
ADD CONSTRAINT FK_ID5 FOREIGN KEY(ID) REFERENCES CUSTOMER(ID)

-- ���� ������ ����
ALTER TABLE ORDERS5
DROP CONSTRAINT FK_ID5



-- �������� 
CREATE TABLE EMPLOYEE_TEST(
	ENO INT NOT NULL,
	ENAME VARCHAR(20) NOT NULL,
	JOB VARCHAR(20) NULL,
	DNO INT NOT NULL
) ;

ALTER TABLE EMPLOYEE_TEST
ADD CONSTRAINT PK_ENO PRIMARY KEY(ENO)

ALTER TABLE EMPLOYEE_TEST
ADD CONSTRAINT FK_DNO FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DNO)

