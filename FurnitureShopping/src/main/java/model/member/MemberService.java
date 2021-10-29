package model.member;

import java.util.List;

public interface MemberService {
	void insertMember(MemberVO vo);

	void updateMember(MemberVO vo);

	void deleteMember(MemberVO vo);

	MemberVO getMember(MemberVO vo);

	List<MemberVO> getMemberList();
	
	MemberVO login(MemberVO vo);
}
