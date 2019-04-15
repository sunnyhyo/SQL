/* CH08 ��������

 SELECT select_list
 FROM table_list 
 WHERE column = ( select expression 
				  from select_list 
				  where table_list )

 01 ���� ������ �⺻ ����

 �������� : ���� ������ �����ϰ� �ִ� ������ 
 �������� : ���Ե� �ϳ��� ������. 
			�ϳ��� SELECT ������ �� �ȿ� ���Ե� �� �ϳ��� SELECT ����

 SELECT, INSERT, UPDATEM DELETE �� ���� DML(DATA MANUPLATION LANGUAGE) �� ��ο��� ����� �� �ִ�.

 - ���� ���� �ȿ� ���� ���� �� �� �ִ�. �׽����̶�� �ϸ� �޸� ��� �ѿ��� ������ ��ø ���� 
 - ���� �������� ���� ������ ��� ���� �������� ����� �� SOME, ANY, ALL �����ڸ� ������� �ʴ� �Ϲ����� ��쿡��
 �������������� �ϳ��� ���ڵ尪�� �����ؾ� �Ѵ�. ��κ��� ��� �������������� GROUP BY, HAVING ���� ����� �� ����
 - ���� �������� ORDER BY ���� TOP �����ڿ� �Բ� ���� ���� ��� ����
 - ���� �������� SELECT ���� ���� Į���� �� �������� ����� �� ����

*/

--  ����̸��� �̹����� ����� �μ���ȣȭ �μ��̸� �˾Ƴ��� 
SELECT DNO
FROM EMPLOYEE
WHERE ENAME = '�̹���';

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = 10;

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = (  -- ���������� ����Ǿ� 10�� ������ -> WHERE DNO = 10
			SELECT DNO
			FROM EMPLOYEE
			WHERE ENAME = '�̹���'
			);


/* 1.1 ���� �� �������� 
 
  ���� ����� ���� �ϳ��� �ο츸�� ��ȯ�ϴ� ���� ������ ���� ���� ���Ѵ�. */

SELECT DNAME 
FROM DEPARTMENT
WHERE DNO = (	-- ���� ������ WHERE �������� ���� �� �� �������� =, >, => , <, =< , <> �� ����ؾ� �Ѵ�. 
				SELECT DNO
				FROM EMPLOYEE
				WHERE ENAME = '�̹���'  );


/* 1.2 ���� �������� �׷� �Լ��� ���
  ������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻��� ���ϴ� .
*/

-- ��ձ޿� 
SELECT AVG(SALARY)
FROM EMPLOYEE; 


-- ��ձ޿� ���� �� ���� �޿��� �޴� ��� ����ϱ� 
SELECT ENAME, SALARY
FROM EMPLOYEE 
WHERE SALARY > ( -- ������� ��� �޿��� �ϳ��� ���̹Ƿ� ������ ���� ����
				SELECT AVG(SALARY)
				FROM EMPLOYEE);


/* 02 ���� �� �������� 
 ���� �� ���������� ���� �������� ��ȯ�Ǵ� ����� �ϳ� �̻��� ���� �� ����ϴ� ���� �����Դϴ�. 
 ���� �� ���� ������ �ݵ�� ���� �� �����ڿ� �԰� ���ȴ� */

/* 2.1 IN ������ 
 ���� ������ �� ���ǿ��� ���� ������ ��� ����� �ϳ��� ��ġ�ϸ� ���� ������ WHERE ���� ���� �ǵ��� �ϴ� ������.*/

-- �޿��� 500�� �ʰ��ϴ� ����� �Ҽӵ� �μ��� �μ� ��ȣ ����ϱ� 

SELECT DISTINCT DNO
FROM EMPLOYEE 
WHERE SALARY > 500;

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE 
WHERE DNO = (SELECT DISTINCT DNO
			FROM EMPLOYEE 
			WHERE SALARY > 500);

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE 
WHERE DNO IN (SELECT DISTINCT DNO
			FROM EMPLOYEE 
			WHERE SALARY > 500);


/* 2.2 ALL ������ 
  ALL ������ ���� ������ �� ������ ���� ������ �˻� ����� ��� ���� ��ġ�ϸ� ���̴�. 
  ã���� ���� ���ؼ� AND ������ �ؼ� ��� ���̸� ���̵ȴ�. */

-- 30�� �μ��� �ִ� �޿� ���ϱ�
SELECT MAX(SALARY)
FROM EMPLOYEE 
WHERE DNO = 30;

-- 30�� �μ��� �ִ� �޿����� ���� �޿��� �޴� ��� ����ϱ� 
-- ���ϼ������� 

SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (
				SELECT MAX(SALARY)
				FROM EMPLOYEE
				WHERE DNO = 30);


-- 30�� �μ��� �ִ� �޿����� ���� �޿��� �޴� ��� ����ϱ� 

SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > ALL ( -- >ALL �����ڴ� ���������� ��� ������� ���ؼ� Ŀ�߸� �Ѵ�. 
					 -- 30 �� �μ��� �ִ� �޿����� ���� �޿��� �޴� ����鿡 ���ؼ� ���  
					SELECT SALARY 
					FROM EMPLOYEE
					WHERE DNO = 30);

/* 2.3 ANY ������ 
 ANY ������ ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ��
 > ANY �� ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �ȴ�. */

-- 30�� �μ� �Ҽ� ����� �߿��� ���� ���� �޿� ���
SELECT MIN(SALARY)
FROM EMPLOYEE
WHERE DNO =30;

-- 30�� �μ� �ּ� �޿����� ���� �޿��� �޴� ��� ���
-- ���ϼ���������
SELECT ENAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY >  (   SELECT MIN(SALARY)
					FROM EMPLOYEE
					WHERE DNO =30);


-- 30 �� �μ� �Ҽ��� ������� �޿� ��� 
SELECT SALARY 
FROM EMPLOYEE 
WHERE DNO = 30;

-- 30 �� �μ��� �ּ� �޿����� ���� �޿��� �޴� ��� ���
-- �����༭��������  >ANY 
SELECT ENAME, SALARY 
FROM EMPLOYEE
WHERE SALARY > ANY ( SELECT SALARY	
					FROM EMPLOYEE
					WHERE DNO = 30);

-- �������� �μ� ��ȣ�� 30���� ������� �޿��� �� ��� �ϳ��� ���ؼ� ũ�� ���ǿ� ����
-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ������� ��ȸ

/* 2.3 EXISTS ������ 

  �ַ� �������������� �ַ� ����ϸ� ���� ������ ������� ���� �����⸸ �ϸ� �ٷ� ���� ������ 
  ��� ���� �����Ѵ�. ���� ������ ������� �������� �ʴ´ٸ�, ���������� � ���� ���ϵ��� �ʴ´�, 
  �ӵ��� IN ���� EXISTS �� ���� */

SELECT *
FROM DEPARTMENT 
WHERE EXISTS(   SELECT *
				FROM EMPLOYEE
				WHERE EMPLOYEE.DNO =30);


-- EXISTS �����ڿ� �����̺��� Į���� �����ϴ� ��������
SELECT *
FROM DEPARTMENT 
WHERE EXISTS (SELECT *
			  FROM EMPLOYEE 
			  WHERE EMPLOYEE.DNO = DEPARTMENT.DNO)  -- �������� ���̺��� ����
-- ���������� ���������� INNER JOIN���� ���� ������. 
-- ������ SQL ������ �̷��� ������ ���� �����ͼ��� ������ ���� ������ �ְ� ��� ǥ���ϴ� ���� ����


-- �������� 
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = (SELECT DNO FROM DEPARTMENT WHERE DNAME = '������');
