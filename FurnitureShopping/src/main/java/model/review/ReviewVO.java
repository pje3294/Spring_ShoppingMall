package model.review;

import java.util.Date;

public class ReviewVO {
	/*
	 * create table review( revCode number(20) primary key, -- 리뷰번호 ordCode
	 * number(20) not null, -- 주문번호(FK) proCode number(20) not null, -- 상품번호(FK) id
	 * varchar2(15) not null, -- 아이디(FK) revDate date default sysdate, -- 작성날짜
	 * revText varchar2(4000) not null, -- 내용 revRating number(2,1) default 0.0, --
	 * 별점 revImg varchar2(200), -- 상품사진 constraint fk_review1 foreign key (ordCode)
	 * references ordHistory(ordCode) on delete cascade, constraint fk_review2
	 * foreign key (proCode) references product(proCode) on delete cascade,
	 * constraint fk_review3 foreign key (id) references member(id) on delete
	 * cascade );
	 */

	private int revCode;
	private int ordCode;
	private int proCode;
	private String id;
	private Date revDate;
	private String revText;
	private double revRating;
	private String revImg;

	public int getRevCode() {
		return revCode;
	}

	public void setRevCode(int revCode) {
		this.revCode = revCode;
	}

	public int getOrdCode() {
		return ordCode;
	}

	public void setOrdCode(int ordCode) {
		this.ordCode = ordCode;
	}

	public int getProCode() {
		return proCode;
	}

	public void setProCode(int proCode) {
		this.proCode = proCode;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public String getRevText() {
		return revText;
	}

	public void setRevText(String revText) {
		this.revText = revText;
	}

	public double getRevRating() {
		return revRating;
	}

	public void setRevRating(double revRating) {
		this.revRating = revRating;
	}

	public String getRevImg() {
		return revImg;
	}

	public void setRevImg(String revImg) {
		this.revImg = revImg;
	}

	@Override
	public String toString() {
		return "ReviewVO [revCode=" + revCode + ", ordCode=" + ordCode + ", proCode=" + proCode + ", id=" + id
				+ ", revDate=" + revDate + ", revText=" + revText + ", revRating=" + revRating + ", revImg=" + revImg
				+ "]";
	}

}
