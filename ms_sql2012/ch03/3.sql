USE master
GO
CREATE DATABASE  TEST01 
GO

CREATE DATABASE TEST02  
ON 
PRIMARY           -- PRIMARY 그룹에 데이터 파일 생성
-----------------------------
-- 데이터 파일 설정 --
-----------------------------
( NAME = TEST02_DAT ,                -- 논리적 이름
  -- 경로 및 파일명
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test02.mdf', 
  SIZE = 100MB ,                      -- 처음 크기
  MAXSIZE = 200 ,                     -- 최대 크기
  FILEGROWTH = 20)                   -- 자동 증가 크기
-----------------------------
-- 트랜잭션 로그 파일 설정 --
-----------------------------
LOG ON
 ( NAME = TEST02_LOG ,               -- 논리적 이름
   -- 경로 및 파일명
  FILENAME='C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\test02.ldf', 
  SIZE = 20MB ,                      -- 처음 크기
  MAXSIZE = 50 ,                     -- 최대 크기
  FILEGROWTH = 10% )                 -- 자동 증가 %
GO
 
ALTER DATABASE TEST01 -- 데이터베이스 이름
   MODIFY FILE
     ( NAME = TEST01,  -- 데이터베이스 파일의 논리적 이름
       SIZE = 400,      -- 기본단위는 MB
       MAXSIZE = UNLIMITED,
       FILEGROWTH = 10  -- 자동 증가 %
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