-- ========================== 0901 1교시 ==========================

-- 함수 : 컬럼의 값을 읽어서 연산한 결과를 반환

-- 단일 행 함수 : N개의 값을 읽어 N개의 결과를 반환

-- 그룹 함수 : N개의 값을 읽어 1개의 결과를 반환(합계, 평균, 최대, 최소)

-- 함수는  SELECT문의 
-- SELECT절, WHERE절, ORDER BY절, GROUP BY절, HAVING 절에 사용 가능

-------------------- 단일 행 함수 ---------------------------------

-- LENGTH (컬럼명 | 문자열) : 길이 반환
SELECT EMAIL, LENGTH(EMAIL)
FROM EMPLOYEE;

--------------------------------------

-- INSTR(컬럼명 || 문자열, '찾을 문자열' [, 찾기 시작할 위치 ,순번] )
-- 지정할 위치부터 지정한 순번째로 검색되는 문자의 위치를 반환

-- 문자열을 앞에서부터 검색하여 첫 번째 B의 위치를 조회
SELECT INSTR('AABAACAABBAA', 'B') FROM DUAL ; -- 3

-- 문자열을 5번째 문자부터 검색하여 첫번째 B의 위치를 조회
SELECT INSTR('AABAACAABBAA', 'B', 5) FROM DUAL ; -- 9

-- 문자열을 5번째 문자부터 검색하여 두번째 B의 위치를 조회
SELECT INSTR('AABAACAABBAA', 'B', 5, 2) FROM DUAL ; -- 10

-- EMPLOYEE 테이블에서 사원명, 이메일 / 이메일 중 '@(at)' 의 위치 조회
SELECT EMP_NAME, EMAIL, INSTR(EMAIL, '@') 
FROM EMPLOYEE ;

---------------------------------------------------------------------

-- SUBSTR('문자열' | 컬럼명, 잘라내기 시작할 위치 [, 잘라낼 길이]  )
-- 컬럼이나 문자열에서 지정한 위치부터 지정된 길이만큼 문자열을 잘라내서 반환
--> 잘라낼 길이 생략 시 끝까지 잘라냄


-- EMPLOYEE 테이블에서 사원명, 이메일 중 아이디만 조회

-- sun_di @ or.kr
SELECT emp_NAME 사원명, SUBSTR(EMAIL ,1, INSTR(EMAIL, '@') -1 ) 아이디 -- > @ 앞까지 출력
FROM EMPLOYEE ;

---------------------------------------------------------------------
-- TRIM( [[옵션] '문자열' | 컬럼명 FROM ]'문자열'|컬럼명  )
-- 주어진 컬럼이나 문자열의 앞, 뒤, 양쪽에 있는 지정된 문자를 제거
--> (보통 양쪽 공백 제거에 많이 사용)
-- 옵션 :  LEADING(앞쪽), TRAILING(뒤쪽), BOTH(양쪽, 기본값)

SELECT TRIM( '     H E L L O     ' )
FROM DUAL; -- 양쪽 공백 제거

SELECT TRIM(BOTH'#' FROM '#####안녕#####')
FROM DUAL;




-- ========================== 0901 2교시 ==========================
/* 숫자 관련 함수 */

-- ABS(숫자 | 컬럼명) : 절대 값
SELECT ABS(10), ABS(-10) FROM DUAL;

SELECT '절대값 같음'
FROM DUAL 
WHERE ABS(10) = ABS(-10); -- WHERE절 함수 작성 가능

-- MOD(숫자 | 컬럼명  ,  숫자 | 컬럼명) : 나머지 값 반환
-- EMPLOYEE 테이블에서 사원의 월급을 100만으로 나눴을 때 나머지 조회
SELECT EMP_NAME, SALARY, MOD(SALARY, 1000000)
FROM EMPLOYEE ;

-- EMPLOYEE 테이블에서 사번이 짝수인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE 
WHERE MOD(EMP_ID , 2) = 0;

-- EMPLOYEE 테이블에서 사번이 홀수인 사원의 사번, 이름 조회
SELECT EMP_ID, EMP_NAME
FROM EMPLOYEE 
-- WHERE MOD(EMP_ID , 2) = 1;
--WHERE MOD(EMP_ID , 2) != 0;
WHERE MOD(EMP_ID , 2) <> 0;


-- ROUND(숫자 | 컬럼명 [,소수점 위치]) : 반올림
SELECT ROUND(123.456) FROM DUAL; -- 123, 소수점 첫번째 자리에서 반올림

SELECT ROUND(123.456, 1) FROM DUAL; -- 123, 소수점 두번째 자리에서 반올림
									--> 두 번째 자리에서 반올림해서 
									-- 소수점 한자리만 표현

SELECT ROUND(123.456, 0) FROM DUAL; -- 123, 소수점 첫번째 자리에서 반올림(0이 기본값)

SELECT ROUND(123.456, -1) FROM DUAL; -- 120, 일의 자리를 반올림처리하겠다. > 10의 자리


-- CEIL(숫자 | 컬럼명) : 올림
-- FLOOR(숫자 | 컬럼명) : 내림
--> 둘다 소수점 첫째 자리에서 올림/내림 처리

SELECT CEIL(123.1), FLOOR(123.9) FROM DUAL;
--           124           123


-- TRUNC(숫자 | 컬럼명 [,위치]) : 특정 위치 아래를 버림(절삭)
SELECT TRUNC(123.456)  FROM DUAL; -- 123, 소수점 아래 버림

SELECT TRUNC(123.456, 1) FROM DUAL; -- 123.4, 소수점 첫째 자리 아래 버림

SELECT TRUNC(123.456, -1) FROM DUAL; -- 120, 10의 자리 아래 버림

/* 내림, 버림 차이점 */

SELECT FLOOR(-123.5), TRUNC(-123.5	)  FROM DUAL;

----------------------------------------------------------------------------------

/* 날짜(DATE) 관련 함수 */

-- SYSDATE : 시스템에 현재 시간(년,월,일,시,분,초)을 반환
 SELECT SYSDATE FROM DUAL;

-- SYSTIMESTAMP : SYSDATE + MS 단위 추가
SELECT SYSTIMESTAMP FROM DUAL;
-- TIMESTAMP : 특정 시간을 나타내거나 기록하기 위한 문자열

-- MONTHS_BETWEEN(날짜, 날짜) : 두 날짜의 개월 수 차이 반환
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, '2022-08-04'), 3) "수강 기간(개월)"
FROM DUAL ;

-- EMPLOYEE 테이블에서
-- 사원의 이름, 입사일, 근무한 개월 수, 근무 햇수 조회
SELECT EMP_NAME, HIRE_DATE,
CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) "근무한 개월 수",
CEIL (MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) || '년차' "근무 년차"
FROM EMPLOYEE ;


-- ADD_MONTHS(날짜 , 숫자) : 날짜에 숫자만큼의 개월 수를 더함. (음수도 가능)
SELECT ADD_MONTHS(SYSDATE, 4)  FROM DUAL;

SELECT ADD_MONTHS(SYSDATE, -4)  FROM DUAL;



-- LAST_DAY(날짜) : 해당 달의 마지막 날짜를 구함.
SELECT LAST_DAY(SYSDATE) FROM DUAL;

SELECT LAST_DAY('2022-02-01') FROM DUAL;


-- ========================== 0901 3교시 ==========================

-- EXTRACT : 년, 월, 일 정보를 추출하여 리턴
-- EXTRACT(YEAR FROM 날짜) : 년도만 추출
-- EXTRACT(MONTH FROM 날짜) : 월만 추출
-- EXTRACT(DAY FROM 날짜) : 일만 추출

-- EMPLOYEE 테이블에서
-- 각 사원의 이름, 입사년도, 월 , 일 조회

SELECT EMP_NAME, 
--	EXTRACT (YEAR FROM HIRE_DATE) 년,
--	EXTRACT (MONTH FROM HIRE_DATE) 월,
--	EXTRACT (DAY FROM HIRE_DATE) 일
--	FROM EMPLOYEE ;
	EXTRACT (YEAR FROM HIRE_DATE) || '년 ' ||
	EXTRACT (MONTH FROM HIRE_DATE) || '월 ' ||
	EXTRACT (DAY FROM HIRE_DATE) || '일' 입사일
	FROM EMPLOYEE ;


---------------------------------------------------------------------------------

/* 형변환 함수 */
-- 문자열(CHAR), 숫자(NUMBER), 날짜(DATE) 끼리 형변환 가능




/* 문자열로 변환 */
-- TO_CHAR(날짜, [포맷]) : 날짜형 데이터를 문자형 데이터로 변경
-- TO_CHAR(숫자, [포맷]) : 숫자형 데이터를 문자형 데이터로 변경

-- <숫자 변환 시 포맷 패턴>
-- 9 : 숫자 한칸을 의미, 여러 개 작성 시 오른쪽 정렬
-- 0 : 숫자 한칸을 의미, 여러 개 작성 시 오른쪽 정렬 + 빈칸 0 추가
-- L : 현재 DB에 설정된 나라의 화폐 기호

SELECT TO_CHAR(1234) FROM DUAL; -- 1,234 -> '1234'

SELECT TO_CHAR(1234, '99999')  FROM DUAL; -- 왼쪽한칸 비어져잇음 ' 1234'
SELECT TO_CHAR(1234, '00000')  FROM DUAL; -- '01234'

SELECT TO_CHAR(EXTRACT (MONTH FROM HIRE_DATE), '00' ) || '월'  -- 07월 (앞자리에 0)
FROM EMPLOYEE ;

SELECT TO_CHAR(1000000)  FROM DUAL; -- '1000000'

SELECT TO_CHAR(1000000, '9,999,999') || '원'  FROM DUAL; -- '1,000,000원'

SELECT TO_CHAR(1000000, 'L9,999,999') || '원'  FROM DUAL; -- '원화 1,000,000원'

SELECT TO_CHAR(1000000, '$9,999,999')   FROM DUAL; -- '$ 1,000,000'

-- <날짜 변환 시 포맷 패턴>
-- YYYY : 년도 / YY : 년도 (짧게)
-- RRRR : 년도 / RR : 년도 (짧게)
-- MM : 월  // DD : 일
-- AM 또는 PM : 오전/오후 표시
-- HH : 시간   /  HH24 : 24시간 표기법
-- MI : 분  /  SS : 초
-- DAY : 요일(전체)  /  DY : 요일(요일명만 표시)

SELECT SYSDATE FROM DUAL; -- 2022-09-01 11:20:50.000

-- 2022-09-01 11:20:50.000 
-- >>> 2022/09/01 11:20:50 목요일
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS DAY')  FROM DUAL;

-- 09/01 (목)
SELECT TO_CHAR(SYSDATE, 'MM/DD (DY)')  FROM DUAL;

-- 2022년 09월 01일 (목)
SELECT TO_CHAR(SYSDATE, 'YYYY"년" MM"월" DD"일" (DY)')FROM DUAL;
--  날짜 형식이 부적합ㅇ합니다.
-- 년,월,일이 날짜를 나타내는 패턴으로 인식이 안되서 오류 ㅂ라생
--> "" 쌍따옴표 이용해서 단순한 문자로 인식시키면 해결됨

SELECT TO_CHAR(SYSDATE, 'YYYY년 MM월 DD일 (DY)')FROM DUAL;
--------------------------------------------------------------------------------

/* 날짜로 변환 TO_DATE */
-- TO_DATE(문자형 데이터, [포맷]) : 문자형 데이터를 날짜로 변경
-- TO_DATE(숫자형 데이터, [포맷]) : 숫자형 데이터를 날짜로 변경
--> 지정된 포맷으로 날짜를 인식함

SELECT SYSDATE FROM DUAL;
 
SELECT TO_DATE('2022-09-02') FROM DUAL; -- 문자열로 인식 -> 날짜형으로

SELECT TO_DATE(20220902) FROM DUAL; -- 숫자열로 인식 -> 날짜형으로

SELECT TO_DATE('220901 113255') FROM DUAL;
SELECT TO_DATE('220901 113255', 'YYMMDD HH24MISS') FROM DUAL;
-- ORA-01861: 리터럴이 형식 문자열과 일치하지 않음
--> 패턴을 적용해서 작성된 문자열의 각 문자가 어떤 날짜 형식인지 인식시킴


-- EMPLOYEE 테이블에서 각 직원이 태어난 생년월일(1990년 05월 13알) 조회
SELECT EMP_NAME, 
TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1, INSTR(EMP_NO, '-') -1), 'RRMMDD' ), 'YYYY"년" MM"월" DD"일"') AS 생년월일
FROM EMPLOYEE ;

-- Y 패턴 : 현재 세기(21세기 == 20XX년 == 2000년대)
-- R 패턴 : 1세기를 기준으로 절반(50년) 이상인 경우 이전 세기(1900년대)
--                           절반(50년) 미만인 경우 이전 세기(2000년대)
SELECT TO_DATE('510505',  'YYMMDD')  FROM DUAL; -- 2051-05-05 00:00:00.000
SELECT TO_DATE('510505',  'RRMMDD')  FROM DUAL; -- 1951-05-05 00:00:00.000
---------------------------------------------------------------------------------

/* 숫자 형변환 */
-- TO_NUMBER(문자데이터, [포맷]) : 문자형데이터를 숫자 데이터로 변경



---------------------------------------------------------------------------------

/* NULL 처리 함수 */

-- NVL(컬럼명, 컬럼값이 NULL일때 바꿀 값) : NULL인 컬럼값을 다른 값으로 변경


-- NVL2(컬럼명, 바꿀값1, 바꿀값2)
-- 해당 컬럼의 값이 있으면 바꿀값1로 변경,
-- 해당 컬럼이 NULL이면 바꿀값2로 변경









-- 0901 2교시
-- 0901 3교시
-- 0901 4교시
-- 0901 5교시
-- 0901 6교시
-- 0901 7교시
-- 0901 8교시