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

	// 화원가입
	public void insertMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember 실행");
		mybatis.insert("memDAO.insertMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 개인정보 수정
	public void updateMember(MemberVO vo) {
		System.out.println("MemberDAO-insertMember 실행");
		mybatis.update("memDAO.updateMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 회원탈퇴
	public void deleteMember(MemberVO vo) {
		System.out.println("MemberDAO-deleteMember 실행");
		mybatis.delete("memDAO.deleteMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 아이디중복확인 & 마이페이지
	public MemberVO getMember(MemberVO vo) {
		System.out.println("MemberDAO-getMember 실행");
		return (MemberVO) mybatis.selectOne("memDAO.getMember", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 로그인
	public MemberVO login(MemberVO vo) {
		System.out.println("MemberDAO-login 실행");
		return (MemberVO) mybatis.selectOne("memDAO.login", vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 회원목록 -> 추후 생일 쿠폰, 회원 전체 메일/문자 기능 develop예정으로 만듦
	public List<MemberVO> getMemberList() {
		System.out.println("MemberDAO-getMemberList 실행");
		return mybatis.selectList("memDAO.getMemberList");
	}

}
