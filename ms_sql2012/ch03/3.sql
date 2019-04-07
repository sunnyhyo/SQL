USE master
GO
CREATE DATABASE  TEST01 
GO

CREATE DATABASE TEST02  
ON 
PRIMARY           -- PRIMARY �׷쿡 ������ ���� ����
-----------------------------
-- ������ ���� ���� --
-----------------------------
( NAME = TEST02_DAT ,                -- ���� �̸�
  -- ��� �� ���ϸ�
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test02.mdf', 
  SIZE = 100MB ,                      -- ó�� ũ��
  MAXSIZE = 200 ,                     -- �ִ� ũ��
  FILEGROWTH = 20)                   -- �ڵ� ���� ũ��
-----------------------------
-- Ʈ����� �α� ���� ���� --
-----------------------------
LOG ON
 ( NAME = TEST02_LOG ,               -- ���� �̸�
   -- ��� �� ���ϸ�
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test02.ldf', 
  SIZE = 20MB ,                      -- ó�� ũ��
  MAXSIZE = 50 ,                     -- �ִ� ũ��
  FILEGROWTH = 10% )                 -- �ڵ� ���� %
GO
 
ALTER DATABASE TEST01 -- �����ͺ��̽� �̸�
   MODIFY FILE
     ( NAME = TEST01,  -- �����ͺ��̽� ������ ���� �̸�
       SIZE = 400,      -- �⺻������ MB
       MAXSIZE = UNLIMITED,
       FILEGROWTH = 10  -- �ڵ� ���� %
      )
GO

ALTER DATABASE TEST01
SET
AUTO_SHRINK ON
GO

ALTER DATABASE TEST02
ADD FILE 
(NAME = TEST02_DAT3 , FILENAME=
'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TEST02DAT3.mdf' ,
SIZE = 10MB ,
MAXSIZE = UNLIMITED ,
FILEGROWTH = 5)
ALTER DATABASE TEST02
ADD LOG FILE
( NAME = TEST02_LOG3 ,FILENAME=
'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TEST02LOG3.ldf' ,
SIZE = 10MB ,
MAXSIZE = 20 ,
FILEGROWTH = 2)
GO

ALTER DATABASE TEST02
REMOVE FILE TEST02_DAT3
ALTER DATABASE TEST02
REMOVE FILE TEST02_LOG3
GO

ALTER DATABASE RENAMETEST
MODIFY NAME = TEST02
GO

DROP DATABASE TEST02
GO