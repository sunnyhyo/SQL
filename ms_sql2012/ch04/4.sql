USE master
GO
CREATE DATABASE testdb
GO
USE testdb
GO

CREATE TABLE memberTest (
   id INT IDENTITY(1,1),
   name VARCHAR(20)
)
GO

INSERT memberTest VALUES('±Ë≥™∏Æ')
INSERT memberTest VALUES('¿ÃπÈ«’')
INSERT memberTest VALUES('±Ë¿ÂπÃ')
GO

SELECT * FROM memberTest;
GO

CREATE TABLE products (
 pcode  varchar(20)  CONSTRAINT PK_pcode  PRIMARY KEY, 
 pname  varchar(100) default '0',
 price  varchar(10)  default '0',
)
GO

ALTER TABLE products
ADD pdate datetime NULL
GO

ALTER TABLE products
ALTER COLUMN price VARCHAR(20) 
GO

ALTER TABLE products
DROP COLUMN pdate
GO

TRUNCATE TABLE memberTest 
GO

DROP TABLE memberTest
GO 


CREATE TABLE department(
DNO INT,
DNAME VARCHAR(20),
LOC VARCHAR(20))

ALTER TABLE department
ADD DMGR VARCHAR(10)