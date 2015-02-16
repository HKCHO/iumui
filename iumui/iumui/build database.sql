-- 회원 유니크 인덱스
DROP INDEX UIX_members ON members;

-- 그룹 회원 유니크 인덱스
DROP INDEX UIX_gmembers ON gmembers;

-- 회원
DROP TABLE IF EXISTS members RESTRICT;

-- 모집게시판
DROP TABLE IF EXISTS iboard RESTRICT;

-- 댓글
DROP TABLE IF EXISTS bcomment RESTRICT;

-- 그룹게시판
DROP TABLE IF EXISTS gboard RESTRICT;

-- 그룹
DROP TABLE IF EXISTS ggroup RESTRICT;

-- 그룹 댓글
DROP TABLE IF EXISTS gcomment RESTRICT;

-- 그룹 회원
DROP TABLE IF EXISTS gmembers RESTRICT;

-- 그룹일정
DROP TABLE IF EXISTS gschedule RESTRICT;

-- 게시판분류
DROP TABLE IF EXISTS bmaster RESTRICT;

-- 첨부파일
DROP TABLE IF EXISTS gfile RESTRICT;

-- 참여요청
DROP TABLE IF EXISTS request RESTRICT;

-- 추천수
DROP TABLE IF EXISTS recommend RESTRICT;

-- 지역분류
DROP TABLE IF EXISTS slocal RESTRICT;

-- 회원
CREATE TABLE members (
	mno     INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	email   VARCHAR(50)  NOT NULL COMMENT '이메일', -- 이메일
	uname   VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
	pwd     VARCHAR(50)  NOT NULL COMMENT '비밀번호', -- 비밀번호
	birth   VARCHAR(50)  NOT NULL COMMENT '생년월일', -- 생년월일
	nick    VARCHAR(50)  NULL     COMMENT '별명', -- 별명
	phone   VARCHAR(50)  NOT NULL COMMENT '핸드폰', -- 핸드폰
	sex     INTEGER      NOT NULL COMMENT '성별', -- 성별
	myphoto VARCHAR(100) NULL     COMMENT '내사진', -- 내사진
	intro   VARCHAR(100) NULL     COMMENT '인사말', -- 인사말
	lcode   VARCHAR(50)  NOT NULL COMMENT '지역분류코드' -- 지역분류코드
)
COMMENT '회원';

-- 회원
ALTER TABLE members
	ADD CONSTRAINT PK_members -- 회원 기본키
		PRIMARY KEY (
			mno -- 회원번호
		);

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_members
	ON members ( -- 회원
		email ASC, -- 이메일
		phone ASC  -- 핸드폰
	);

ALTER TABLE members
	MODIFY COLUMN mno INTEGER NOT NULL AUTO_INCREMENT COMMENT '회원번호';

ALTER TABLE members
	AUTO_INCREMENT = 1;

-- 모집게시판
CREATE TABLE iboard (
	bno         INTEGER       NOT NULL COMMENT '게시글번호', -- 게시글번호
	bmno        INTEGER       NOT NULL COMMENT '게시판구분번호', -- 게시판구분번호
	mno         INTEGER       NOT NULL COMMENT '회원번호', -- 회원번호
	bname       VARCHAR(50)   NOT NULL COMMENT '모임이름', -- 모임이름
	bintro      VARCHAR(1000) NOT NULL COMMENT '모임소개', -- 모임소개
	btarget_num INTEGER       NOT NULL COMMENT '모임인원', -- 모임인원
	start_date  DATE          NOT NULL COMMENT '모집일자', -- 모집일자
	end_date    DATE          NOT NULL COMMENT '종료일자', -- 종료일자
	reg_date    DATE          NOT NULL COMMENT '등록일자', -- 등록일자
	click_count INTEGER       NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
	lcode       VARCHAR(50)   NOT NULL COMMENT '지역분류코드' -- 지역분류코드
)
COMMENT '모집게시판';

-- 모집게시판
ALTER TABLE iboard
	ADD CONSTRAINT PK_iboard -- 모집게시판 기본키
		PRIMARY KEY (
			bno -- 게시글번호
		);

ALTER TABLE iboard
	MODIFY COLUMN bno INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시글번호';

ALTER TABLE iboard
	AUTO_INCREMENT = 1;

-- 댓글
CREATE TABLE bcomment (
	bcno    INTEGER      NOT NULL COMMENT '댓글번호', -- 댓글번호
	bno     INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
	mno     INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
	content VARCHAR(500) NOT NULL COMMENT '댓글내용', -- 댓글내용
	redate  DATE         NOT NULL COMMENT '작성일' -- 작성일
)
COMMENT '댓글';

-- 댓글
ALTER TABLE bcomment
	ADD CONSTRAINT PK_bcomment -- 댓글 기본키
		PRIMARY KEY (
			bcno -- 댓글번호
		);

ALTER TABLE bcomment
	MODIFY COLUMN bcno INTEGER NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

-- 그룹게시판
CREATE TABLE gboard (
	gbno        INTEGER      NOT NULL COMMENT '그룹게시글번호', -- 그룹게시글번호
	grouping_no INTEGER      NOT NULL COMMENT '그룹회원번호', -- 그룹회원번호
	gbcontent   VARCHAR(500) NOT NULL COMMENT '게시글내용', -- 게시글내용
	reg_date    DATE         NOT NULL COMMENT '작성시간' -- 작성시간
)
COMMENT '그룹게시판';

-- 그룹게시판
ALTER TABLE gboard
	ADD CONSTRAINT PK_gboard -- 그룹게시판 기본키
		PRIMARY KEY (
			gbno -- 그룹게시글번호
		);

ALTER TABLE gboard
	MODIFY COLUMN gbno INTEGER NOT NULL AUTO_INCREMENT COMMENT '그룹게시글번호';

-- 그룹
CREATE TABLE ggroup (
	gno       INTEGER      NOT NULL COMMENT '그룹번호', -- 그룹번호
	gname     VARCHAR(50)  NOT NULL COMMENT '모임이름', -- 모임이름
	gintro    VARCHAR(110) NOT NULL COMMENT '모임소개', -- 모임소개
	gend_date DATE         NOT NULL COMMENT '종료일자' -- 종료일자
)
COMMENT '그룹';

-- 그룹
ALTER TABLE ggroup
	ADD CONSTRAINT PK_ggroup -- 그룹 기본키
		PRIMARY KEY (
			gno -- 그룹번호
		);

ALTER TABLE ggroup
	MODIFY COLUMN gno INTEGER NOT NULL AUTO_INCREMENT COMMENT '그룹번호';

ALTER TABLE ggroup
	AUTO_INCREMENT = 1;

-- 그룹 댓글
CREATE TABLE gcomment (
	gbcno       INTEGER      NOT NULL COMMENT '그룹댓글번호', -- 그룹댓글번호
	gbno        INTEGER      NOT NULL COMMENT '그룹게시글번호', -- 그룹게시글번호
	grouping_no INTEGER      NOT NULL COMMENT '그룹회원번호', -- 그룹회원번호
	content     VARCHAR(500) NOT NULL COMMENT '그룹게시판댓글내용', -- 그룹게시판댓글내용
	reg_date    DATE         NOT NULL COMMENT '그룹게시판댓글작성시간' -- 그룹게시판댓글작성시간
)
COMMENT '그룹 댓글';

-- 그룹 댓글
ALTER TABLE gcomment
	ADD CONSTRAINT PK_gcomment -- 그룹 댓글 기본키
		PRIMARY KEY (
			gbcno -- 그룹댓글번호
		);

ALTER TABLE gcomment
	MODIFY COLUMN gbcno INTEGER NOT NULL AUTO_INCREMENT COMMENT '그룹댓글번호';

-- 그룹 회원
CREATE TABLE gmembers (
	grouping_no    INTEGER     NOT NULL COMMENT '그룹회원번호', -- 그룹회원번호
	gno            INTEGER     NOT NULL COMMENT '그룹번호', -- 그룹번호
	mno            INTEGER     NOT NULL COMMENT '회원번호', -- 회원번호
	manager_status INTEGER     NOT NULL COMMENT '등급', -- 등급
	color          VARCHAR(50) NULL     COMMENT '색상' -- 색상
)
COMMENT '그룹 회원';

-- 그룹 회원
ALTER TABLE gmembers
	ADD CONSTRAINT PK_gmembers -- 그룹 회원 기본키
		PRIMARY KEY (
			grouping_no -- 그룹회원번호
		);

-- 그룹 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_gmembers
	ON gmembers ( -- 그룹 회원
		gno ASC, -- 그룹번호
		mno ASC  -- 회원번호
	);

ALTER TABLE gmembers
	MODIFY COLUMN grouping_no INTEGER NOT NULL AUTO_INCREMENT COMMENT '그룹회원번호';

-- 그룹일정
CREATE TABLE gschedule (
	calendarno INTEGER      NOT NULL COMMENT '일정번호', -- 일정번호
	gno        INTEGER      NOT NULL COMMENT '그룹번호', -- 그룹번호
	cdate      DATE         NOT NULL COMMENT '날짜', -- 날짜
	cschedule  VARCHAR(500) NOT NULL COMMENT '내용' -- 내용
)
COMMENT '그룹일정';

-- 그룹일정
ALTER TABLE gschedule
	ADD CONSTRAINT PK_gschedule -- 그룹일정 기본키
		PRIMARY KEY (
			calendarno -- 일정번호
		);

ALTER TABLE gschedule
	MODIFY COLUMN calendarno INTEGER NOT NULL AUTO_INCREMENT COMMENT '일정번호';

ALTER TABLE gschedule
	AUTO_INCREMENT = 1;

-- 게시판분류
CREATE TABLE bmaster (
	bmno      INTEGER     NOT NULL COMMENT '게시판구분번호', -- 게시판구분번호
	bcategory VARCHAR(50) NOT NULL COMMENT '분류명' -- 분류명
)
COMMENT '게시판분류';

-- 게시판분류
ALTER TABLE bmaster
	ADD CONSTRAINT PK_bmaster -- 게시판분류 기본키
		PRIMARY KEY (
			bmno -- 게시판구분번호
		);

ALTER TABLE bmaster
	MODIFY COLUMN bmno INTEGER NOT NULL AUTO_INCREMENT COMMENT '게시판구분번호';

ALTER TABLE bmaster
	AUTO_INCREMENT = 1;

-- 첨부파일
CREATE TABLE gfile (
	gfno      INTEGER      NOT NULL COMMENT '파일번호', -- 파일번호
	gbno      INTEGER      NOT NULL COMMENT '그룹게시글번호', -- 그룹게시글번호
	gfname    VARCHAR(50)  NOT NULL COMMENT '파일경로', -- 파일경로
	gfiletime VARCHAR(100) NOT NULL COMMENT '업로드시간' -- 업로드시간
)
COMMENT '첨부파일';

-- 첨부파일
ALTER TABLE gfile
	ADD CONSTRAINT PK_gfile -- 첨부파일 기본키
		PRIMARY KEY (
			gfno -- 파일번호
		);

ALTER TABLE gfile
	MODIFY COLUMN gfno INTEGER NOT NULL AUTO_INCREMENT COMMENT '파일번호';

-- 참여요청
CREATE TABLE request (
	bno      INTEGER NOT NULL COMMENT '게시글번호', -- 게시글번호
	mno      INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	state    INTEGER NOT NULL COMMENT '상태', -- 상태
	req_date DATE    NOT NULL COMMENT '요청일' -- 요청일
)
COMMENT '참여요청';

-- 참여요청
ALTER TABLE request
	ADD CONSTRAINT PK_request -- 참여요청 기본키
		PRIMARY KEY (
			bno, -- 게시글번호
			mno  -- 회원번호
		);

-- 추천수
CREATE TABLE recommend (
	bno       INTEGER NOT NULL COMMENT '게시글번호', -- 게시글번호
	mno       INTEGER NOT NULL COMMENT '회원번호', -- 회원번호
	recomtime DATE    NOT NULL COMMENT '추천시간' -- 추천시간
)
COMMENT '추천수';

-- 추천수
ALTER TABLE recommend
	ADD CONSTRAINT PK_recommend -- 추천수 기본키
		PRIMARY KEY (
			bno, -- 게시글번호
			mno  -- 회원번호
		);

-- 지역분류
CREATE TABLE slocal (
	lcode VARCHAR(50) NOT NULL COMMENT '지역분류코드', -- 지역분류코드
	lname VARCHAR(50) NULL     COMMENT '분류명' -- 분류명
)
COMMENT '지역분류';

-- 지역분류
ALTER TABLE slocal
	ADD CONSTRAINT PK_slocal -- 지역분류 기본키
		PRIMARY KEY (
			lcode -- 지역분류코드
		);