/* CH4 DDL ���̺� �����ϰ� ������ �߰��ϱ� */

-- 4.1 CREATE TABLE ���̺� ���� 
-- 4.2 ALTER TABLE ���̺� ���� ���� 
-- 4.3 TRUNCATE ���̺��� ��� �ο� ���� 
-- 4.4 DROP TABLE ���̺� ������ ����

-- �̼� �̸��غ��� 
CREATE TABLE departemt(
	DNO INT ,
	DNAME VARCHAR(20),
	LOC VARCHAR(20)
	);
ALTER TABLE department
ADD DMGR VARCHAR(10);


-- 4.1 CREATE TABLE ���̺� ���� 
CREATE TABLE memberTest(
	ID INT IDENTITY(1,1),  -- IDENTITY �� ȸ���� �����ϰ� �����ϱ� ���� ����
	NAME VARCHAR(20)
)

-- ID Į���� ���� ��ü���� �� �Է����� ����
INSERT memberTest VALUES('�質��')
INSERT memberTest VALUES('�̹���')
INSERT memberTest VALUES('�����')

-- Ȯ�� ID Į������ 1, 2, 3 ���ӵǴ� ���� �ԷµǾ���
SELECT *
FROM memberTest

-- ��ǰ ���̺� �����غ���
CREATE TABLE product(
		PCODE VARCHAR(20) CONSTRAINT PK_pcode PRIMARY KEY, 
		PNAME VARCHAR(100) DEFAULT '0',
		PRICE VARCHAR(10) DEFAULT '0'
);

SELECT *
FROM PRODUCT;



-- 4.2 ALTER TABLE ������ ���� ���� 
/* ���ο� Į�� �߰��ϱ�
    ALTER table_name
    ADD colum_name, data_type, expr */

ALTER TABLE PRODUCT
ADD PDATE DATETIME NULL

SELECT *
FROM PRODUCT;

/* ���� Į�� �Ӽ� �����ϱ�
    ALTER table_name
    ALTER COLUMN column_name, data_type, expr */ 
ALTER TABLE PRODUCT
ALTER COLUMN PRICE VARCHAR(20)

/* ���� Į�� �����ϱ�
    ALTER table_name
    DROP COLUMN column_name; */

ALTER TABLE PRODUCT 
DROP COLUMN PDATE;

SELECT *
FROM PRODUCT;

-- 4.3 TRUNCATE ���̺��� ��� �ο� ����
/* ���̺��� ��� �ο� ����
    TRUNCATE TABLE table_name
	
	DROP TABLE : ���̺� ���� ��ü�� ����� ��, ������ �������� ����
	TRUNCATE TABLE : ���̺��� �����ϸ鼭 ������ ���븸 �����, ���� ��������  */

SELECT *
FROM memberTest;

TRUNCATE TABLE memberTest

SELECT *
FROM memberTest;

-- 4.4 DROP TABLE ���̺� ������ ����
/* ���̺� ���� ���� 
	DROP TABLE table_name ; 
	
	���̺� ������ ���Ἲ ����
	�����ϰ��� �ϴ� ���̺��� �⺻Ű�� ����Ű�� �ٸ� ���̺��� �����ؼ� ����ϴ� ��쿡�� 
	�ش� ���̺��� ������ �� ����*/

DROP TABLE memberTest

