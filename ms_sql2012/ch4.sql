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
		PCODE VARCHAR(20) PRIMARY KEY, 
		PNAME VARCHAR(100),
		PRICE VARCHAR(10)
);

SELECT *
FROM PRODUCT;