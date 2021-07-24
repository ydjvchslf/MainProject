DROP TABLE complain;
DROP TABLE complain_reason;
DROP TABLE review;
DROP TABLE board_file;
DROP TABLE recommend;
DROP TABLE comments;
DROP TABLE board;
DROP TABLE pick_edu;
DROP TABLE purchase_edu;
DROP TABLE edu;
DROP TABLE multimedia;
DROP TABLE connection;
DROP TABLE academy;
DROP TABLE users;

DROP SEQUENCE seq_users_user_no;
DROP SEQUENCE seq_connection_connection_no;
DROP SEQUENCE seq_multimedia_multimedia_no;
DROP SEQUENCE seq_edu_edu_no;
DROP SEQUENCE seq_pick_edu_pick_no;
DROP SEQUENCE board_board_no;
DROP SEQUENCE comments_comment_no;
DROP SEQUENCE recommend_recommend_no;
DROP SEQUENCE board_file_board_file_no;
DROP SEQUENCE seq_review_review_no;
DROP SEQUENCE seq_complain_complain_no;


CREATE SEQUENCE seq_users_user_no 						INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_connection_connection_no  	        INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_multimedia_multimedia_no  	        INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_edu_edu_no 						    INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_pick_edu_pick_no					INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE board_board_no 							INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE comments_comment_no				        INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE recommend_recommend_no			        INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE board_file_board_file_no				INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_review_review_no 				    INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_complain_complain_no 			    INCREMENT BY 1 START WITH 100;
CREATE SEQUENCE seq_purchase_edu_pay_no                 INCREMENT BY 1 START WITH 100;



CREATE TABLE users ( 
   user_no 			NUMBER 				NOT NULL,
   role 			VARCHAR2(10) 		NOT NULL,
   email 			VARCHAR2(40)		NOT NULL,
   password	 		VARCHAR2(30) 		NOT NULL,
   name 			VARCHAR2(20) 		NOT NULL,
   phone 			VARCHAR2(15) 		NOT NULL,
   account_state 	VARCHAR2(1) 		DEFAULT '0',
   in_date 			DATE 				DEFAULT SYSDATE,
   out_date 		DATE,
   PRIMARY KEY(user_no)
 );
 
 CREATE TABLE academy ( 
   academy_code        VARCHAR2(10)     	 NOT NULL,
   user_no             NUMBER(10)            NOT NULL   		REFERENCES users(user_no),
   academy_name		   VARCHAR2(30),
   academy_addr		   VARCHAR2(50),
   academy_lat         VARCHAR2(25),
   academy_lng         VARCHAR2(25),
   academy_area        VARCHAR2(25),
   academy_phone       VARCHAR2(15),
   academy_history     VARCHAR2(500)		 DEFAULT '학원 실적을 입력해 주세요.',
   academy_intro       VARCHAR2(500)		 DEFAULT '학원 소개를 입력해 주세요.',
   PRIMARY KEY(academy_code)
);

 CREATE TABLE connection ( 
   connection_no 		NUMBER 				NOT NULL,
   user_no      		NUMBER 				NOT NULL 		REFERENCES users(user_no),
   academy_code 		VARCHAR2(10) 		NOT NULL 		REFERENCES academy(academy_code),
   connect_state 		VARCHAR2(1)   		DEFAULT 'n',
   PRIMARY KEY(connection_no)
);

CREATE TABLE multimedia ( 
   multimedia_no 			NUMBER              NOT NULL,
   academy_code             VARCHAR2(10)        NOT NULL            references academy(academy_code),
   academy_multimedia 	    VARCHAR2(30)        NOT NULL,
   media_role   			CHAR(1)             NOT NULL,
   PRIMARY KEY(multimedia_no)
);
 
CREATE TABLE edu (
   edu_no 				   	NUMBER 				NOT NULL,
   edu_academy_code 		VARCHAR2(20) 		NOT NULL 			REFERENCES academy(academy_code),
   edu_user_no 				NUMBER 				NOT NULL            REFERENCES users(user_no),
   edu_day 					VARCHAR2(100) 		NOT NULL,
   edu_name 				VARCHAR2(50) 		NOT NULL,
   edu_price 				NUMBER 				NOT NULL,
   edu_teacher 				VARCHAR2(100) 		NOT NULL,
   edu_member 				NUMBER 				NOT NULL,
   edu_intro 				VARCHAR2(200),
   edu_start_date 			VARCHAR2(40)		DEFAULT SYSDATE,
   edu_end_date 			VARCHAR2(40) 		DEFAULT SYSDATE,
   edu_start_time 			VARCHAR2(40) 		NOT NULL,
   edu_end_time 			VARCHAR2(40) 		NOT NULL,
   edu_rest 				NUMBER 				NOT NULL,
   edu_state 				CHAR(1) 			DEFAULT '0',
   edu_grade 				VARCHAR2(20) 		NOT NULL,
   edu_subject 				VARCHAR2(20) 		NOT NULL,
   edu_date                 DATE                DEFAULT SYSDATE,
   PRIMARY KEY(edu_no)
 );
 
 CREATE TABLE purchase_edu (
   purchase_uid 		VARCHAR2(100) 		    NOT NULL,
   purchase_user_no 	NUMBER 					NOT NULL		REFERENCES users(user_no),
   purchase_edu_no 	    NUMBER 					NOT NULL      	REFERENCES edu(edu_no),
   pay_date 			DATE 					DEFAULT 	    SYSDATE,
   pay_state 			CHAR(1) 			    DEFAULT '0',
   pay_no               NUMBER,
   purchase_aca_code    VARCHAR2(20)            NOT NULL        REFERENCES academy(academy_code),
   PRIMARY KEY(purchase_uid)
 );
 
 CREATE TABLE pick_edu (
   pick_no 			NUMBER 		NOT NULL,
   pick_user_no 	NUMBER		NOT NULL 		REFERENCES users(user_no),
   pick_edu_no 		NUMBER 		NOT NULL 		REFERENCES edu(edu_no),
   PRIMARY KEY(pick_no)
 );
 
CREATE TABLE board(
   board_no 			NUMBER 				NOT NULL,
   board_title 			VARCHAR2(60) 		NOT NULL,
   board_content 		VARCHAR2(1000),
   board_writer 		NUMBER 				NOT NULL  				REFERENCES users(user_no),
   board_date 			DATE 				DEFAULT SYSDATE,
   board_state 			CHAR(1) 			DEFAULT '0',
   category_code 		CHAR(1) 			NOT NULL,
   view_count 			NUMBER 				DEFAULT 0,
   PRIMARY KEY(board_no)
 );
 
 CREATE TABLE comments (
   comment_no 			NUMBER 				NOT NULL,
   comment_content 	    VARCHAR2(100) 	    NOT NULL,
   comment_writer 		NUMBER 				NOT NULL  		       REFERENCES users(user_no),
   comment_date 		DATE 				DEFAULT SYSDATE,
   comment_state 		CHAR(1) 			DEFAULT '0',
   board_no 			NUMBER 				NOT NULL  		       REFERENCES board(board_no),
   commentCnt           NUMBER              DEFAULT 0,
   PRIMARY KEY(comment_no)
 ); 
 
CREATE TABLE recommend (
   recommend_no   	NUMBER NOT NULL,
   recommender 		NUMBER NOT NULL  		REFERENCES users(user_no),
   board_no 		NUMBER NOT NULL  		REFERENCES board(board_no),
   PRIMARY KEY(recommend_no)
 ); 
 
 CREATE TABLE board_file(
   board_file_no 		NUMBER 				NOT NULL,
   board_image 		    VARCHAR2(100) 	    NOT NULL,
   board_no 			NUMBER 			    NOT NULL  	REFERENCES board(board_no),
   PRIMARY KEY(board_file_no) 
 );
 
CREATE TABLE review (
   review_no 	        NUMBER 				NOT NULL,
   academy_code 	    VARCHAR2(10) 		NOT NULL 		REFERENCES academy(academy_code),
   reivew_state 		CHAR(1) 			DEFAULT '0',
   review_writer		NUMBER 				NOT NULL,
   review_title 		VARCHAR2(20) 		NOT NULL,
   review_date 		    DATE 				NOT NULL,
   review_content 	    VARCHAR2(100) 	    NOT NULL,
   PRIMARY KEY(review_no)
 );

CREATE TABLE complain_reason (
   complain_reason_code 		CHAR(1) 	    DEFAULT '0',
   complain_reason_name 	    VARCHAR2(20) 	NOT NULL,
   PRIMARY KEY(complain_reason_code)
 );
 
 CREATE TABLE complain (
   complain_no 				 NUMBER		    NOT NULL,
   board_no 				 NUMBER 		NOT NULL 		REFERENCES board(board_no),
   comment_no 				 NUMBER 		NOT NULL 		REFERENCES comments(comment_no),
   reivew_no 				 NUMBER 		NOT NULL 		REFERENCES review(review_no),
   complain_user_no 		 NUMBER 		NOT NULL 		REFERENCES users(user_no),
   complain_reason_code      CHAR(1) 	    DEFAULT '0' 	REFERENCES complain_reason(complain_reason_code),
   complain_sort 			 CHAR(1) 	    NOT NULL,
   PRIMARY KEY(complain_no)
 );
 
 
