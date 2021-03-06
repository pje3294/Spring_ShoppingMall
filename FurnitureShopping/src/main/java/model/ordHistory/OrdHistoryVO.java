package model.ordHistory;

import java.util.Date;

public class OrdHistoryVO {
	/*
	 * create table ordHistory( ordCode number(20) primary key, -- 주문번호 proCode
	 * number(20) not null, -- 상품번호 (FK) id varchar2(15) not null, -- 아이디 (FK)
	 * amount number(5) not null, -- 수량 total number(20) not null, -- 총 주문가격 pCode
	 * varchar2(6) not null, -- 배송지(우편번호) addr varchar2(100) not null, -- 배송지 주소
	 * etcAddr varchar2(100) not null, -- 배송지(상새주소) recName varchar2(20) not null,
	 * -- 수취인 이름 recPhone varchar2(11) not null, -- 수취인 전화번호 orderDate date default
	 * sysdate, -- 주문날짜 memo varchar2(250), -- 배송요청사항 revYN varchar2(5) default 'N',
	 * -- 리뷰작성여부 constraint fk_ordHistory1 foreign key (proCode) references
	 * product(proCode) on delete cascade, constraint fk_ordHistory2 foreign key
	 * (id) references member(id) on delete cascade );
	 */

	private int ordCode;
	private int proCode;
	private String proName;
	private String id;
	private int amount;
	private int payment; // 배송비 + 상품가격
	private String pCode;
	private String addr;
	private String etcAddr;
	private String recName;
	private String recPhone;
	private Date orderDate;
	private String memo;
	private String revYN;
	private String proImg; // 실제 저장은 안되는 변수 장바구니 위해서
	private int proPrice; // 실제 저장은 안되는 변수 장바구니 위해서
	private int proFee; // 실제 저장은 안되는 변수 장바구니 위해서
	private int total; // 실제 저장은 안되는 변수 장바구니 위해서

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

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public String getpCode() {
		return pCode;
	}

	public void setpCode(String pCode) {
		this.pCode = pCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getEtcAddr() {
		return etcAddr;
	}

	public void setEtcAddr(String etcAddr) {
		this.etcAddr = etcAddr;
	}

	public String getRecName() {
		return recName;
	}

	public void setRecName(String recName) {
		this.recName = recName;
	}

	public String getRecPhone() {
		return recPhone;
	}

	public void setRecPhone(String recPhone) {
		this.recPhone = recPhone;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getRevYN() {
		return revYN;
	}

	public void setRevYN(String revYN) {
		this.revYN = revYN;
	}

	public String getProImg() {
		return proImg;
	}

	public void setProImg(String proImg) {
		this.proImg = proImg;
	}

	public int getProPrice() {
		return proPrice;
	}

	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}

	public int getProFee() {
		return proFee;
	}

	public void setProFee(int proFee) {
		this.proFee = proFee;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	@Override
	public String toString() {
		return "OrdHistoryVO [ordCode=" + ordCode + ", proCode=" + proCode + ", proName=" + proName + ", id=" + id
				+ ", amount=" + amount + ", payment=" + payment + ", pCode=" + pCode + ", addr=" + addr + ", etcAddr="
				+ etcAddr + ", recName=" + recName + ", recPhone=" + recPhone + ", orderDate=" + orderDate + ", memo="
				+ memo + ", revYN=" + revYN + ", proImg=" + proImg + ", proPrice=" + proPrice + ", proFee=" + proFee
				+ ", total=" + total + "]";
	}

}
