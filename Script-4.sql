SELECT EMP_NAME, NVL(DEPT_TITLE, '부서없음') AS DEPT_TITLE, SALARY 
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON(DEPT_CODE = DEPT_ID) 
WHERE NVL(DEPT_TITLE, '부서없음') = '부서없음';
-- DEPT_TITLE없는 사원들도 포함 = LEFT JOIN


WHERE DEPT_TITLE = '회계관리부';
-- 부서없는 하동운 이오리 찾으려면 WHERE DEPT_TITLE ='부서없음'이엉어야 하는데
-- 달라지니까?

'인사관리부'
123
"이마큼ㄴ"
ㅇㅇㅇ

SELECT EMP_NAME, JOB_NAME, SALARY, (SALARY*12) annualIncome
FROM EMPLOYEE 
JOIN JOB USING (JOB_CODE)
WHERE JOB_CODE = 'J7' AND SALARY > 1800000;


-- 입사일을 입력("2022-09-06") 받아
-- 입력 받은 값 보다 먼저 입사한 사람의 
-- 이름, 입사일(1990년 01월 01일), 성별(M,F) 조회

SELECT EMP_NAME 이름,
TO_CHAR(HIRE_DATE,'YYYY"년" MM"월" DD"일"') 입사일, -- YYYY MM을 인식못해서 년월일을 ""로 감싸줌
DECODE(SUBSTR(EMP_NO,8,1),1,'M',2,'F') 성별
--
FROM EMPLOYEE
WHERE HIRE_DATE <  TO_DATE('2000-09-06');
					--> TO_DATE 생략 가능