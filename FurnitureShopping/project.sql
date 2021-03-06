select * from all_tables;

drop table member cascade constraint;
drop table product cascade constraint;
drop table ordHistory cascade constraint;
drop table review cascade constraint;

select * from member; -- jeong / 1234
select * from product;
select * from ordHistory;
------------------------------------------------------------------
-- Member 砺戚鷺 
create table member(
id varchar2(15) primary key, -- 焼戚巨
name varchar2(20) not null, -- 戚硯
password varchar2(30) not null, -- 搾腔腰硲
email varchar2(30) not null, -- 戚五析
phone varchar2(11) not null, -- 穿鉢腰硲
pCode varchar2(6) not null, -- 酔畷腰硲
addr varchar2(100) not null, -- 爽社
etcAddr varchar2(100) not null, -- 雌室爽社 
admin varchar2(1) default 'N', -- 域舛映廃
birth varchar2(10) not null, -- 持鰍杉析
profile varchar2(200) default 'images\\member\\default.png'
);

-------------------------------------------------------------------
-- Product 砺戚鷺 
create table product(
proCode number(20) primary key, -- 雌念腰硲 (nvl)
proCate varchar2(30) not null, -- 雌念 朝砺壱軒
proSubCate varchar2(30) null, -- 馬是 朝砺壱軒
proName varchar2(225) not null, -- 雌念誤
proPrice number(10) not null, -- 雌念亜維
proStock number(5) default 0, -- 雌念仙壱
proDate date default sysdate, -- 雌念去系析
proRating number(2,1) default 0.0, -- 汝繊
proKC varchar2(30) not null, -- KC昔装
proColor varchar2(225) not null, -- 事雌
proCmpt varchar2(225) not null, -- 姥失念 
proMtrl varchar2(225) not null, -- 爽推社仙
proMnfct varchar2(225) not null, -- 薦繕切(呪脊切)
proNation varchar2(100) not null, -- 薦繕厩
proSize varchar2(225) not null, -- 滴奄
proFee number(5) not null, -- 壕勺,竺帖搾遂
proCerti varchar2(225) not null, -- 念霜左装奄層
proAS varchar2(225) not null, -- A/S 奪績切人 穿鉢腰硲
proImg varchar2(225) default 'images\\product\\nonImg.png', -- 雌念 戚耕走1
proSelling number(20) default 0 -- 毒古呪
);

-------------------------------------------------------------------
-- OrdHistory 砺戚鷺 
create table ordHistory(
ordCode number(20) primary key, -- 爽庚腰硲
proCode number(20) not null, -- 雌念腰硲 (FK)
proName varchar2(100) not null, -- 雌念誤
id varchar2(15) not null, -- 焼戚巨 (FK)
amount number(5) not null, -- 呪勲
payment number(10) not null, -- 恥 爽庚亜維
pCode varchar2(6) not null, -- 壕勺走(酔畷腰硲)
addr varchar2(100) not null, -- 壕勺走 爽社
etcAddr varchar2(100) not null, -- 壕勺走(雌歯爽社)
recName varchar2(20) not null, -- 呪昼昔 戚硯
recPhone varchar2(11) not null, -- 呪昼昔 穿鉢腰硲
orderDate date default sysdate, -- 爽庚劾促
memo varchar2(250), -- 壕勺推短紫牌
revYN varchar2(5) default 'N', -- 軒坂拙失食採
constraint fk_ordHistory1 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_ordHistory2 foreign key (id) references member(id) on delete cascade
);

-------------------------------------------------------------------
-- Review 砺戚鷺 
create table review(
revCode number(20) primary key, -- 軒坂腰硲
ordCode number(20) not null, -- 爽庚腰硲(FK)
proCode number(20) not null, -- 雌念腰硲(FK)
id varchar2(15) not null, -- 焼戚巨(FK)
revDate date default sysdate, -- 拙失劾促
revText varchar2(4000) not null, -- 鎧遂
revRating number(2,1) default 0.0, -- 紺繊
revImg varchar2(200), -- 雌念紫遭
constraint fk_review1 foreign key (ordCode) references ordHistory(ordCode) on delete cascade,
constraint fk_review2 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_review3 foreign key (id) references member(id) on delete cascade
);



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Member 汽戚斗 諮脊
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('jeong','酵舛精','1234','pje3294@naver.com','01012341234','14100','井奄亀 照丞獣 疑照姥','しししししし','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('abcabc','酵舛精','abc','pje3294@naver.com','01012341234','14100','井奄亀 照丞獣 疑照姥','しししししし','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth, admin) values('admin','淫軒切','admin','admin@naver.com','01012341234','1000','井奄亀 ','しししししし','19960927', 'Y');



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Product 汽戚斗 諮脊																																			(proCode,parentCate, childCate, proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','亜',1000,10,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','sitting','虞',1000,5,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','蟹',200000,7,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');

insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','a',5000,3,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','g',9000,5,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','虞檎',76000,5,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','倍獄暗',143000,1,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','肉',132000,100,'背雁蒸製','崎虞錘','姥失念','爽推社仙','薦繕紫','薦繕厩','亜稽150x室稽100x株戚50',3000,'紺蟹虞','03133333');


-- best sellers (五昔凪戚走拭 左食匝)
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proSelling DESC;




-- 税切 朝砺壱軒 > (+ 置重授)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '税切' and proName LIKE '%%' ORDER BY proDate DESC) product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proDate DESC;



-- 税切 朝砺壱軒 >  (+ 亜維授)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '税切' and proName LIKE '%%' ORDER BY proPrice, proDate DESC) product WHERE ROWNUM <= 3) WHERE RNUM > 0 ORDER BY proPrice DESC;



select * from member where id='jeong' and password='1234';

-- ------------------------
-- product update 
select * from product order by proDate desc;


select * from product where proCode=10;

update product set proStock= proStock -1 where proCode=16;

select * from product where proname like 'ぇ' order by proDate desc;





delete from PRODUCT where procode = 10;



SELECT * FROM (select * from product where proCate='税切' and proSubCate='昔砺軒嬢' order by proDate desc) ORDER BY proDate DESC;


SELECT * FROM(select * from product where proCate='什祷' order by proDate desc)ORDER BY proDate DESC;
