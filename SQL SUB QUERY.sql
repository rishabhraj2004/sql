  -- Example
  -- Get names of all students who scored more than class average.
 -- Step 1. Find the avg of class
 --  Step 2. Find the names of students with marks > avg



USE COLLEGE;
CREATE TABLE STUDENTSS(
  ROLLNO INT PRIMARY KEY,
  NAME VARCHAR(50),
 MARKS INT NOT NULL,
 GRADE VARCHAR(1),
 CITY VARCHAR(50) );
 
  INSERT INTO STUDENTSS
  ( ROLLNO, NAME, MARKS, GRADE, CITY)
  VALUES
  (41, "anil", 78, "c", "pune"),
  (42, "bhumika", 93, "a", "mumbai"),
  (43, "chetan", 85, "b", "mumbai"),
  (44, "dhruv", 96, "A", "delhi" ),
  (45, "emanuel", 12, "f", "delhi"),
  (46 , "farah" , 82, "b", "delhi");
  
  
SELECT * FROM STUDENTSS;

SELECT AVG(MARKS)
FROM STUDENTSS;


SELECT name, marks
from studentss
where marks > 75;


-- use of subquery
SELECT name, marks
from studentss
where marks > (SELECT AVG(MARKS) FROM STUDENTSS); -- ISSE BENEFIT YE HAI KI AGAR HM STUDENTS KE MARKS KM JADA KARTE HAI TO WO KHUD AVG NIKAL KE OUTPUT DE DEGA HM BAAR BAAR SUB QUERY NHI LIKHNA HOGA 



  -- Example
 -- Find the names of all students with even roll numbers.
 -- Step 1. Find the even roll numbers
 -- Step 2. Find the names of students with even roll no
 
 SELECT ROLLNO
 FROM STUDENTSS
 WHERE ROLLNO % 2 = 0;
 
 SELECT NAME, ROLLNO
 FROM STUDENTSS
 WHERE ROLLNO IN (42, 44, 46);
 
 -- SUBQUERY
  SELECT NAME, ROLLNO
 FROM STUDENTSS
 WHERE ROLLNO IN (SELECT ROLLNO FROM STUDENTSS WHERE ROLLNO % 2 = 0);
 -- YE AUTOMATED HO JAYEGA AGAR HM ROLL AND NAME OF STUDENT ADD KRENGE TO YE COMMAND BAAR BAAR NHI DENA HOGA YE KHUD HI OUTPUT DE DEGA 
 -- YE POWER HAI SQL SUBQUERY.
 
 
 
-- Example with FROM
 -- Find the max marks from the students of Delhi
 -- Step 1. Find the students of DELHI
 -- Step 2. Find their max marks using the sublist in step  1
 
 
 SELECT *
 FROM STUDENTSS
 WHERE CITY = "DELHI";



-- EAZY WAY
 SELECT MAX(MARKS)
 FROM STUDENTSS
 WHERE CITY = "DELHI";

 -- USE OF SUBQUERY
 
 SELECT MAX(MARKS)
 FROM (SELECT *  FROM STUDENTSS  WHERE CITY = "DELHI") AS TEMPORARY;




-- EXAMPLE WITH SELECT ( YE JADA USE NHI HOOTA)
 
 SELECT (SELECT MAX(MARKS) FROM STUDENTSS) , NAME
 FROM STUDENTSS;
 