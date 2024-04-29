CREATE TABLE "MEMBER" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"MEMBER_EMAIL"	NVARCHAR2(50)		NOT NULL,
	"MEMBER_PW"	NVARCHAR2(100)		NOT NULL,
	"MEMBER_NICKNAME"	NVARCHAR2(10)		NOT NULL,
	"MEMBER_TEL"	CHAR(11)		NOT NULL,
	"PROFILE_IMG"	VARCHAR2(300)		NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"MEMBER_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"AUTHORITY"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "MEMBER"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "MEMBER"."MEMBER_EMAIL" IS '회원 이메일(ID 역할)';

COMMENT ON COLUMN "MEMBER"."MEMBER_PW" IS '회원 비밀번호(암호화)';

COMMENT ON COLUMN "MEMBER"."MEMBER_NICKNAME" IS '회원 닉네임';

COMMENT ON COLUMN "MEMBER"."MEMBER_TEL" IS '회원 전화번호';

COMMENT ON COLUMN "MEMBER"."PROFILE_IMG" IS '프로필 이미지';

COMMENT ON COLUMN "MEMBER"."ENROLL_DATE" IS '화원 가입일';

COMMENT ON COLUMN "MEMBER"."MEMBER_DEL_FL" IS '탈퇴 여부(Y,N)';

COMMENT ON COLUMN "MEMBER"."AUTHORITY" IS '권한(1:일반, 2:관리자)';

CREATE TABLE "ADOPT" (
	"ADOPT_NO"	NUMBER		NOT NULL,
	"ADOPT_TITLE"	NVARCHAR2(100)		NOT NULL,
	"ADOPT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ADOPT_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ADOPT_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"ADOPT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"THUMNAIL"	VARCHAR2(500)		NOT NULL,
	"ADOPT_NAME"	NVARCHAR2(10)		NOT NULL,
	"ADOPT_AGE"	NUMBER		NOT NULL,
	"ADOPT_TYPE"	NVARCHAR2(20)		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ADOPT"."ADOPT_NO" IS '게시글 번호(PK)';

COMMENT ON COLUMN "ADOPT"."ADOPT_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "ADOPT"."ADOPT_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "ADOPT"."ADOPT_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "ADOPT"."ADOPT_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "ADOPT"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "ADOPT"."ADOPT_DEL_FL" IS '게시글 삭제 여부(Y,N)';

COMMENT ON COLUMN "ADOPT"."THUMNAIL" IS '썸네일 경로';

COMMENT ON COLUMN "ADOPT"."ADOPT_NAME" IS '입양 동물 이름';

COMMENT ON COLUMN "ADOPT"."ADOPT_AGE" IS '입양 동물 나이';

COMMENT ON COLUMN "ADOPT"."ADOPT_TYPE" IS '입양 동물 종';

COMMENT ON COLUMN "ADOPT"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "ADOPT"."BOARD_CODE" IS '게시판 종류 코드 번호';

CREATE TABLE "BOARD_TYPE" (
	"BOARD_CODE"	NUMBER		NOT NULL,
	"BOARD_NAME"	NVARCHAR2(20)		NOT NULL
);

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_CODE" IS '게시판 종류 코드 번호';

COMMENT ON COLUMN "BOARD_TYPE"."BOARD_NAME" IS '게시판명';

CREATE TABLE "BOOKMARK" (
	"MEMBER_NO"	NUMBER		NOT NULL,
	"ADOPT_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOOKMARK"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "BOOKMARK"."ADOPT_NO" IS '게시글 번호(PK)';

CREATE TABLE "COMMENT" (
	"COMMENT_NO"	NUMBER		NOT NULL,
	"COMMENT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"COMMENT_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"REVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "COMMENT"."COMMENT_NO" IS '댓글 번호(PK)';

COMMENT ON COLUMN "COMMENT"."COMMENT_CONTENT" IS '댓글 내용';

COMMENT ON COLUMN "COMMENT"."COMMENT_DEL_FL" IS '댓글 삭제 여부(Y/N)';

COMMENT ON COLUMN "COMMENT"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "COMMENT"."REVIEW_NO" IS '게시글 번호(PK)';

CREATE TABLE "UPLOAD_FILE" (
	"FILE_NO"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(500)		NOT NULL,
	"FILE_ORIGINAL_NAME"	VARCHAR2(300)		NOT NULL,
	"FILE_RENAME"	VARCHAR2(100)		NOT NULL,
	"FILE_UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"ADOPT_NO"	NUMBER		NOT NULL,
	"REVIEW_NO"	NUMBER		NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_NO" IS '파일 번호 (PK)';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_PATH" IS '파일 요청 경로';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_ORIGINAL_NAME" IS '파일 원본명';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_RENAME" IS '파일 변경명';

COMMENT ON COLUMN "UPLOAD_FILE"."FILE_UPLOAD_DATE" IS '업로드 날짜';

COMMENT ON COLUMN "UPLOAD_FILE"."ADOPT_NO" IS '입양 게시글 번호(PK)';

COMMENT ON COLUMN "UPLOAD_FILE"."REVIEW_NO" IS '후기 게시글 번호(PK)';

COMMENT ON COLUMN "UPLOAD_FILE"."MEMBER_NO" IS '회원 번호';

CREATE TABLE "REVIEW" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_TITLE"	NVARCHAR2(100)		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REVIEW_WRITE_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REVIEW_UPDATE_DATE"	DATE		NULL,
	"READ_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"REVIEW_DEL_FL"	CHAR(1)	DEFAULT 'N'	NOT NULL,
	"MEMBER_NO"	NUMBER		NOT NULL,
	"BOARD_CODE"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REVIEW"."REVIEW_NO" IS '게시글 번호(PK)';

COMMENT ON COLUMN "REVIEW"."REVIEW_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_WRITE_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "REVIEW"."REVIEW_UPDATE_DATE" IS '게시글 마지막 수정일';

COMMENT ON COLUMN "REVIEW"."READ_COUNT" IS '조회수';

COMMENT ON COLUMN "REVIEW"."REVIEW_DEL_FL" IS '게시글 삭제 여부(Y,N)';

COMMENT ON COLUMN "REVIEW"."MEMBER_NO" IS '회원 번호';

COMMENT ON COLUMN "REVIEW"."BOARD_CODE" IS '게시판 종류 코드 번호';

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEMBER_NO"
);

ALTER TABLE "ADOPT" ADD CONSTRAINT "PK_ADOPT" PRIMARY KEY (
	"ADOPT_NO"
);

ALTER TABLE "BOARD_TYPE" ADD CONSTRAINT "PK_BOARD_TYPE" PRIMARY KEY (
	"BOARD_CODE"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "PK_BOOKMARK" PRIMARY KEY (
	"MEMBER_NO",
	"ADOPT_NO"
);

ALTER TABLE "COMMENT" ADD CONSTRAINT "PK_COMMENT" PRIMARY KEY (
	"COMMENT_NO"
);

ALTER TABLE "UPLOAD_FILE" ADD CONSTRAINT "PK_UPLOAD_FILE" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "FK_MEMBER_TO_BOOKMARK_1" FOREIGN KEY (
	"MEMBER_NO"
)
REFERENCES "MEMBER" (
	"MEMBER_NO"
);

ALTER TABLE "BOOKMARK" ADD CONSTRAINT "FK_ADOPT_TO_BOOKMARK_1" FOREIGN KEY (
	"ADOPT_NO"
)
REFERENCES "ADOPT" (
	"ADOPT_NO"
);

-----------------------------------------------------------------------------------------------------
-- ADOPT 테이블 입양완료 여부 컬럼 추가
ALTER TABLE "ADOPT" ADD(ADOPT_COMPL CHAR(1) DEFAULT 'N');

-------------------------------------------------------------------------------------------------------------
-- check 제약 조건은 따로 만들어야 함

-- 입양 게시글 삭제 여부
ALTER TABLE "ADOPT" ADD
CONSTRAINT "ADOPT_DEL_FL"
CHECK("ADOPT_DEL_FL" IN ('Y', 'N'));

-- 입양 완료 여부
ALTER TABLE "ADOPT" ADD
CONSTRAINT "ADOPT_COMPL"
CHECK("ADOPT_COMPL" IN ('Y', 'N'));


-- 회원 탈퇴 여부
ALTER TABLE "MEMBER" ADD
CONSTRAINT "MEMBER_DEL_FL"
CHECK("MEMBER_DEL_FL" IN ('Y', 'N'));

-- 후기 게시글 삭제 여부
ALTER TABLE "REVIEW" ADD
CONSTRAINT "REVIEW_DEL_FL"
CHECK("REVIEW_DEL_FL" IN ('Y', 'N'));

-- 댓글 삭제 여부
ALTER TABLE "COMMENT" ADD
CONSTRAINT "COMMENT_DEL_FL"
CHECK("COMMENT_DEL_FL" IN ('Y', 'N'));

--BOOKMARK 테이블 북마크 체크 여부 컬럼 추가
ALTER TABLE "BOOKMARK" ADD(BOOKMARK_CHECK CHAR(1) DEFAULT 'N');

-- 게시글 북마크 여부
ALTER TABLE "BOOKMARK" ADD
CONSTRAINT "BOOKMARK_CHECK"
CHECK("BOOKMARK_CHECK" IN ('Y', 'N'));

----------------------------------------------------------------------------------------------------------------

/* 샘플 데이터 삽입 */

-- 회원 번호 시퀀스 만들기 
CREATE SEQUENCE SEQ_MEMBER_NO NOCACHE;
-------------------------------------------------------------------------------
-- 샘플 회원 데이터 삽입
INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL, 
                'member01@kh.or.kr', 
                'pass1234!',
	              '샘플회원', 
	              '01012341234',
	               NULL, DEFAULT, DEFAULT, DEFAULT);
	              
INSERT INTO "MEMBER" VALUES(SEQ_MEMBER_NO.NEXTVAL, 
                'member02@kh.or.kr', 
                '$2a$10$ISM4.feknchN.mS1qnxtYeB68Hv8/zIQNfTsXFc6Kw..OIolj8vX6',
	              '샘플회원2', 
	              '01036901234',
	               NULL, DEFAULT, DEFAULT, DEFAULT);
	              
-- 샘플 회원 데이터 업데이트
-- 비밀번호 암호화된 걸로 바꿈!	                
UPDATE "MEMBER" SET MEMBER_PW ='$2a$10$pe0hHmf2e2nzZjn90dOAQ.ovfwp9FhonLmS9CWtBtuV.yDMBf.3u6'
WHERE MEMBER_NO  = 1; --1행 수정됨

SELECT * FROM "MEMBER";         
-----------------------------------------------------------------------

/* 게시판 종류(BOARD_TYPE) 테이블 추가 */ 

CREATE SEQUENCE SEQ_BOARD_CODE NOCACHE;

INSERT INTO "BOARD_TYPE" VALUES(SEQ_BOARD_CODE.NEXTVAL, '입양 게시판');
INSERT INTO "BOARD_TYPE" VALUES(SEQ_BOARD_CODE.NEXTVAL, '후기 게시판');

-------------------------------------------------------------------

-- 후기 게시글 번호 시퀀스 생성
CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;


/* 게시판 (BOARD) 테이블 샘플 데이터 삽입(PL/SQL) */ 

		-- DBMS_RANDOM.VALUE(0,3): 0.0 이상, 3.0 미만의 난수 /  CEIL(): 올림처리

SELECT * FROM MEMBER;  -- 조회해서 정상 로그인, 탈퇴안된 회원 번호를 아래에 작성회원 컬럼값으로 넣고 실행.

-- ALT + X 로 실행
BEGIN
	FOR I IN 1..10 LOOP
		
		INSERT INTO "REVIEW"
		VALUES(SEQ_REVIEW_NO.NEXTVAL,
					 SEQ_REVIEW_NO.CURRVAL || '번째 게시글',
					 SEQ_REVIEW_NO.CURRVAL || '번째 게시글 내용 입니다',
					 DEFAULT, DEFAULT, DEFAULT, DEFAULT,
					 1,
					 2
		);
		
	END LOOP;
END;

SELECT * FROM REVIEW;

------------------------------------------------------------

-- 입양 게시글 번호 시퀀스 생성
CREATE SEQUENCE SEQ_ADOPT_NO NOCACHE;


/* 게시판 (BOARD) 테이블 샘플 데이터 삽입(PL/SQL) */ 

		-- DBMS_RANDOM.VALUE(0,3): 0.0 이상, 3.0 미만의 난수 /  CEIL(): 올림처리

SELECT * FROM MEMBER;  -- 조회해서 정상 로그인, 탈퇴안된 회원 번호를 아래에 작성회원 컬럼값으로 넣고 실행.

-- ALT + X 로 실행
BEGIN
	FOR I IN 1..10 LOOP
		
		INSERT INTO "ADOPT"
		VALUES(SEQ_ADOPT_NO.NEXTVAL,
					 SEQ_ADOPT_NO.CURRVAL || '번째 게시글',
					 SEQ_ADOPT_NO.CURRVAL || '번째 게시글 내용 입니다',
					 DEFAULT, DEFAULT, DEFAULT, DEFAULT, DEFAULT, '입양 동물 이름', 5, '입양 동물 종',
					 1,
					 1,
					 DEFAULT
		);
		
	END LOOP;
END;

SELECT * FROM REVIEW;



------------------------------
-- 후기게시판 게시글 작성

INSERT INTO "REVIEW"
VALUES(SEQ_REVIEW_NO.NEXTVAL, '게시글 테스트', '게시글 내용',
			 DEFAULT, DEFAULT, DEFAULT, DEFAULT, 2, 2);




