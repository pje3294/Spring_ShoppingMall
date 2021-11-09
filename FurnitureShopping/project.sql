select * from all_tables;

drop table member cascade constraint;
drop table product cascade constraint;
drop table ordHistory cascade constraint;
drop table review cascade constraint;

select * from member; -- jeong / 1234
select * from product;
select * from ordHistory;
------------------------------------------------------------------
-- Member ���̺� 
create table member(
id varchar2(15) primary key, -- ���̵�
name varchar2(20) not null, -- �̸�
password varchar2(30) not null, -- ��й�ȣ
email varchar2(30) not null, -- �̸���
phone varchar2(11) not null, -- ��ȭ��ȣ
pCode varchar2(6) not null, -- �����ȣ
addr varchar2(100) not null, -- �ּ�
etcAddr varchar2(100) not null, -- ���ּ� 
admin varchar2(1) default 'N', -- ��������
birth varchar2(10) not null, -- �������
profile varchar2(200) default 'images\\member\\default.png'
);

-------------------------------------------------------------------
-- Product ���̺� 
create table product(
proCode number(20) primary key, -- ��ǰ��ȣ (nvl)
proCate varchar2(30) not null, -- ��ǰ ī�װ�
proSubCate varchar2(30) null, -- ���� ī�װ�
proName varchar2(225) not null, -- ��ǰ��
proPrice number(10) not null, -- ��ǰ����
proStock number(5) default 0, -- ��ǰ���
proDate date default sysdate, -- ��ǰ�����
proRating number(2,1) default 0.0, -- ����
proKC varchar2(30) not null, -- KC����
proColor varchar2(225) not null, -- ����
proCmpt varchar2(225) not null, -- ����ǰ 
proMtrl varchar2(225) not null, -- �ֿ����
proMnfct varchar2(225) not null, -- ������(������)
proNation varchar2(100) not null, -- ������
proSize varchar2(225) not null, -- ũ��
proFee number(5) not null, -- ���,��ġ���
proCerti varchar2(225) not null, -- ǰ����������
proAS varchar2(225) not null, -- A/S å���ڿ� ��ȭ��ȣ
proImg varchar2(225) default 'images\\product\\nonImg.png', -- ��ǰ �̹���1
proSelling number(20) default 0 -- �Ǹż�
);

-------------------------------------------------------------------
-- OrdHistory ���̺� 
create table ordHistory(
ordCode number(20) primary key, -- �ֹ���ȣ
proCode number(20) not null, -- ��ǰ��ȣ (FK)
proName varchar2(100) not null, -- ��ǰ��
id varchar2(15) not null, -- ���̵� (FK)
amount number(5) not null, -- ����
payment number(10) not null, -- �� �ֹ�����
pCode varchar2(6) not null, -- �����(�����ȣ)
addr varchar2(100) not null, -- ����� �ּ�
etcAddr varchar2(100) not null, -- �����(����ּ�)
recName varchar2(20) not null, -- ������ �̸�
recPhone varchar2(11) not null, -- ������ ��ȭ��ȣ
orderDate date default sysdate, -- �ֹ���¥
memo varchar2(250), -- ��ۿ�û����
revYN varchar2(5) default 'N', -- �����ۼ�����
constraint fk_ordHistory1 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_ordHistory2 foreign key (id) references member(id) on delete cascade
);

-------------------------------------------------------------------
-- Review ���̺� 
create table review(
revCode number(20) primary key, -- �����ȣ
ordCode number(20) not null, -- �ֹ���ȣ(FK)
proCode number(20) not null, -- ��ǰ��ȣ(FK)
id varchar2(15) not null, -- ���̵�(FK)
revDate date default sysdate, -- �ۼ���¥
revText varchar2(4000) not null, -- ����
revRating number(2,1) default 0.0, -- ����
revImg varchar2(200), -- ��ǰ����
constraint fk_review1 foreign key (ordCode) references ordHistory(ordCode) on delete cascade,
constraint fk_review2 foreign key (proCode) references product(proCode) on delete cascade,
constraint fk_review3 foreign key (id) references member(id) on delete cascade
);



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Member ������ ����
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('jeong','������','1234','pje3294@naver.com','01012341234','14100','��⵵ �Ⱦ�� ���ȱ�','������������','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values('abcabc','������','abc','pje3294@naver.com','01012341234','14100','��⵵ �Ⱦ�� ���ȱ�','������������','19960927');
insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth, admin) values('admin','������','admin','admin@naver.com','01012341234','1000','��⵵ ','������������','19960927', 'Y');



-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- Product ������ ����																																			(proCode,parentCate, childCate, proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','��',1000,10,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','sitting','��',1000,5,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proSubCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'chair','interior','��',200000,7,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');

insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','a',5000,3,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','g',9000,5,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'stool','���',76000,5,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','�ܹ���',143000,1,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');
insert into product (proCode,proCate,proName,proPrice,proStock,proKC,proColor,proCmpt,proMtrl,proMnfct,proNation,proSize,proFee,proCerti,proAS) values((SELECT NVL(MAX(proCode), 0)+1 FROM product),'sofa','��',132000,100,'�ش����','����','����ǰ','�ֿ����','������','������','����150x����100x����50',3000,'������','03133333');


-- best sellers (������������ ������)
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proSelling DESC;




-- ���� ī�װ� > (+ �ֽż�)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '����' and proName LIKE '%%' ORDER BY proDate DESC) product WHERE ROWNUM <= 2) WHERE RNUM > 0 ORDER BY proDate DESC;



-- ���� ī�װ� >  (+ ���ݼ�)																								'%'||?||'%'
SELECT * FROM (select ROWNUM AS RNUM, product.* FROM (SELECT * FROM product WHERE proCate = '����' and proName LIKE '%%' ORDER BY proPrice, proDate DESC) product WHERE ROWNUM <= 3) WHERE RNUM > 0 ORDER BY proPrice DESC;



select * from member where id='jeong' and password='1234';

-- ------------------------
-- product update 
select * from product order by proDate desc;


select * from product where proCode=10;

update product set proStock= proStock -1 where proCode=16;

select * from product where proname like '��' order by proDate desc;





delete from PRODUCT where procode = 10;



SELECT * FROM (select * from product where proCate='����' and proSubCate='���׸���' order by proDate desc) ORDER BY proDate DESC;


SELECT * FROM(select * from product where proCate='����' order by proDate desc)ORDER BY proDate DESC;
