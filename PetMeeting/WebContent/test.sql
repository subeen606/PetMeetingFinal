/*-----  test ----- */
SELECT * FROM PM_MEMBER WHERE EMAIL='wow@wow.com';

SELECT * FROM PM_MYPROFILE WHERE EMAIL='www';

INSERT INTO PM_MYPROFILE(EMAIL, MYPROFILE_IMG, MYAGE, MYSEX, MYINTRO) 
VALUES((SELECT EMAIL FROM PM_MEMBER WHERE EMAIL='www'), NULL, NULL, NULL, '등록된 소개가 없습니다')

SELECT * FROM PM_MEMBER WHERE EMAIL='321';

SELECT * FROM PM_CHECK_MYPROFILE WHERE EMAIL='www';
SELECT * FROM PM_CHECK_PETPROFILE WHERE EMAIL='www';
SELECT * FROM PM_CHECK_LOGIN WHERE EMAIL='www';

SELECT * FROM PM_LEAVEMEMBER WHERE EMAIL='aaa';
SELECT * FROM PM_PETPROFILE;
SELECT * FROM PM_MYPROFILE;

 

SELECT *  from PM_SENDMSG
WHERE FROM_EMAIL='want2play@naver.com'

DELETE FROM PM_CHECK_LOGIN WHERE EMAIL='jinyj714@naver.com';
DELETE FROM PM_CHECK_PETPROFILE WHERE EMAIL='jinyj714@naver.com';
DELETE FROM PM_CHECK_MYPROFILE WHERE EMAIL='jinyj714@naver.com';
DELETE FROM PM_PETPROFILE WHERE EMAIL='jinyj714@naver.com';
DELETE FROM PM_MYPROFILE WHERE EMAIL='jinyj714@naver.com';

DELETE FROM PM_MEMBER WHERE EMAIL='jinyj714@naver.com';
DELETE FROM PM_SENDMSG WHERE TO_EMAIL='jinyj714@naver.com';
INSERT INTO PM_CHECK_LOGIN(SEQ, EMAIL, LDATE)
VALUES(PM_CHECK_LOGIN_SEQ.NEXTVAL, 'qqq', SYSDATE);


UPDATE PM_MEMBER
SET
TOTALPOINT = 0,
POINT = 0
WHERE EMAIL='jinyj714@naver.com';

SELECT EMAIL, PWD, NICKNAME, NAME, POSTCODE, ADDRESS, ADDRESS_DETAIL, ADDRESS_REFER, PHONE, TOTALPOINT, POINT, S_POINT, REPORTCOUNT, AUTH 
FROM PM_MEMBER
WHERE EMAIL='jinyj714@naver.com';
SELECT * FROM PM_SENDMSG
SELECT *
FROM PM_CHECK_LOGIN
WHERE EMAIL='qqq' AND TO_CHAR( LDATE, 'YYYY-MM-DD' )='2019-09-30';

--------주의
DELETE FROM PM_MEMBER WHERE EMAIL='1172399805'
DELETE FROM PM_MYPROFILE WHERE EMAIL='1172399805'
DELETE FROM PM_CHECK_LOGIN WHERE EMAIL='321'

--포인트 증가 (증가할값 , email)
UPDATE PM_MEMBER
SET POINT= POINT+300
WHERE EMAIL='qqq';

--총 포인트증가(email)-감소는 시키지않는다
UPDATE PM_MEMBER
SET TOTALPOINT= (SELECT SUM(TOTALPOINT+POINT)
                FROM PM_MEMBER
                WHERE EMAIL='qqq')
WHERE EMAIL='qqq'



--포인트감소(증가값, email)
/*-----  test ----- */
UPDATE PM_MEMBER
SET POINT= POINT-300
WHERE EMAIL='qqq' AND POINT >= 0 AND (POINT-300)>=0;

                
-- 포인트별 등급 4단계
INSERT INTO PM_GRADE(GRADE_NAME, MIN_POINT, MAX_POINT, FILENAME) 
VALUES('new', 1, 999, 'level_new.png')

INSERT INTO PM_GRADE(GRADE_NAME, MIN_POINT, MAX_POINT, FILENAME) 
VALUES('family', 1000, 4999, 'level_family.png')

INSERT INTO PM_GRADE(GRADE_NAME, MIN_POINT, MAX_POINT, FILENAME) 
VALUES('vip', 5000, 9999, 'level_vip.png')

INSERT INTO PM_GRADE(GRADE_NAME, MIN_POINT, MAX_POINT, FILENAME) 
VALUES('vvip', 10000, 99999, 'level_vvip.png')



--유저의 등급명, filename 구하기(유저의 TOTALPOINT 필요)
SELECT GRADE_NAME, FILENAME
FROM PM_GRADE
WHERE 
(SELECT TOTALPOINT FROM PM_MEMBER WHERE EMAIL='qqq') BETWEEN MIN_POINT AND MAX_POINT



DROP TABLE PM_POINT_HISTORY
CASCADE CONSTRAINTS;

DROP SEQUENCE PM_POINT_HISTORY_SEQ;

CREATE TABLE PM_POINT_HISTORY(
	SEQ NUMBER PRIMARY KEY,
	EMAIL VARCHAR2(50), --유저이메일
	USEDINFO VARCHAR2(50),	--적립/사용 내용(후원, 출석이벤트, 프로필등록, 펫프로필등록)
	USEPOINT NUMBER,	--적립/사용 포인트
	RESULTPOINT NUMBER,	--적립/사용 결과 잔여포인트
	REGDATE DATE,	--변동기록일자(연월일)
	USEDTYPE NUMBER	--적립 0 , 사용 1
);

CREATE SEQUENCE PM_POINT_HISTORY_SEQ
START WITH 1
INCREMENT BY 1;

SELECT NVL(COUNT(*),0) FROM PM_POINT_HISTORY
WHERE EMAIL='321'

SELECT RNUM, EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE
FROM (SELECT ROW_NUMBER()OVER(ORDER BY REGDATE DESC) AS RNUM, EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE
		FROM PM_POINT_HISTORY
			WHERE EMAIL='321'
				ORDER BY REGDATE DESC)
WHERE RNUM BETWEEN 1 AND 10







--포인트 업데이트 경우 계속 insert해야함
		
INSERT INTO PM_POINT_HISTORY(EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE) 
VALUES('321', '출석포인트', 300,(SELECT POINT FROM PM_MEMBER WHERE EMAIL='321'), SYSDATE, 0);

INSERT INTO PM_POINT_HISTORY(EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE) 
VALUES('321', '프로필등록포인트', 1000,(SELECT POINT FROM PM_MEMBER WHERE EMAIL='321'), SYSDATE, 0);

INSERT INTO PM_POINT_HISTORY(EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE) 
VALUES('321', '펫등록포인트', 1000,(SELECT POINT FROM PM_MEMBER WHERE EMAIL='321'),

-- 후원결제 하고 결제내역 저장시 결제한 포인트만큼 point-usedpoint 한 값을 저장후 실행되어야함
INSERT INTO PM_POINT_HISTORY(EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE) 
VALUES('email들어가야해오', '포인트타이틀', 결제에사용한포인트, (SELECT POINT FROM PM_MEMBER WHERE EMAIL='email들어가야해오'), SYSDATE, 1);

-- 유저의 전체 포인트사용내역을 최신순으로 뽑기(페이징 같이 진행되어야함..)
SELECT ROW_NUMBER()OVER(ORDER BY REGDATE DESC) AS RNUM, EMAIL, USEDINFO, USEPOINT, RESULTPOINT, REGDATE, USEDTYPE
FROM PM_POINT_HISTORY
WHERE EMAIL='jinyj714@naver.com'

<!-- 전체 게시글 수 -->





 



		
DELETE FROM PM_POINT_HISTORY WHERE EMAIL='ww'

SELECT * FROM PM_POINT_HISTORY WHERE EMAIL='www';









-- 최근 날짜 순서로
-- USEDTYPE

-- NO	사용내역		적립포인트		사용포인트		잔여포인트		날짜
-- 1	후원						500P		1000P		2019-10-16
-- 2	출석포인트		1500P					1500P		2019-10-16
-- 3	

-- RNUM() 사용해서가져와야. 마지막 순번의 RESULTPOINT = USEPOINT 
/*
<c:for >

</c:for>

for(){
	
}
if(list[0].usedtype == 0 ) { [i].sdfsdf = [i+1].sdfsdfdf .....
	list[0].resultpoint = list[1].resultpoint - list[0].usepoint
}
if(list[0].usedtype == 1 ) {
	list[0].resultpoint = list[1].resultpoint + list[0].usepoint
}
*/




















