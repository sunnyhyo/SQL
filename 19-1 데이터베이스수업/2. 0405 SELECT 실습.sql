/* 0405 �ǽ� SELECT */

/* 1. ��ü�μ��� ��� ��Ʈ����Ʈ�� �˻� */ 
SELECT *
FROM DEPARTMENT;

/* 2. ��� �μ��� �μ���ȣ�� �μ� �̸��� �˻�*/
SELECT DEPTNO, DEPTNAME
FROM DEPARTMENT;

/* 3. ��� ����� ������ �˻�*/
SELECT TITLE
FROM EMPLOYEE;

/* 4. ��� ����� ������ ������ �˻�*/
SELECT DISTINCT TITLE 
FROM EMPLOYEE;

/* 5. 2�� �μ��� �ٹ��ϴ� ����鿡 ���� ��� ���� �˻�*/
SELECT *
FROM EMPLOYEE
WHERE DNO = 2 ;

/* 6. �̾� ���� ���� ������� �̸�, ����, �Ҽ�, �μ���ȣ �˻�*/
SELECT E.EMPNAME, E.TITLE, D.DEPTNAME, E.DNO
FROM EMPLOYEE E, DEPARTMENT AS D
WHERE E.DNO = D.DEPTNO AND E.EMPNAME LIKE '��%';

/* 7. �̾� ���� �ƴ� ������� �̸� */
SELECT E.EMPNAME
FROM EMPLOYEE AS E, DEPARTMENT AS D
WHERE E.DNO = D.DEPTNO AND E.EMPNAME NOT LIKE '��%'

/* 8. �̸��� ����° ���ڰ� ���� ����� �̸��� �˻��϶�*/
SELECT EMPNAME
FROM EMPLOYEE
WHERE EMPNAME LIKE '__��%'

/* 9. ������ �븮�̸鼭 2�� �μ����� �ٹ��ϴ� ������� �̸��� �޿��� �˻�*/
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '�븮' AND DNO = 2;


/* 10. ������ �����̸鼭 1�� �μ��� ������ ���� ������� �̸��� �޿��� �˻�*/
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '����' AND DNO <> 1 ;

/* 11. �޿��� 3000000�� �̻��̰�, 45000000�� ������ ������� �̸��� �޿��� �˻�*/
SELECT EMPNAME, SALARY 
FROM EMPLOYEE 
WHERE SALARY >= 3000000 AND SALARY <= 45000000;

SELECT EMPNAME, SALARY 
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 45000000;

/* 12. 1�� �μ��� 3�� �μ��� �Ҽӵ� ����鿡 ���Ͽ� �̸��� ������ �޿�, 
�޿��� 10% �λ�Ǿ��� ���� ���� �˻��Ͽ� �޿��� ������������ �����϶�. 
�޿��� ������ ���� ����̸��� ������������ ����*/

SELECT EMPNAME, SALARY, SALARY * 1.1 AS NEWSALARY
FROM EMPLOYEE 
WHERE DNO = 2 OR DNO = 3
ORDER BY NEWSALARY ASC, EMPNAME DESC;

/* 13. �μ����� �׷� �� ���� ���� 3�� �̻� �μ��� ���ؼ� �μ���ȣ, ��ձ޿�*/
SELECT DNO, AVG(SALARY) AS AVGSAL
FROM EMPLOYEE
GROUP BY DNO
HAVING COUNT(DNO) >= 3;


SELECT EMPNAME, DNO, SALARY 
FROM EMPLOYEE AS E 
WHERE SALARY > 
	  (SELECT AVG(SALARY)
	  FROM EMPLOYEE 
	  WHERE DNO = E.DNO);