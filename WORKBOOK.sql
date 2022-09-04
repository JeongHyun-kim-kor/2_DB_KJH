---- [BASIC] 

-- 1. 춘 기술대학교의 학과 이름과 계열을 표시하시오. 
-- 출력 헤더는 '학과 명', '계열'로 표시
SELECT DEPARTMENT_NAME "학과 명", CATEGORY 계열
FROM TB_DEPARTMENT;

-- 2. 학과의 학과 정원을 다음과 같은 형태로 화면에 출력한다.

SELECT DEPARTMENT_NAME , CAPACITY 
FROM TB_DEPARTMENT 
 ;
 
-- 3. '국어국문학과'에 다니는 여학생 중 휴학중인 여학생 찾자
-- 국문학과의 학과코드는 학과 테이블(TB_DEPARTMENT)을 조회

SELECT STUDENT_NAME
FROM TB_STUDENT 
JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE ABSENCE_YN = 'Y' AND DEPARTMENT_NO = '001' AND SUBSTR(STUDENT_SSN,8,1) = 2 ;


-- 4. 

SELECT STUDENT_NAME 
FROM TB_STUDENT 
WHERE STUDENT_NO IN('A513079','A513090','A513091','A513110','A513119');

-- 5.
SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT 
WHERE CAPACITY BETWEEN 20 AND 30;

-- 6.
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR 
WHERE DEPARTMENT_NO IS NULL;

--7.
SELECT STUDENT_NAME
FROM TB_STUDENT 
WHERE DEPARTMENT_NO IS NULL;

--8.
SELECT CLASS_NO
FROM TB_CLASS 
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

--9.
SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT 

--10.

SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT  
WHERE ABSENCE_YN != 'Y' AND STUDENT_ADDRESS LIKE '전주%'  
AND STUDENT_NO LIKE 'A2%';

---- [FUNCTION]

--1.  시분초 어떻게 없앨까?

SELECT STUDENT_NO 학번, STUDENT_NAME 이름, TO_DATE(ENTRANCE_DATE,'rrrr-MM-DD')  입학년도
FROM TB_STUDENT 
WHERE DEPARTMENT_NO = '002'
ORDER BY (ENTRANCE_DATE);

--2. 

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM TB_PROFESSOR 
WHERE PROFESSOR_NAME != '___';

-- 3.

SELECT PROFESSOR_NAME 교수이름, ((EXTRACT (YEAR FROM SYSDATE)) - (SUBSTR(PROFESSOR_SSN,1,2)+1900)) 나이
FROM TB_PROFESSOR
ORDER BY 나이 ;

-- 4. 
SELECT SUBSTR(PROFESSOR_NAME,2,2)  AS 이름
FROM TB_PROFESSOR ;


--5.  다시

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE (100+(SUBSTR(ENTRANCE_DATE,1,2))) - SUBSTR(STUDENT_SSN,1,2)  = 20;


--6 다시
SELECT TO_CHAR(TO_DATE(20201225), 'DAY') 
FROM DUAL;
--
--7 
SELECT TO_DATE('99/10/11','YY/MM/DD')
FROM DUAL;

SELECT TO_DATE('49/10/11','YY/MM/DD')
FROM DUAL;

SELECT TO_DATE('99/10/11','RR/MM/DD')
FROM DUAL;

SELECT TO_DATE('49/10/11','RR/MM/DD')
FROM DUAL;


--8
SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT 
WHERE SUBSTR(STUDENT_NO ,1,1) != 'A';


--9 

--SELECT ROUND((SUM(POINT)/COUNT('A51718')),1) 평점
SELECT ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A517178'

-- 10.

SELECT DEPARTMENT_NO 학과번호, COUNT(*) "학생수(명)"
FROM TB_STUDENT 
GROUP BY DEPARTMENT_NO
ORDER BY 학과번호
;

-- 11.
SELECT COUNT(*)
FROM TB_STUDENT
WHERE COACH_PROFESSOR_NO IS NULL;


-- 12.
SELECT SUBSTR(TERM_NO,1,4) 년도,  ROUND(AVG(POINT),1) "년도 별 평점"
FROM TB_GRADE 
WHERE STUDENT_NO = 'A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

--13.  다시
SELECT DEPARTMENT_NO 학과코드명,COUNT() "휴학생 수"
FROM TB_STUDENT
--WHERE ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO;

-- 14.
SELECT STUDENT_NAME, COUNT(*)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(*) >1;

--15. 다시
SELECT SUBSTR(TERM_NO,1,4) 년도, SUBSTR(TERM_NO,5,2) 학기, POINT 평점 
FROM TB_GRADE 
WHERE STUDENT_NO ='A112113';


