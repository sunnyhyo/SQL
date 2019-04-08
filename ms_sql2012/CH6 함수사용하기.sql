/* CH5 �Լ� ����ϱ� 

- �����Լ� 
- GROUP BY �� HAVING 
- ������ �����Լ� 
- ���ǿ� ���� ���� �ٸ� ó���� ������ CASE
- PIVOT �� UNPIVOT (����)
- RANKS (����)  */

/* �����Լ� 
  �����Լ��� �ϳ� �̻��� ���� �׷����� ���� �����Ͽ� ����, ��� �� �ϳ��� ����� ��Ÿ�� 
  
  COUNT, AVG, MAX, MIN,STDDEV, COUNT_BIG (�׷��� �� ����)
  
  COUNT(*) �� �����ϰ� �����Լ��� NULL �� ���� 
  �����Լ� ���� �ٴ� DISTINCT �����ڴ� �Լ����� ���������� ������ �� �� �ߺ��� ���� �����ϱ� ���ؼ� ���
  MIN, MAX �Լ������� �翬�� �ϳ��� ���� �����Ƿ� DISTINCT ��� ���� �ǹ̰� ����*/

SELECT SUM(SALARY) AS [�޿��Ѿ�]
FROM EMPLOYEE;

SELECT SUM(COMMISSION) AS [Ŀ�̼��Ѿ�]
FROM EMPLOYEE;

SELECT AVG(SALARY) AS [�޿����]
FROM EMPLOYEE;

SELECT MAX(SALARY) AS �ִ�޿�, MIN(SALARY) AS �ּұ޿�
FROM EMPLOYEE;

-- �����Լ��� �ܼ�Į�� 
SELECT MAX(SALARY) AS [�ִ�޿�]
FROM EMPLOYEE;

SELECT ENAME, MAX(SALARY) AS [�ִ�޿�]
FROM EMPLOYEE; 
/* ���� 
  �����Ѽ��� ������� �� �Ѱ��� �ο�, ������ �̸��� 14�� 
  ���� ����Ǵ� �ο찡 �޶� ���� ��ġ��ų �� ����
  -> SELECT �� �����Լ��� ����ϴ� ���, �����Լ��� �������� ���� �ܼ�Į���� �� �� ����. 
  -> �ִ� �޿��� �޴� ����� �̸��� ����Ϸ��� ������������ ����� �Ѵ�. */

-- �ο� ���� ���ϴ� COUNT �Լ�
SELECT COUNT(COMMISSION) AS [Ŀ�̼��� ���� ����� ��]  -- COUNT �Լ��� NULL���� ���� ������ ���� �ʴ´�
FROM EMPLOYEE;

SELECT COUNT(*) AS [��ü ����� ��],   -- COUNT(*) ���̺��� ��ü �ο� ������ ����
	COUNT(COMMISSION) AS [Ŀ�̼��� �޴� ����� ��] --COUNT(COMMISSION) COMMISSION Į������ NULL�� �ƴ� ���� ������ ����
FROM EMPLOYEE;

SELECT COUNT(JOB) AS [������ ����]
FROM EMPLOYEE;

-- 14 �� ����, ���� ������ �ߺ��Ǿ� ����ȴ�. COUNT �Լ��� JOB Į���� ī�����ϸ� �ߺ��� �ο츦 ī����.
SELECT JOB 
FROM EMPLOYEE 
ORDER BY JOB ;

-- ������ ������ �� ������, �� �ߺ����� ���� ������ ������ ī�����ϱ� 
SELECT COUNT(DISTINCT JOB) AS [������]
FROM EMPLOYEE ;

/* GROUP BY �� HAVING 
	�����Լ��� ���� � Į�� ���� �������� �����Լ��� ������ ���� ����� �ش�. 
	GROUP BY �� �ڿ� �ش� Į���� ���
	��Ī x, �÷��� o 
	
	SELECT �÷���, �����Լ� 
	FROM ���̺��
	WHERE ���� (������)
	GROUP BY Į����  */

SELECT DNO
FROM EMPLOYEE
GROUP BY DNO;

SELECT AVG(SALARY) AS [�޿� ���] 
FROM EMPLOYEE 
GROUP BY DNO;

SELECT DNO, AVG(SALARY) AS [�޿� ���] 
FROM EMPLOYEE 
GROUP BY DNO;

SELECT DNO AS [�μ���ȣ], AVG(SALARY) AS [�޿� ���] 
FROM EMPLOYEE 
GROUP BY DNO; -- GROUP BY �μ���ȣ : ���� 

SELECT DNO, SALARY 
FROM EMPLOYEE 
ORDER BY DNO;

/*�����Լ� ��� �� �ܼ� Į���� SELECT ����Ʈ�� �� �� ����. 
 ��, GROUP BY �� �ڿ� ���� �ܼ� Į���� SELECT ����Ʈ�� ��� �� �� �ְ�, ����ؾ߸� �����ν��� �ǹ̰� �ִ�. 
 -> �����Լ� ��� �� GROUP BY ���� ������ ���� �ܼ� Į���� SELECT ����Ʈ�� ���� ���� */

-- GROUP BY ���� ������� �ʤ��� Į���� SELECT ���� ����� �߸��� ����
SELECT DNO, ENAME, AVG(SALARY) AS [�޿����]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, ENAME, AVG(SALARY) AS [�޿����]
FROM EMPLOYEE
GROUP BY DNO, ENAME;


-- �Ҽ� �μ����� �޿��Ѿװ� ��ձ޿� ���ϱ�
SELECT DNO, SUM(SALARY) AS [�޿��Ѿ�], AVG(SALARY) AS [�޿����]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, SUM(SALARY) AS [�޿��Ѿ�], AVG(SALARY) AS [�޿����1], 
	COUNT(DNO) AS [�μ��ο���], SUM(SALARY)/COUNT(DNO) AS [�޿����2]
FROM EMPLOYEE
GROUP BY DNO;

/* �������� �����Լ��� ����� �� �ܼ� Į���� �Բ� ������� ���Ѵٰ� ����
   -> �����Լ��� ������� �ܼ� Į���� ��Ī �Ұ����ϱ� ����
   ������ DNO �� Į���� GROUP BY �� ����Ͽ� �μ����� �����Լ��� ������� ���߱� ������ 
   ������ �߻����� ����  */

SELECT DNO, SALARY 
FROM EMPLOYEE
ORDER BY DNO DESC, SALARY DESC;

SELECT DNO, MAX(SALARY) AS [�ִ�޿�], MIN(SALARY) AS [�ּұ޿�]
FROM EMPLOYEE
GROUP BY DNO;

SELECT DNO, COMMISSION
FROM EMPLOYEE 
ORDER BY DNO;

SELECT DNO, COUNT(*) AS [�μ��� ��� ��], COUNT(COMMISSION) AS [Ŀ�̼� �޴� ��� ��]
FROM EMPLOYEE
GROUP BY DNO;

/* HAVING ���� 
   SELECT ���� ������ ����Ͽ� ����� ���� �� ���� WHERE ���� ��������� 
   �׷��� ����� �����Ϸ��� HAVING ���� ����Ѵ�. 
   
   WHERE : ���̺��� ����� ������ �� �� ���̺��� Ư�� ���ǿ� �����ϴ� �ڷḸ �˻��ϰ��� �� �� ����ϴ� ��
   -> �ܼ� Į�� ���
   HAVING : �����Լ� ��� �� �����Լ��� �����ؼ� ���� ��� �� �߿��� ���ϴ� ���ǿ� �����ϴ� �ڷḸ �����ϰ� ���� �� ���
   -> �����Լ��� ����� Į���� �������� ���*/

SELECT DNO, AVG(SALARY) AS [�μ��� ��� �޿�]
FROM EMPLOYEE 
GROUP BY DNO
HAVING AVG(SALARY) >= 500;

SELECT DNO, AVG(SALARY) AS [�ּұ޿�], MAX(SALARY) AS [�ִ�޿�]
FROM EMPLOYEE 
GROUP BY DNO
HAVING MAX(SALARY) > 500;

-- HAVING, WHERE �Բ� ���� ��� ��� �Ǵ���?????


/* 03 ������ �����Լ��� ��� 

- ROLLUP 
- CUBE */

/* 04 ���ǿ� ���� ���� �ٸ� ó���� ������ CASE
- CASE  */

/* 05 PIVOT �� UNPIVOT 
- PIVOT 
- UNPIVOT */

/* 06 RANKS 
- RANK
- DENSE_RANK 
- ROW_NUMBER 
- NTILE 
- PARTITION BY */

/* 07 �߰��� ���Լ�
- IFF 
- CHOOSE
- ������
*/

