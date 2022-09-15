-- 0915 6교시

/*
 	DCL(Data Control Language) : = 데이터를 다루기 위한 권한을 다루는 언어
 		- 계정의 DB, DB객체에 대한 접근 권한을 부여(GRANT)하고 회수(REVOKE)하는 언어
 		
 	* 권한의 종류

	1) 시스템 권한 : DB접속, 객체 생성 권한
	
	CRETAE SESSION   : 데이터베이스 접속 권한
	CREATE TABLE     : 테이블 생성 권한
	CREATE VIEW      : 뷰 생성 권한
	CREATE SEQUENCE  : 시퀀스 생성 권한
	CREATE PROCEDURE : 함수(프로시져) 생성 권한
	CREATE USER      : 사용자(계정) 생성 권한
	DROP USER        : 사용자(계정) 삭제 권한
	DROP ANY TABLE   : 임의 테이블 삭제 권한
	
	
	2) 객체 권한 : 특정 객체를 조작할 수 있는 권한
	
	  권한 종류                 설정 객체
	    SELECT              TABLE, VIEW, SEQUENCE
	    INSERT              TABLE, VIEW
	    UPDATE              TABLE, VIEW
	    DELETE              TABLE, VIEW
	    ALTER               TABLE, SEQUENCE
	    REFERENCES          TABLE
	    INDEX               TABLE
	    EXECUTE             PROCEDURE
 		
 
 */
	/* USER - 계정(사용자) ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★

* 관리자 계정 : 데이터베이스의 생성과 관리를 담당하는 계정.
                모든 권한과 책임을 가지는 계정.
                ex) sys(최고관리자), system(sys에서 권한 몇개 제외된 관리자)


* 사용자 계정 : 데이터베이스에 대하여 질의, 갱신, 보고서 작성 등의
                작업을 수행할 수 있는 계정으로
                업무에 필요한 최소한의 권한만을 가지는 것을 원칙으로 한다.
                ex) bdh계정(각자 이니셜 계정), workbook 등
*/

-- 1. (SYS) 사용자 계정 생성
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;
--> 예전 SQL방식 허용 (계정명을 간단히 작성 가능)

-- [작성법]
-- CREATE USER 사용자명 IDENTIFIED BY 비밀번호;
CREATE USER kjh_sample IDENTIFIED BY sample1234;

-- 2. 새 연결(접속방법) 추가
--> ORA-01045 : CREATE SESSION 권한이없어서 로그인 실패
				--> 접속 권한

-- 3. (SYS) 접속 권한 부여

-- [권한 부여 작성법]
-- GRANT 권한, 권한, ... TO 사용자명;
GRANT CREATE SESSION TO kjh_sample;

-- 4. 다시 연결(접속 방법 추가) -> 성공

-- 5. (sample) 테이블 생성
CREATE TABLE TB_TEST(
	PK_COL NUMBER PRIMARY KEY,
	CONTENT VARCHAR2(100)
);
-- ORA-01031: 권한이 불충분합니다
--> CREATE TABLE : 테이블 생성 권한
--> 데이터를 저장할 수 있는 공간(TABLESPACE) 할당

-- 6. (SYS) 테이블 생성 권한 + TABLESPACE 할당
GRANT CREATE TABLE TO kjh_sample;

ALTER USER kjh_sample DEFAULT TABLESPACE  
SYSTEM QUOTA UNLIMITED ON SYSTEM;

-- 7. (sample) 테이블 생성
CREATE TABLE TB_TEST(
	PK_COL NUMBER PRIMARY KEY,
	CONTENT VARCHAR2(100)
);






















