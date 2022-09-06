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
