-- DDL (Data Definition Language)
-- 객체를 만들고(CREATE), 바꾸고(ALTER), 삭제(DROP)하는 데이터 정의 언어

/* ALTER(바꾸다, 수정하다, 변조하다)

- 테이블에서 수정할 수 있는 것
1) 제약 조건(추가/삭제)
2) 컬럼(추가/수정/삭제)
3) 이름 변경(테이블명, 제약조건명, 컬럼명)
*/

----------------------------------------------------------------

-- 1. 제약 조건(추가/삭제)

-- [작성법]
-- 1) 추가 : ALTER TABLE 테이블명
--           ADD [CONSTRAINT 제약조건명] 제약조건(지정할 컬럼명)
--			[REFERENCES 테이블명[(컬럼명)]; --< FK인 경우 추가

--2) 삭제 : ALTER TABLE 테이블명
-- 		    DROP CONSTRAINT 제약조건명;

-- *  수정은 별도 존재하지 않음 ! -> 삭제 후 추가해서 수정해야함

-- DEPARTMENT 테이블 복사(컬럼명, 데이터타입, NOT NULL만 복사)
CREATE TABLE DEPT_COPY
AS SELECT * FROM DEPARTMENT ;

SELECT  * FROM DEPT_COPY;

-- DEPT_COPY의 DEPT_TITLE 컬럼에 UNIQUE 추가
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DEPT_COPY_TLTLE_U UNIQUE(DEPT_TITLE);
-- DEPT_COPY의 DEPT_TITLE 컬럼에 UNIQUE 삭제
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DEPT_COPY_TLTLE_U;


-- ** DEPT_COPY의 DEPT_TITLE컬럼에 NOT NULL 제약조건 추가
ALTER TABLE DEPT_COPY 
ADD CONSTRAINT DEPT_COPY_TITLE_NN NOT NULL(DEPT_TITLE);
--> NOT NULL제약조건은 새로운 조건을 추가하는것이 아닌
--> 컬럼자체에 NULL 허용/비허용을 제어하는 성질의 변경의 형태로 인식됨.

-- MODIFY(수정하다) 구문을 사용해서 NULL 제어
ALTER TABLE DEPT_COPY 
MODIFY DEPT_TITLE NOT NULL; -- DEPT_TITLE 컬럼을 NOT NULL로 수정;

ALTER TABLE DEPT_COPY 
MODIFY DEPT_TITLE NULL;


-----------------------------------------------------------------------------
-- 09 15 2교시

-- 2. 컬럼(추가/수정/삭제)

-- 컬럼 추가
-- ALTER TABLE 테이블명 ADD(컬럼명 데이터 타입지정 [ DEFAULT '값']);


-- 컬럼 수정
-- ALTER TABLE 테이블명 MODIFY 컬럼명 데이터타입; -> 데이터타입만 변경

-- ALTER TABLE 테이블명 MODIFY 컬럼명 DEFAULT '값'; -> DEFAULT 값 변경

-- ALTER TABLE 테이블명 MODIFY 컬럼명 NULL // NOT NULL; -> NULL 여부 변경


-- 컬럼 삭제

-- ALTER TABLE 테이블명 DROP (삭제할 컬럼명);
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할 컬럼명;

--> * 컬럼 삭제 시 주의사항! *
-- 테이블이란? 행과 열로 이루어진 DB의 가장 기본적인 객체
-- 			   테이블에 데이터가 저장됨.

-- 테이블은 최소 1개 이상의 컬럼이 존재해야 되기 때문에 
-- 모든 컬럼을 삭제할 순 없다.

SELECT * FROM DEPT_COPY;

-- CNAME 컬럼 추가
ALTER TABLE DEPT_COPY ADD(CNAME VARCHAR2(30));


-- LNAME 컬럼 추가(기본값 '한국')
ALTER TABLE DEPT_COPY ADD(LNAME VARCHAR2(30) DEFAULT '한국');
--> 컬럼이 생성되면서 DEFAULT 값이 자동 삽입됨.

-- D10 개발1팀 추가
INSERT INTO DEPT_COPY 
VALUES('D10', '개발1팀', 'L1' , DEFAULT, DEFAULT);

-- DEPT_ID 컬럼 수정
ALTER TABLE DEPT_COPY MODIFY DEPT_ID VARCHAR2(3);
--> 다시 위 INSERT 실행 -> 성공

-- LNAME의 기본값을 'KOREA'로 수정
ALTER TABLE DEPT_COPY MODIFY LNAME DEFAULT 'KOREA';
SELECT * FROM DEPT_COPY ;
-- > 기본 값을 변경했다고 해서 기존 데이터가 변하지는 않음

-- LNAME '한국' -> 'KOREA'로 변경
UPDATE DEPT_COPY SET
LNAME = DEFAULT 
WHERE LNAME = '한국';

SELECT * FROM DEPT_COPY ;
COMMIT;

-- 모든 컬럼 삭제
ALTER TABLE DEPT_COPY DROP(LNAME);
ALTER TABLE DEPT_COPY DROP COLUMN CNAME;
ALTER TABLE DEPT_COPY DROP(LOCATION_ID);
ALTER TABLE DEPT_COPY DROP(DEPT_TITLE);
ALTER TABLE DEPT_COPY DROP(DEPT_ID);

-- 테이블 삭제
DROP TABLE DEPT_COPY ;

-- DEPARTMENT 테이블 복사해서 DEPT_COPY 생성하기

CREATE TABLE DEPT_COPY 
AS SELECT * FROM DEPARTMENT;
--> 컬럼명, 데이터타입, NOT NULL 여부만 복사됨 (제약조건은 XX)

-- DEPT_COPY 테이블에 PK 추가(컬럼 : DEPT_ID, 제약조건명 : D_COPY_PK)
ALTER TABLE DEPT_COPY ADD CONSTRAINT D_COPY_PK PRIMARY KEY(DEPT_ID);



-- 3. 이름  변경(컬럼, 제약조건 , 테이블)

--1) 컬럼명 변경 (DEPT_TITLE -> DEPT_NAME)
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;
SELECT * FROM DEPT_COPY ;

-- 2) 제약조건명 변경(D_COPY_PK -> DEPT_COPY_PK)
ALTER TABLE DEPT_COPY RENAME CONSTRAINT D_COPY_PK TO DEPT_COPY_PK;

-- 3) 테이블명 변경(DEPT_COPLY -> DCPOY)
ALTER TABLE DEPT_COPY RENAME TO DCOPY;
--             여기까진 고정

SELECT * FROM DEPT_COPY; --> 오류
SELECT * FROM DCOPY ;




















