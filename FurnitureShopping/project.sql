select * from all_tables;

drop table member cascade constraint;
drop table product cascade constraint;
drop table ordHistory cascade constraint;
drop table review cascade constraint;

select * from member; -- jeong / 1234
select * from product;
select * from ordHistory;
------------------------------------------------------------------
-- Member 테이블 
create table member(
id varchar2(15) primary key, -- 아이디
name varchar2(20) not null, -- 이름
password varchar2(30) not null, -- 비밀번호
email varchar2(30) not null, -- 이메일
phone varchar2(11) not null, -- 전화번호
pCode varchar2(6) not null, -- 우편번호
addr varchar2(100) not null, -- 주소
etcAddr varchar2(100) not null, -- 상세주소 
admin varchar2(1) default 'N', -- 계정권한
birth varchar2(10) not null, -- 생년월일
profile varchar2(200) default 'images\\member\\default.png'
);

-------------------------------------------------------------------
-- Product 테이블 
create table product(
proCode number(20) primary key, -- 상품번호 (nvl)
proCate varchar2(30) not null, -- 상품 카테고리
proSubCate varchar2(30) null, -- 하위 카테고리
proName varchar2(225) not null, -- 상품명
proPrice number(10) not null, -- 상품가격
proStock number(5) default 0, -- 상품재고
proDate date default sysdate, -- 상품등록일
proRating number(2,1) default 0.0, -- 평점
proKC varchar2(30) not null, -- KC인증
proColor varchar2(225) not null, -- 색상
proCmpt varchar2(225) not null, -- 구성품 
proMtrl varchar2(225) not null, -- 주요소재
proMnfct varchar2(225) not null, -- 제조자(수입자)
proNation varchar2(100) not null, -- 제조국
proSize varchar2(225) not null, -- 크기
proFee number(5) not null, -- 배송,설치비용
proCerti varchar2(225) not null, -- 품질보증기준
proAS varchar2(225) not null, -- A/S 책임자와 전화번호
proImg varchar2(225) default 'images\\product\\nonImg.png', -- 상품 이미지1
proSelling number(20) default 0 -- 판매수
);

-------------------------------------------------------------------
-- OrdHistory 테이블 
create table ordHistory(
ordCode number(20) primary key, -- 주문번호
proCode number(20) not null, -- 상품번호 (FK)
proName varchar2(100) not null, -- 상품명
id varchar2(15) not null, -- 아이디 (FK)
amount number(5) not null, -- 수량
payment number(10) not null, -- 총 주문가격
pCode varchar2(6) not null, -- 배송지(우편번호)
addr varchar2(100) not null, -- 배송지 주소
etcAddr varchar2(100) not null, -- 배송지(상새주소)
recName varchar2(20) not null, -- 수취인 이름
recPhone varchar2(11) not null, -- 수취인 전화번호
orderDate date default sysdate, -- 주문날짜
memo varchar2(250), -- 배송요청사항
revYN varchar2(5) default 'N', -- 리뷰작성여부
constraint fk_ordHistory1 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_ordHistory2 foreign key (id) references member(id) on delete cascade
);

-------------------------------------------------------------------
-- Review 테이블 
create table review(
revCode number(20) primary key, -- 리뷰번호
ordCode number(20) not null, -- 주문번호(FK)
proCode number(20) not null, -- 상품번호(FK)
id varchar2(15) not null, -- 아이디(FK)
revDate date default sysdate, -- 작성날짜
revText varchar2(4000) not null, -- 내용
revRating number(2,1) default 0.0, -- 별점
revImg varchar2(200), -- 상품사진
constraint fk_review1 foreign key (ordCode) references ordHistory(ordCode) on delete cascade,
constraint fk_review2 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_review3 foreign key (id) references member(id) on delete cascade
);



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Member 데이터 삽입
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('jeong','박정은','1234','pje3294@naver.com','01012341234','14100','경기도 안양시 동안구','ㅇㅇㅇㅇㅇㅇ','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('abcabc','박정은','abc','pje3294@naver.com','01012341234','14100','경기도 안양시 동안구','ㅇㅇㅇㅇㅇㅇ','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth, admin) values('admin','관리자','admin','admin@naver.com','01012341234','1000','경기도 ','ㅇㅇㅇㅇㅇㅇ','19960927', 'Y');



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Product 데이터 삽입																																			(proCode,parentCate, childCate, proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','가',1000,10,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','sitting','라',1000,5,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','나',200000,7,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');

insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','a',5000,3,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','g',9000,5,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','라면',76000,5,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','햄버거',143000,1,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','폰',132000,100,'해당없음','브라운','구성품','주요소재','제조사','제조국','가로150x세로100x높이50',3000,'별나라','03133333');


-- best sellers (메인페이지에 보여줄)
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proSelling DESC;




-- 의자 카테고리 > (+ 최신순)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '의자' and proName LIKE '%%' ORDER BY proDate DESC) product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proDate DESC;



-- 의자 카테고리 >  (+ 가격순)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '의자' and proName LIKE '%%' ORDER BY proPrice, proDate DESC) product WHERE ROWNUM <= 3) WHERE RNUM > 0 ORDER BY proPrice DESC;



select * from member where id='jeong' and password='1234';

-- ------------------------
-- product update 
select * from product order by proDate desc;


select * from product where proCode=10;

update product set proStock= proStock -1 where proCode=16;

select * from product where proname like 'ㄷ' order by proDate desc;





delete from PRODUCT where procode = 10;



SELECT * FROM (select * from product where proCate='의자' and proSubCate='인테리어' order by proDate desc) ORDER BY proDate DESC;


SELECT * FROM(select * from product where proCate='스툴' order by proDate desc)ORDER BY proDate DESC;
