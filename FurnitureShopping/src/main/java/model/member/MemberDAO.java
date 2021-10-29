package model.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class MemberRowMapper implements RowMapper<MemberVO> {

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		MemberVO data = new MemberVO();
		data.setId(rs.getString("id"));
		data.setName(rs.getString("name"));
		data.setPassword(rs.getString("password"));
		;
		data.setEmail(rs.getString("email"));
		data.setPhone(rs.getString("phone"));
		data.setpCode(rs.getString("pCode"));
		data.setAddr(rs.getString("addr"));
		data.setEtcAddr(rs.getString("etcAddr"));
		data.setAdmin(rs.getString("admin"));
		data.setBirth(rs.getString("birth"));
		data.setProfile(rs.getString("profile"));

		System.out.println("RowMapper data확인: " + data);
		return data;

	}

}

@Repository
public class MemberDAO {
	/*
	 * private String id; private String name; private String pw; private String
	 * email; private String phone; private String pCode; private String addr;
	 * private String etcAddr; private String admin; private String gender; private
	 * String birth;
	 */

	private final String insertSQL = "insert into member (id, name, password, email, phone, pCode, addr, etcAddr, birth) values(?,?,?,?,?,?,?,?,?)";
	private final String updateSQL = "update member set name=?, password=?, email=?, phone=?, pCode=?, addr=?, etcAddr=?, birth=?, profile=? where id=?";
		//개인정보 수정 -> 이름, 비번, 이메일, 전화번호, 집주소(우편,주소,상세), 생일, 프로필 사진
	private final String deleteSQL = "delete from member where id=?";
	private final String getMemberSQL = "select * from member where id=?";
	private final String getMemberListSQL = "select * from member";
	private final String loginSQL ="select * from member where id=? and password=?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/////////////////////////////////////////////////////////////////////

	// 화원가입
	public void insertMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember 실행");
		System.out.println("vo 확인: " + vo);
		// id, name, pw, email, phone, pCode, addr, etcAddr, gender, birth
		Object[] args = { vo.getId(), vo.getName(), vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getpCode(),
				vo.getAddr(), vo.getEtcAddr(), vo.getBirth() };
		jdbcTemplate.update(insertSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// 개인정보 수정
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember 실행");
		Object[] args = { vo.getName(), vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getpCode(), vo.getAddr(),
				vo.getEtcAddr(), vo.getBirth(), vo.getProfile(), vo.getId() };
		jdbcTemplate.update(updateSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// 회원탈퇴
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAO-deleteMember 실행");
		jdbcTemplate.update(deleteSQL, vo.getId());
	}

	/////////////////////////////////////////////////////////////////////
	// 아이디중복확인 & 마이페이지 
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberDAO-getMember 실행");
		Object[] args = {vo.getId()};
		return jdbcTemplate.queryForObject(getMemberSQL, args, new MemberRowMapper());

	}

	/////////////////////////////////////////////////////////////////////
	// 로그인 
	public MemberVO login(MemberVO vo) {
		System.out.println("MemberDAO-login 실행");
		
		Object[] args = { vo.getId(), vo.getPassword() };
		return jdbcTemplate.queryForObject(loginSQL, args, new MemberRowMapper());

	}

	/////////////////////////////////////////////////////////////////////
	// 회원목록 -> 추후 생일 쿠폰, 회원 전체 메일/문자 기능 develop예정으로 만듦
	public List<MemberVO> getMemberList() {
		System.out.println("MemberDAO-getMemberList 실행");
		return jdbcTemplate.query(getMemberListSQL, new MemberRowMapper());
	}

}
