USE master
GO

DROP LOGIN sqlUser

CREATE LOGIN [employeeUser1] 
WITH PASSWORD = 'password',      --기본 데이터베이스를 지정
DEFAULT_DATABASE = [MagicCorp],  --기본 데이터베이스를 지정
CHECK_POLICY = ON,               --Windows 암호 정책을 이 로그인에 적용
CHECK_EXPIRATION = OFF           --암호 만료 정책을 적용하지 않음
GO

USE MagicCorp
CREATE USER [employeeUser1] 
FOR LOGIN [employeeUser1]        --SQL Server 로그인을 지정
GO