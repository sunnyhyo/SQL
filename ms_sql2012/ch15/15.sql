USE MagicCorp
GO

SELECT * FROM department
FOR XML RAW
GO

SELECT * FROM department
FOR XML RAW, ELEMENTS
GO

SELECT * FROM department
FOR XML RAW, ELEMENTS XSINIL
GO

SELECT * FROM department
FOR XML RAW, XMLDATA
GO

SELECT * FROM department
FOR XML RAW,XMLSCHEMA
GO

SELECT * FROM department
FOR XML RAW ('department'), ROOT('departments')
GO

select ename, dname, employee.dno   
from  employee, department  
where employee.dno = department.dno 
AND employee.dno = 10
FOR XML  AUTO
GO


SELECT dno as [cno] 
FROM DEPARTMENT
GO

SELECT   1        as Tag,
           NULL    as Parent,
           dno as [company!1!cno]
FROM DEPARTMENT
FOR XML EXPLICIT
GO

SELECT 1 as Tag, 
    NULL as Parent,
    dno as [company!1!cno], 
    dname as [company!1!cname!Element]
FROM DEPARTMENT
FOR XML EXPLICIT
GO

SELECT dno as "@dId", dname
FROM department
FOR XML PATH 

SELECT dno as "@dId", 
dname "department/deptname/@name", 
loc "department/deptloc/location" 
FROM department
FOR XML PATH

DECLARE @iDoc INT
DECLARE @Doc XML 
SET @Doc='<ROOT> 
<department DNO="10" DNAME="경리부" LOC="서울"/> 
<department DNO="20" DNAME="인사부" LOC="인천"/>  
<department DNO="30" DNAME="영업부" LOC="용인"/>  
<department DNO="40" DNAME="전산부" LOC="수원"/>  
</ROOT>' 

EXEC sp_xml_preparedocument @iDoc OUTPUT, @Doc
SELECT * 
FROM OPENXML(@iDoc, '/ROOT/department', 1)
WITH (DNO   varchar(50),
      DNAME varchar(50),
      LOC   varchar(50))      
EXEC sp_xml_removedocument @iDoc
GO

USE MagicCorp
GO
drop TABLE UTXMLTable

CREATE TABLE UTXMLTable(
  Col1 INT PRIMARY KEY identity, 
  Col2 XML    -- 테이블의 열에 XML 데이터 형식을 지정
)   

insert into UTXMLTable values(N'<departments> 
<department DNO="10" DNAME="경리부" LOC="서울"/> 
<department DNO="20" DNAME="인사부" LOC="인천"/>  
<department DNO="30" DNAME="영업부" LOC="용인"/>  
<department DNO="40" DNAME="전산부" LOC="수원"/>  
</departments>
')

select * from UTXMLTable


SELECT * FROM department
FOR XML RAW ('department'), ROOT('departments'),
ELEMENTS, XMLSCHEMA

DROP TABLE TXMLTable
DROP XML SCHEMA COLLECTION user_schema 
CREATE XML SCHEMA COLLECTION user_schema AS '
   <xsd:schema targetNamespace="urn:schemas-microsoft-com:sql:SqlRowSet1" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:sqltypes="http://schemas.microsoft.com/sqlserver/2004/sqltypes" elementFormDefault="qualified">
    <xsd:import namespace="http://schemas.microsoft.com/sqlserver/2004/sqltypes" schemaLocation="http://schemas.microsoft.com/sqlserver/2004/sqltypes/sqltypes.xsd" />
    <xsd:element name="department">
      <xsd:complexType>
        <xsd:sequence>
          <xsd:element name="DNO" type="sqltypes:int" />
          <xsd:element name="DNAME" minOccurs="0">
            <xsd:simpleType>
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1042" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth">
                <xsd:maxLength value="20" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
          <xsd:element name="LOC" minOccurs="0">
            <xsd:simpleType>
              <xsd:restriction base="sqltypes:nvarchar" sqltypes:localeId="1042" sqltypes:sqlCompareOptions="IgnoreCase IgnoreKanaType IgnoreWidth">
                <xsd:maxLength value="20" />
              </xsd:restriction>
            </xsd:simpleType>
          </xsd:element>
        </xsd:sequence>
      </xsd:complexType>
    </xsd:element>
  </xsd:schema>
  '

CREATE TABLE TXMLTable(
  Col1 INT PRIMARY KEY identity, 
  Col2 XML(user_schema) -- 테이블의 열에 XML 데이터 형식을 지정
)   

insert into TXMLTable values(
N'<department xmlns="urn:schemas-microsoft-com:sql:SqlRowSet1">
    <DNO>10</DNO>
    <DNAME>경리부</DNAME>
    <LOC>서울</LOC>
  </department>
')

insert into UTXMLTable values(N'
<department xmlns="urn:schemas-microsoft-com:sql:SqlRowSet1">
    <DNAME>경리부</DNAME>
    <DNO>10</DNO>    
    <LOC>서울</LOC>
</department>
')

SELECT * FROM EMPLOYEE
FOR XML RAW('department'), ROOT('departments')
, ELEMENTS XSINIL
GO