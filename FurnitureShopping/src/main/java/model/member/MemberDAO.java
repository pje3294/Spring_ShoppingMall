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

		System.out.println("RowMapper dataȮ��: " + data);
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
		//�������� ���� -> �̸�, ���, �̸���, ��ȭ��ȣ, ���ּ�(����,�ּ�,��), ����, ������ ����
	private final String deleteSQL = "delete from member where id=?";
	private final String getMemberSQL = "select * from member where id=?";
	private final String getMemberListSQL = "select * from member";
	private final String loginSQL ="select * from member where id=? and password=?";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/////////////////////////////////////////////////////////////////////

	// ȭ������
	public void insertMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember ����");
		System.out.println("vo Ȯ��: " + vo);
		// id, name, pw, email, phone, pCode, addr, etcAddr, gender, birth
		Object[] args = { vo.getId(), vo.getName(), vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getpCode(),
				vo.getAddr(), vo.getEtcAddr(), vo.getBirth() };
		jdbcTemplate.update(insertSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// �������� ����
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember ����");
		Object[] args = { vo.getName(), vo.getPassword(), vo.getEmail(), vo.getPhone(), vo.getpCode(), vo.getAddr(),
				vo.getEtcAddr(), vo.getBirth(), vo.getProfile(), vo.getId() };
		jdbcTemplate.update(updateSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// ȸ��Ż��
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAO-deleteMember ����");
		jdbcTemplate.update(deleteSQL, vo.getId());
	}

	/////////////////////////////////////////////////////////////////////
	// ���̵��ߺ�Ȯ�� & ���������� 
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberDAO-getMember ����");
		Object[] args = {vo.getId()};
		return jdbcTemplate.queryForObject(getMemberSQL, args, new MemberRowMapper());

	}

	/////////////////////////////////////////////////////////////////////
	// �α��� 
	public MemberVO login(MemberVO vo) {
		System.out.println("MemberDAO-login ����");
		
		Object[] args = { vo.getId(), vo.getPassword() };
		return jdbcTemplate.queryForObject(loginSQL, args, new MemberRowMapper());

	}

	/////////////////////////////////////////////////////////////////////
	// ȸ����� -> ���� ���� ����, ȸ�� ��ü ����/���� ��� develop�������� ����
	public List<MemberVO> getMemberList() {
		System.out.println("MemberDAO-getMemberList ����");
		return jdbcTemplate.query(getMemberListSQL, new MemberRowMapper());
	}

}
