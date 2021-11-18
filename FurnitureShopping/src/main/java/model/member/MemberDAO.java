package model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	/////////////////////////////////////////////////////////////////////

	// ȭ������
	public void insertMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember ����");
		mybatis.insert("memDAO.insertMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// �������� ����
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember ����");
		mybatis.update("memDAO.updateMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ȸ��Ż��
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAO-deleteMember ����");
		mybatis.delete("memDAO.deleteMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ���̵��ߺ�Ȯ�� & ����������
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberDAO-getMember ����");
		return (MemberVO) mybatis.selectOne("memDAO.getMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// �α���
	public MemberVO login(MemberVO vo) {
		System.out.println("MemberDAO-login ����");
		return (MemberVO) mybatis.selectOne("memDAO.login", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ȸ����� -> ���� ���� ����, ȸ�� ��ü ����/���� ��� develop�������� ����
	public List<MemberVO> getMemberList() {
		System.out.println("MemberDAO-getMemberList ����");
		return mybatis.selectList("memDAO.getMemberList");
	}

}
