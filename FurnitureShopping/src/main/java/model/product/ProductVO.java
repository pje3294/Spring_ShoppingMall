package model.product;

import java.util.Date;

public class ProductVO {
	/*
	 * create table product( proCode number(20) primary key, -- 상품번호 proCate
	 * varchar2(30) not null, -- 상품 카테고리 proName varchar2(100) not null, -- 상품명
	 * proPrice number(10) not null, -- 상품가격 proStock number(5) not null, -- 상품재고
	 * proDate date default sysdate, -- 상품등록일 proRating number(2,1) default 0.0, --
	 * 평점 proKC varchar2(30) not null, -- KC인증 proColor varchar2(200) not null, --
	 * 색상 proCmpt varchar2(200) not null, -- 구성품 proMtrl varchar2(200) not null, --
	 * 주요소재 proMnfct varchar2(200) not null, -- 제조자(수입자) proNation varchar2(100) not
	 * null, -- 제조국 proSize varchar2(200) not null, -- 크기 proFee number(5) not null,
	 * -- 배송,설치비용 proCerti varchar2(100) not null, -- 품질보증기준 proAS varchar2(100) not
	 * null, -- A/S 책임자와 전화번호 proImg1 varchar2(200) default 'nonImg.png', -- 상품 이미지1
	 * proImg2 varchar2(200)default 'nonImg.png', -- 상품 이미지2 proImg3 varchar2(200)
	 * default 'nonImg.png', -- 상품 이미지3 proSelling number(20) default 0
	 */

	private int proCode;
	private String proCate;
	private String proName;
	private int proPrice;
	private int proStock;
	private Date proDate;
	private double proRating;
	private String proKC;
	private String proColor;
	private String proCmpt;
	private String proMtrl;
	private String proMnfct;
	private String proNation;
	private String proSize;
	private int proFee;
	private String proCerti;
	private String proAS;
	private String proImg1;
	private String proImg2;
	private String proImg3;
	private int proSelling;

	private String condition; // 검색 기능 위해
	private String keyword; // 검색 기능 위해

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public String getProCate() {
		return proCate;
	}

	public void setProCate(String proCate) {
		this.proCate = proCate;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProStock() {
		return proStock;
	}

	public void setProStock(int proStock) {
		this.proStock = proStock;
	}

	public Date getProDate() {
		return proDate;
	}

	public void setProDate(Date proDate) {
		this.proDate = proDate;
	}

	public double getProRating() {
		return proRating;
	}

	public void setProRating(double proRating) {
		this.proRating = proRating;
	}

	public String getProKC() {
		return proKC;
	}

	public void setProKC(String proKC) {
		this.proKC = proKC;
	}

	public String getProColor() {
		return proColor;
	}

	public void setProColor(String proColor) {
		this.proColor = proColor;
	}

	public String getProCmpt() {
		return proCmpt;
	}

	public void setProCmpt(String proCmpt) {
		this.proCmpt = proCmpt;
	}

	public String getProMtrl() {
		return proMtrl;
	}

	public void setProMtrl(String proMtrl) {
		this.proMtrl = proMtrl;
	}

	public String getProMnfct() {
		return proMnfct;
	}

	public void setProMnfct(String proMnfct) {
		this.proMnfct = proMnfct;
	}

	public String getProNation() {
		return proNation;
	}

	public void setProNation(String proNation) {
		this.proNation = proNation;
	}

	public String getProSize() {
		return proSize;
	}

	public void setProSize(String proSize) {
		this.proSize = proSize;
	}

	public int getProFee() {
		return proFee;
	}

	public void setProFee(int proFee) {
		this.proFee = proFee;
	}

	public String getProCerti() {
		return proCerti;
	}

	public void setProCerti(String proCerti) {
		this.proCerti = proCerti;
	}

	public String getProAS() {
		return proAS;
	}

	public void setProAS(String proAS) {
		this.proAS = proAS;
	}

	public String getProImg1() {
		return proImg1;
	}

	public void setProImg1(String proImg1) {
		this.proImg1 = proImg1;
	}

	public String getProImg2() {
		return proImg2;
	}

	public void setProImg2(String proImg2) {
		this.proImg2 = proImg2;
	}

	public String getProImg3() {
		return proImg3;
	}

	public void setProImg3(String proImg3) {
		this.proImg3 = proImg3;
	}

	public int getProSelling() {
		return proSelling;
	}

	public void setProSelling(int proSelling) {
		this.proSelling = proSelling;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "ProductVO [proCode=" + proCode + ", proCate=" + proCate + ", proName=" + proName + ", proPrice="
				+ proPrice + ", proStock=" + proStock + ", proDate=" + proDate + ", proRating=" + proRating + ", proKC="
				+ proKC + ", proColor=" + proColor + ", proCmpt=" + proCmpt + ", proMtrl=" + proMtrl + ", proMnfct="
				+ proMnfct + ", proNation=" + proNation + ", proSize=" + proSize + ", proFee=" + proFee + ", proCerti="
				+ proCerti + ", proAS=" + proAS + ", proImg1=" + proImg1 + ", proImg2=" + proImg2 + ", proImg3="
				+ proImg3 + ", proSelling=" + proSelling + ", condition=" + condition + ", keyword=" + keyword + "]";
	}

	

}
