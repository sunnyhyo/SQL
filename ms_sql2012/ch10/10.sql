USE testdb
GO

CREATE TABLE customer( 
	id VARCHAR(20),
	pwd VARCHAR(20), 
	name VARCHAR(20), 
	phone1 VARCHAR(3), 
	phone2 VARCHAR(8), 
	birthYear int,
	address VARCHAR(100) 
)


SELECT * FROM customer

INSERT INTO customer
VALUES(NULL, NULL, NULL, '010', '77727777', 1988, '서울시 성동구 성수동')

SELECT * FROM customer

DROP TABLE customer
GO

CREATE TABLE customer( 
id VARCHAR(20) NOT NULL,  
pwd VARCHAR(20) NOT NULL, 
name VARCHAR(20) NOT NULL, 
phone1 VARCHAR(3) NULL, 
phone2 VARCHAR(8) NULL, 
birthYear int NULL,
address VARCHAR(100) NULL
)

INSERT INTO customer
VALUES(NULL, NULL, NULL, '010', '77727777', 1988, '서울시 성동구 성수동')

INSERT INTO customer
VALUES('one', '1111', '김나리', '010', '77727777', 1988, '서울시 성동구 성수동')

SELECT * FROM customer

DROP TABLE customer
GO

CREATE TABLE customer( 
id VARCHAR(20) UNIQUE, 
pwd VARCHAR(20) NOT NULL, 
name VARCHAR(20) NOT NULL, 
phone1 VARCHAR(3) NULL, 
phone2 VARCHAR(8) NULL, 
birthYear int  NULL,
address VARCHAR(100) NULL
)

INSERT INTO customer
VALUES('one', '1111', '김나리', '010', '77727777', 1988, '서울시 성동구 성수동')

SELECT * FROM customer


INSERT INTO customer
VALUES('one', '2222', '이백합', '010', '12324567', 1979, '서울시 송파구 잠실동')

DROP TABLE customer
GO

CREATE TABLE customer( 
id VARCHAR(20) CONSTRAINT UK_id UNIQUE, 
pwd VARCHAR(20) CONSTRAINT NN_pwd NOT NULL, 
name VARCHAR(20) CONSTRAINT NN_name NOT NULL, 
phone1 VARCHAR(3) NULL,
phone2 VARCHAR(8) NULL,
birthYear int NULL,
address VARCHAR(100) NULL
)


INSERT INTO customer
VALUES('one', '1111', '김나리', '010', '77727777', 1988, '서울시 성동구 성수동')

INSERT INTO customer
VALUES('one', '2222', '이백합', '010', '12324567', 1979, '서울시 송파구 잠실동')

DROP TABLE customer
GO

CREATE TABLE customer( 
id VARCHAR(20) CONSTRAINT PK_id PRIMARY KEY, 
pwd VARCHAR(20) CONSTRAINT NN_pwd NOT NULL, 
name VARCHAR(20) CONSTRAINT NN_name NOT NULL, 
phone1 VARCHAR(3) NULL,
phone2 VARCHAR(8) NULL,
birthYear int NULL,
address VARCHAR(100) NULL
)

INSERT INTO customer
VALUES('one', '1111', '김나리', '010', '77727777', 1988, '서울시 성동구 성수동')

INSERT INTO customer
VALUES('one', '2222', '이백합', '010', '12324567', 1979, '서울시 송파구 잠실동')


INSERT INTO customer
VALUES(NULL, '2222', '이백합', '010', '12324567', 1979, '서울시 송파구 잠실동')


CREATE TABLE orders (
 oseq     int IDENTITY(1,1) CONSTRAINT PK_oseq  PRIMARY KEY, 
 quantity  varchar(20) NULL,
 indate    datetime NULL,
 id        varchar(20) CONSTRAINT FK_id REFERENCES customer(id),
 pcode    varchar(20) CONSTRAINT FK_pcode REFERENCES products(pcode)
)

INSERT INTO products VALUES('P1', '바지', 55000)
INSERT INTO products VALUES('P2', '점버', 58000)
INSERT INTO products VALUES('P3', '니트', 53000)

SELECT * FROM products

INSERT INTO customer
VALUES('two', '2222', '이백합', '010', '12324567', 1979, '서울시 송파구 잠실동')

SELECT * FROM customer


INSERT INTO orders(quantity, id, pcode) VALUES(5, 'ONE', 'P1')

SELECT * FROM orders


CREATE TABLE customer2( 
 id VARCHAR(20) CONSTRAINT PK_id2 PRIMARY KEY, 
 pwd VARCHAR(20) NOT NULL, 
 name VARCHAR(20) NOT NULL, 
 phone1 VARCHAR(3) NULL CHECK(phone1 in('010', '011', '016', '017', '018', '019')),
 phone2 VARCHAR(8) NULL,
 birthYear int NULL CHECK(birthYear>=1900 AND birthYear<=YEAR(GETDATE())),
 address VARCHAR(100) NULL
)
INSERT INTO customer2 VALUES
('three', '3333', '김장미', '000', '32127654', 1982, '서울시 강남구 압구정동')


INSERT INTO customer2 VALUES
('three', '3333', '김장미', '010', '32127654', 1882, '서울시 강남구 압구정동')

CREATE TABLE orders2 (
 id        varchar(20) NOT NULL,
 pcode    varchar(20) NOT NULL,
 oseq     int IDENTITY,
 quantity  varchar(20) NULL DEFAULT '1',
 indate    datetime NULL DEFAULT CURRENT_TIMESTAMP
)

INSERT INTO orders2(id, pcode) VALUES('one', 'P1')
INSERT INTO orders2(id, pcode) VALUES('two', 'P2')

SELECT * FROM orders2

CREATE TABLE orders3 (
 oseq int IDENTITY(1,1) CONSTRAINT PK_oseq3 PRIMARY KEY, 
 quantity varchar(20) NULL,
 indate datetime NULL,
 id varchar(20) CONSTRAINT FK_id3 REFERENCES customer(id),
 pcode varchar(20) CONSTRAINT FK_pcode3 REFERENCES products(pcode)
)

CREATE TABLE orders4( 
  oseq int IDENTITY(1,1),
  quantity varchar(20) NULL, 
  indate datetime NULL,
  id varchar(20), 
  pcode varchar(20),

  CONSTRAINT PK_oseq4 PRIMARY KEY(oseq),
  CONSTRAINT FK_id4 FOREIGN KEY(id) REFERENCES customer(id),
  CONSTRAINT FK_pcode4 FOREIGN KEY(pcode) REFERENCES products(pcode)
)

CREATE TABLE customer3( 
  name VARCHAR(20), 
  phone VARCHAR(11),
  birthday DATETIME,
  address VARCHAR(100)
  CONSTRAINT customer3_COMBO_PK PRIMARY KEY(name, phone)
)

CREATE TABLE orders5 (
   oseq     int IDENTITY(1,1), 
   quantity  varchar(20) NULL,
   indate    datetime NULL,
   id        varchar(20),
   pcode    varchar(20)
)

ALTER TABLE orders5
ADD CONSTRAINT PK_oseq5 PRIMARY KEY(oseq)

ALTER TABLE orders5
ADD CONSTRAINT FK_id5
FOREIGN KEY(id) REFERENCES customer(id)


ALTER TABLE orders5
DROP CONSTRAINT FK_id5


CREATE TABLE employee(
 eno int CONSTRAINT PK_eno PRIMARY KEY,
 ename varchar(20) NOT NULL,
 job varchar(20),
 dno int NOT NULL
)

ALTER TABLE department
ALTER COLUMN dno int NOT NULL 
go

ALTER TABLE department
ADD CONSTRAINT PK_dno PRIMARY KEY(dno)


ALTER TABLE employee
ADD CONSTRAINT FK_dno FOREIGN KEY(dno) REFERENCES department(dno)

