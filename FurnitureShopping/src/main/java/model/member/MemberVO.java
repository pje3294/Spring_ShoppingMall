package model.member;

public class MemberVO {
	/*
	 * create table member( id varchar2(15) primary key, -- ���̵� name varchar2(20)
	 * not null, -- �̸� pw varchar2(30) not null, -- ��й�ȣ email varchar2(30) not
	 * null, -- �̸��� phone varchar2(11) not null, -- ��ȭ��ȣ pCode varchar2(6) not null,
	 * -- �����ȣ addr varchar2(100) not null, -- �ּ� etcAddr varchar2(100) not null, --
	 * ���ּ� admin varchar2(1) default 'N', -- �������� gender varchar2(1) not null, --
	 * ���� birth varchar2(10) not null -- ������� );
	 */

	private String id;
	private String name;
	private String password;
	private String email;
	private String phone;
	private String pCode;
	private String addr;
	private String etcAddr;
	private String admin;
	private String birth;
	private String profile;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", name=" + name + ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", pCode=" + pCode + ", addr=" + addr + ", etcAddr=" + etcAddr + ", admin=" + admin
				+ ", birth=" + birth + ", profile=" + profile + "]";
	}

}
