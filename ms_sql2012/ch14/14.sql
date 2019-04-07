USE master
GO

DROP LOGIN sqlUser

CREATE LOGIN [employeeUser1] 
WITH PASSWORD = 'password',      --�⺻ �����ͺ��̽��� ����
DEFAULT_DATABASE = [MagicCorp],  --�⺻ �����ͺ��̽��� ����
CHECK_POLICY = ON,               --Windows ��ȣ ��å�� �� �α��ο� ����
CHECK_EXPIRATION = OFF           --��ȣ ���� ��å�� �������� ����
GO

USE MagicCorp
CREATE USER [employeeUser1] 
FOR LOGIN [employeeUser1]        --SQL Server �α����� ����
GO