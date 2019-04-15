/* CH9 ������ ���۰� Ʈ�����
  01 ���̺� ���ο� ���� �߰��ϴ� INSERT ��
  
  INSERT INTO table_name
  (column_name ...)
  VALUES(column_name, ...) */

-- ���θ� DEPARTMENT ���̺� �߰� 
INSERT INTO DEPARTMENT(DNO, DNAME, LOC)
VALUES(50, '����', '�ϻ�');
SELECT * FROM DEPARTMENT;

/* ���� ���� ��
- Į���� ����� ����� ������ VALUES ������ ������ ��ȣ �ȿ� ����� ���� ������ ������ ����
- Į���� ����� ����� ������ VLAUES ������ ������ ��ȣ �ȿ� ����� ���� �������� ������ ����
- Į������ �߸� �ԷµǾ��� ���� ������ �߻� 
- Į���� �Է��� ���� ������ Ÿ���� ���� ���� ���� ��쿡�� ������ �߻�  */

/* Į�� ���� ������INSERT ���� 

  ���̺� �ο츦 �߰��� �� ��� Į���� ��� �ڷḦ �Է��ϴ� ��쿡�� ���� Į�� ����� ������� �ʾƵ� �ȴ�.
  Į�� ����� ���µǸ� VALUES ���� ���̺� �⺻ ������ ���󰣴�. 
  */

INSERT INTO DEPARTMENT VALUES(60, '�����', '��õ', '');
SELECT * FROM DEPARTMENT;

/*NULL ���� �����ϴ� �پ��� ��� 
  - �Ͻ����� ��� : Į�� �� ����Ʈ�� Į���� �����ϴ� ��, �ٸ� Į���� ���� �Է������� ������ Į������ �Ͻ������� NULL ���� �Ҵ�
  - ������� ��� : VALUES ����Ʈ�� ��������� NULL �Է�
*/

-- �Ͻ������� NULL �� ����
/* ������ ���� ��Ȯ�ϰ� �˰� �ִ� Į�� �길 ��������� ����� �Ŀ� �׿� ��ġ�Ǵ� ���� VALUES �� ������ ���. 
  INSERT INTO ������ Į�� ��� ���� �����ϴ� ���� �����ϸ� ������ Į���� ���ؼ��� NULL ���� �Էµȴ�. 
  */

INSERT INTO DEPARTMENT(DNO, DNAME)
VALUES(70, '�ѹ���');
SELECT * FROM DEPARTMENT;

INSERT INTO DEPARTMENT 
VALUES(80, 'ȸ���');
-- �÷����� ��������� ������� ������ ���̺��� ���� �ִ� ��� �÷��� ���� �����ؾ� �Ѵ�.
-- 3���� �÷����� �����Ǿ� �ִµ� �� ���������� 2���� �־ ���� �߻�


-- ��������� NULL �� ����
INSERT INTO DEPARTMENT
VALUES(80, 'ȸ���', NULL);
SELECT * FROM DEPARTMENT;

-- ���鹮�� �����ϱ�
INSERT INTO DEPARTMENT 
VALUES (90, '��ȹ��', ''); -- NULL ��� ���鹮�� �÷��� �߰� 
SELECT * FROM DEPARTMENT; 

/* 1.4 ���� ������ ������ �����ϱ�
  INSERT INTO ������ VALUES ���� ����ϴ� ��ſ� ���� ������ ����� �� �ִ�. 
  ������ ���̺� �ִ� ���� ���� �����ؼ� �ٸ� ���̺� ������ �� �ִ�. 
  �̶� ������ ���� INSERT ��ɹ����� ������ Į���� ������ ������ Ÿ���� ���� ������ ������ ����� �����ؾ��Ѵ�. */

-- ���������� ������ �����ϴ� ����

-- ���� ������ �����͸� �����ϱ� ���� ���̺��� �����ϵ� DEPARTMENT �� ���� �����ϰ� ���� 
SELECT * INTO DEPARTMENT2
FROM DEPARTMENT WHERE 0=1;
SELECT * FROM DEPARTMENT2;

-- ���̺� ������ �ְ� ������ ���� �ʴ� ���̺� ���� ������ �ο� �Է��ϱ� 
-- �ϳ��� ���̺� ���� ������ �����ϴ� �� ����ŭ ��, ���� ���� �Էµȴ�. 

INSERT INTO DEPARTMENT2
SELECT TOP(3) * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT2;


/* 02 UPDATE ���̺��� ������ ����
  UPDATE ���� ���̺� ������ �����͸� �����ϱ� ���ؼ� ���
  
  UPDATE table_name
  SET column_name1 = value1, column_name2 = value2, ...
  WHERE conditions; 
   */

/* 2.1 ���̺��� ��� �� ����
  UPDATE ���� ����� �� WHERE ���� �߰����� ������ ���̺��� ��� ���� ����ȴ�.
  */

-- �ǽ��� ���� ���̺� ����� 
SELECT * INTO EMPLOYEE01 FROM EMPLOYEE;

-- EMPLOYEE01 ���̺��� ���� Ȯ�� 
SELECT * FROM EMPLOYEE01;

-- ��� ����� �μ� ��ȣ�� 30 ������ ����
UPDATE EMPLOYEE01
SET DNO = 30;
 
-- �μ���ȣ�� 30������ �����Ǿ����� Ȯ�� 
SELECT * FROM EMPLOYEE01;

-- �̹����� ��� ����� �޿��� 10% �λ��Ű�� UPDATE ��
UPDATE EMPLOYEE01
SET SALARY = SALARY *1.1; 

-- ����� �޿��� 10% �λ�Ǿ����� Ȯ��
SELECT * FROM EMPLOYEE01;

-- ��� ����� �Ի����� ���÷� �c�ϱ� 
UPDATE EMPLOYEE01
SET HIREDATE = GETDATE();

-- ��� ����� �Ի����� ���÷� �����Ǿ����� Ȯ��
SELECT * FROM EMPLOYEE01;

/* 2.2 ���̺��� Ư�� �ุ ���� 
  UPDATE ���� WHERE ���� �߰��ϸ� ���̺��� Ư�� ���� ����ȴ�. 
  */
-- �� ���̺� ����� 
SELECT * INTO EMPLOYEE02 FROM EMPLOYEE;

-- �� ���̺� Ȯ��
SELECT * FROM EMPLOYEE02;

-- �μ���ȣ�� 10���� ����� �μ���ȣ�� 30������ �����Ѵ�. 
UPDATE EMPLOYEE02
SET DNO = 30    -- �ٲ� ��
WHERE DNO = 10  -- �ٲٱ� ��
-- �μ���ȣ�� 10�� �ڷḦ �μ���ȣ 30���� ����

-- �μ���ȣ 20, 30��
SELECT * FROM EMPLOYEE02;

-- �޿��� 500 �̻��� ����� �޿��� 10% �λ��Ѵ�. 
UPDATE EMPLOYEE02
SET SALARY = SALARY * 1.1 
WHERE SALARY >= 500;

-- �޿� �λ� Ȯ��
SELECT * FROM EMPLOYEE02;

-- 2005 �⿡ �Ի��� ����� �Ի����� ���÷� ����
UPDATE EMPLOYEE02
SET HIREDATE = GETDATE()
WHERE HIREDATE LIKE '%2005%';

-- �Ի��� ���� Ȯ��
SELECT * FROM EMPLOYEE02;


/* 2.3 ���̺��� 2�� �̻��� Į���� ����
   ���̺��� ������ Į���� ���� �����Ϸ��� ���� SET ���� �޸��� �߰��ϰ� Į�� = ���� �߰� ���*/

-- �ǽ��� ���� ���̺� ����� 
DROP TABLE EMPLOYEE01;
SELECT * INTO EMPLOYEE01 FROM EMPLOYEE;
-- Ȯ��
SELECT * FROM EMPLOYEE01;
-- �̹��� ����� �μ���ȣ 20 ��, ������ �̻�� ���� 
UPDATE EMPLOYEE01
SET DNO = 20, JOB = '�̻�'
WHERE ENAME = '�̹���';
-- Ȯ��
SELECT * FROM EMPLOYEE01 
WHERE ENAME = '�̹���';
-- �̹��� ����� �Ի����ڴ� ����, �޿��� 700, Ŀ�̼��� 100 ���� ����
UPDATE EMPLOYEE01
SET HIREDATE = GETDATE(), SALARY = 700, COMMISSION = 100
WHERE ENAME = '�̹���';
-- Ȯ��
SELECT * FROM EMPLOYEE01 
WHERE ENAME = '�̹���';

/* 2.4 ���� ������ �̿��� ������ ���� 
  UPDATE ���� SET ������ ���� ������ ����ϸ� ���� ������ ������ ����� ������ ����ȴ�. 
  �� ������� �ٸ� ���̺� ����� �����ͷ� �ش� �÷� ���� ������ �� �ִ�.*/

-- ���̺� ���� , Ȯ��
SELECT * INTO DEPARTMENT01 FROM DEPARTMENT;
SELECT * FROM DEPARTMENT01;

-- 20 �� �μ��� �������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ���� ������. Ȯ��
UPDATE DEPARTMENT01
SET LOC = (SELECT LOC
			FROM DEPARTMENT01
			WHERE DNO = 40)
WHERE DNO = 20;
SELECT * FROM DEPARTMENT01;


/* DELETE �� ���̺� ���ʿ��� ���� ����
  DELETE FROM table_name 
  WHERE conditions 
  
  DELETE ���� ���̺��� ���� ���� �����ϸ� Ư���� �ο츦 �����ϱ� ���ؼ� WHERE���� �̿��Ͽ� ���� ����
  DELETE ���� WHERE �� ������� ���� ��� ���̺� �ִ� ��� ���� ������
  
  DROP �� DELETE ����  */

-- �����ϱ�
DELETE FROM DEPARTMENT01;
SELECT * FROM DEPARTMENT01;

-- ���̺� ���� �߰� 
INSERT INTO DEPARTMENT01 
SELECT * FROM DEPARTMENT;
SELECT * FROM DEPARTMENT01;

-- 30�� �μ��� �����ϰ� �μ� ���̺� ���캸�� 
DELETE FROM DEPARTMENT01
WHERE DNO = 30;
SELECT * FROM DEPARTMENT01;

/* 3.1 ���� ������ �̿��� ������ ����
  ������̺��� �μ����� �������� ����� ��� �����ϱ�
  ������̺��� �μ����� ��ϵǾ� ���� ����. �μ����� �μ� ���̺� ����Ǿ� ����
  �μ� ���̺��� �������� �μ���ȣ�� �˾Ƴ��� �Ѵ�.  -> ������̺� �����ϱ� ���ؼ� ���ꤼ���� ��� 
*/

-- ������̺��� �������� ��� ��� �����ϱ�
DELETE FROM EMPLOYEE01;
INSERT INTO EMPLOYEE01 SELECT * FROM EMPLOYEE;
SELECT * FROM EMPLOYEE01;

-- ������������ �μ����� �������� ����� ã�Ƽ� ������̺��� �����κμ��Ҽ� ��� ����
DELETE FROM EMPLOYEE01
WHERE DNO = (SELECT DNO
			 FROM DEPARTMENT
			 WHERE DNAME = '������');
SELECT *
FROM EMPLOYEE01;


DROP TABLE EMPLOYEE03;

-- �������� 
CREATE TABLE EMPLOYEE03(
	ENO INT, 
	ENAME VARCHAR(20), 
	JOB VARCHAR(20) NULL, 
	SALARY INT

);


INSERT INTO EMPLOYEE03 VALUES(1000, 'APPLE', 'POLICE', 100)
INSERT INTO EMPLOYEE03 VALUES(1010, 'BANANA', 'NURSE', 150)
INSERT INTO EMPLOYEE03 VALUES(1020, 'ORANGE', 'DOCTOR', 250)
INSERT INTO EMPLOYEE03 VALUES(1030, 'VERY',NULL , 250)
INSERT INTO EMPLOYEE03 VALUES(1040, 'CAT', '',200)

SELECT * FROM EMPLOYEE03;

SELECT * FROM EMPLOYEE WHERE DNO =10;


-- ���� ������ ������ �Է�
INSERT INTO EMPLOYEE03
SELECT ENO, ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE DNO = 10

SELECT * FROM EMPLOYEE03;

-- ������ ����
UPDATE EMPLOYEE03
SET SALARY = SALARY - 50
WHERE ENAME IN (SELECT ENAME
			  FROM EMPLOYEE03
			  WHERE SALARY >= 300)
SELECT * FROM EMPLOYEE03;

UPDATE EMPLOYEE03
SET SALARY = SALARY - 50
WHERE SALARY >= 300;


-- ������ �������� ���� ��� ���� 
DELETE FROM EMPLOYEE03
WHERE JOB IS NULL OR JOB = '';
SELECT * FROM EMPLOYEE03;
