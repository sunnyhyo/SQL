-- CH7 ���̺� �����ϱ� 

/* 01 ������ �ʿ伺 
 SELECT *
 FROM EMPLOYEE */

-- ������̺� �������� �μ� ��ȣ�� �ְ�, �μ� �̸��� ����
SELECT *
FROM EMPLOYEE;

-- Ư�� ����� ���� �μ��̸��� �˱� ���ؼ� �μ����̺��� ����ؾ��Ѵ�
SELECT ENAME, DNO
FROM EMPLOYEE
ORDER BY DNO;

SELECT DNO, DNAME
FROM DEPARTMENT;

-- ���� �����ͺ��̽����� �ΰ� �̻��� ���̺� ������ �������� ����. �ߺ������� �����ϱ� ������

-- �̹��� ����� �μ���ȣ �˾Ƴ���. �� �μ���ȣ�� �̸� �˾Ƴ���
SELECT ENAME, DNO
FROM EMPLOYEE
WHERE ENAME = '�̹���';

SELECT DNO, DNAME
FROM DEPARTMENT
WHERE DNO = 10;


/* 02 CROSS JOIN 
SELECT ���� FROM ���� EMPLOYEE ���̺�� DEPARTMENT ���̺��� �޸��� �����ؼ� �������� ����ϴ� ��*/

SELECT *
FROM EMPLOYEE, DEPARTMENT;
-- ���յǱ� ������, ���ε� �� �ƹ��� ������ �������� �ʾұ� ������ ��� �� �� ���ؼ� ���̺� 4���� �ο�� ���յǾ���, �ǹ� ����

/*�ǹ� �ִ� ���� ����� �Ƿ���, ������ �� ������ �����ؾ� �Ѵ�. 
  ���� ���ǿ� ���� ������ ������ �����ȴ�. 
  
  - EQUI JOIN : ������ Į���� �������� ����
  - NON-EQUI JOIN : ���� Į���� ���� �ٸ� ������ ����Ͽ� ����
  - OUTER JOIN : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ����
  - SEIF JOIN : �� ���̺� ������ ���� */


/* 03 EQUI JOIN 
  SELECT *
  FROM EMPLOYEE, DEPARTMENT
  WHERE EMPLOYEE.DNO = DEPARTMENT.DNO; 
(EMPLOYEE ���̺��� DNO Į��) = (DEPARTMENT ���̺��� DNO Į��)

  - ���� ���� ����ϴ� ���� ���
  - ���� ����� �Ǵ� �� ���̺��� ���������� �����ϴ� Į���� ���� ��ġ�Ǵ� ���� �����Ͽ� ��� ���� */


SELECT ENAME, DNAME						-- SELECT Ư�� Į���� �����ϱ� ����
FROM EMPLOYEE AS E, DEPARTMENT AS D     -- FROM Ư���� Ű���� ���� ���̺� 2�� �޸��� ���� 
WHERE E.DNO = D.DNO;					-- WHERE ���� ���� ������ �ùٸ��� ����ؾ� �ǹ��ִ� ��� 


-- 3.1 EQUI JOIN �� AND �����ϱ� 

SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

-- �̹����� �̸��� �Ҽ� �μ� �̸� ����ϱ� 
SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO AND ENAME = '�̹���';  -- WHERE ������ AND �����ڸ� �߰��ؼ� �̹����� �̸��� �˱� 

-- 3.2 Į���� ��ȣ�� �ذ�
SELECT ENAME, DNAME, DNO			-- �� ���̺��� ������ �̸����� ���ǵ� Į���� ���о��� ����ϸ� �ָŸ�ȣ�� ���� 
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT EMPLOYEE.ENAME, DEPARTMENT.DNAME, EMPLOYEE.DNO
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME, EMPLOYEE.DNO
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

-- 3.3 ��Ī ���� 

SELECT E.ENAME, D.DNAME, E.DNO
FROM EMPLOYEE E, DEPARTMENT D		-- FROM ������ ���̺�� ������ ������ �ΰ� ��Ī�� �ο�
WHERE E.DNO = D.DNO;				-- FROM ������ ������ ��Ī�� SELECT ���� WHERE ������ ����ϰ� ����


/* NON- EQUI JOIN
 ���� ���ǿ� Ư�� ���� ���� �ִ����� �����ϱ� ���ؼ� 
 WHERE ���� ���� ������ = ������ �̿��� �� �����ڸ� ����Ѵ�.  */ 

-- �޿� ��� ���̺� ����ϱ� 
SELECT *
FROM SALGRADE;


-- ����� �޿��� �� ������� �˱� 
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOWSAL AND HIGHSAL;

SELECT E.ENAME, E.SALARY, S.GRADE
FROM EMPLOYEE E, SALGRADE S 
WHERE SALARY >= LOWSAL AND SALARY <= HIGHSAL;

-- 3���� ���̺� �����ϱ� 

SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMPLOYEE E, DEPARTMENT D, SALGRADE S
WHERE E.DNO = D.DNO 
      AND E.SALARY BETWEEN S.LOWSAL AND S.HIGHSAL;

/* SEIF JOIN
  �ڱ� �ڽŰ� ������ �δ� �� 
  ������ �� �� �̻��� ���� �ٸ� ���̺��� ���� �����ϴ� �ͻӸ� �ƴ϶�, 
  �ϳ��� ���̺� ������ ������ �ؾ߸� ���ϴ� �ڷḦ ���� �� �ִ�. 
  */

-- �̹����� �Ŵ��� �̸��˱� : ���켺

-- EMPLOYEE ���̺��� �̸��� '�̹���' ����� ��� �Ŵ����� �����ȣ MANAGER �� 1008 �� ���� �˾Ҵ�. 
SELECT *
FROM EMPLOYEE;

-- �Ŵ����� �����ȣ�� 1008 (MANAGER) �� ��ġ�ϴ� �����ȣ(ENO)�� ��� ���̺�(EMPLOYEE)���� ã�´�
SELECT ENO, ENAME
FROM EMPLOYEE;


/* �̹��� ����� �Ŵ��� �̸��� �˱� ���ؼ��� �ΰ��� ���̺��� ���εǾ�� �Ѵ�. 
   �Ŵ��� ���� �� ȸ���� ����̱� ������ ������ �ߺ� ������ �߻��ϹǷ� �Ŵ����� ���� ���̺��� ���� ���������� �ʴ´�.
   ���� �̹����� ��� �Ŵ����� ��� ���̺��� �����ؾ���
   
   EMPLOYEE ���̺��� EMPLOYEE ���̺�� ���εǾ�� �Ѵ�. 
   FROM �� ������ ���� ���̺��� ������ �ι� ����� ���� ����. 
   �׷��Ƿ� �ڽŰ� ���� ���̺��� �ϳ� �� �����ϴ� ��ó�� �����ϵ��� ���̺� ��Ī ��� 
   EMPLOYEE ���̺��� MEMBER �� MANAGER ��� ��Ī���� �����ؼ� �ΰ��� ���̺��� �����ϴ� �� ó�� ���*/


SELECT MEMBER.ENAME AS [����̸�], MANAGER.ENAME AS [���ӻ���̸�]
FROM EMPLOYEE AS MEMBER, EMPLOYEE AS MANAGER
WHERE MEMBER.MANAGER = MANAGER.ENO;

/* �ȼ��� �� �����̶� MANAGER NULL ��. 14���� ����������� 13���� ��������� ���´�
  �����ȣ ENO �� NULL�� ����� ���� ������ ���ǿ� �������� �ʾƼ� �ȼ���� SEIF JOIN �� ������� ������ */


/* 05 ANSI JOIN 
  ANSI ������ SQL ���κ��� ���� �����ϰ� ��� ����. �� �Ϻ��� ���� ���� ���� (OUTER - JOIN) ���� */

-- 5.1 ANSI CROSS JOIN
SELECT *
FROM EMPLOYEE, DEPARTMENT 

SELECT *
FROM EMPLOYEE CROSS JOIN DEPARTMENT 

-- 5.2 ANSI INNER JOIN 
SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME
FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DNO = DEPARTMENT.DNO;

SELECT ENAME, DNAME
FROM EMPLOYEE, DEPARTMENT
WHERE EMPLOYEE.DNO = DEPARTMENT.DNO 
AND EMPLOYEE.ENAME = '�̹���';

SELECT ENAME, DNAME
FROM EMPLOYEE INNER JOIN DEPARTMENT
ON EMPLOYEE.DNO = DEPARTMENT.DNO
WHERE EMPLOYEE.ENAME = '�̹���';


-- 5.3 ANSI OUTER JOIN 

SELECT MEMBER.ENAME AS [����̸�], MANAGER.ENAME AS [���ӻ���̸�]
FROM EMPLOYEE AS MEMBER, EMPLOYEE AS MANAGER
WHERE MEMBER.MANAGER = MANAGER.ENO;

/* �ȼ��� �� �����̶� MANAGER NULL ��. 14���� ����������� 13���� ��������� ���´�
  �����ȣ ENO �� NULL�� ����� ���� ������ ���ǿ� �������� �ʾƼ� �ȼ���� SEIF JOIN �� ������� ������ */

SELECT MEMBER.ENAME AS [����̸�], MANAGER.ENAME AS [���ӻ���̸�]
FROM EMPLOYEE MEMBER LEFT OUTER JOIN EMPLOYEE MANAGER 
ON MEMBER.MANAGER = MANAGER.ENO;

/* �ȼ����� ���ӻ���� ������ ����� ������ ��µǵ��� �ϱ� ���ؼ� OUTER JOIN �Ѵ�. 
  LEFT JOIN ���� ���̺��� ������ �Ǿ �� ���̺� �ִ� ��� �����͸� �����´�. 
  �������� �������� ���� ������ ���̺��� ������ �� ���� ���� NULL�� ó�� 
  
  �ȼ����� ���ӻ���� ������ ����� ������ ��µǵ��� �ϱ� ���ؼ� OUTER JOIN �ߴ�. */

/* 06 UNION �� UNION ALL 
  UNION : �� ������ ����� �ϳ��� ��� �������� ����� ���̴�. 
  ����ȭ�� ���̺��� �����ų ��쿡�� ���� ������� ������ ������ȭ�� ���̺��� ������ �۾��� �� ���� ���� ����
  
  - �� �̸��� �޶� ��� ����
  - ������ ���� ������ ���ƾ� ��, �� ������ ���ų� ���� ȣȯ�� �Ǿ�� �Ѵ�!
  - ������ ���� ������ ���ƾ� ��
  - UNION �� �� �� ��� ������ �� �̸��� ù��° SELECT ���� ������ �� �̸��� ���󰡹Ƿ� 
    ù��° SELECT ������ �� �̸��� �ݵ�� �����ؾ� �Ѵ�. 
	
	SELECT ���̸�1
	FROM ù ��° ���̺�
	UNION(ALL)
	SELECT ���̸�2
	FROM �� ��° ���̺�  */


