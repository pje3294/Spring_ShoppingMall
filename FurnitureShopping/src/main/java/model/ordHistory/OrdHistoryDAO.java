package model.ordHistory;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import model.member.MemberVO;


@Repository
public class OrdHistoryDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// ��ٱ��� ���� �� -> �ֹ� ������ �߰���
	
	@Transactional
	public void insertOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-insertOrdHistory ����");
		mybatis.insert("ordDAO.insertOrdHistory",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ������� (����)
	public void deleteOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-deleteOrdHistory ����");
		mybatis.delete("ordDAO.deleteOrdHistory",vo);

	}

	/////////////////////////////////////////////////////////////////////
	// �ּ��� ���� 
	public void updateOrdHistroy(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-updateOrdHistroy ����");
		mybatis.update("ordDAO.updateOrdHistroy",vo);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	// �������� �󼼺��� 
	public OrdHistoryVO getOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-getOrdHistory ����");
		return (OrdHistoryVO) mybatis.selectOne("ordDAO.getOrdHistory",vo);
	}
	
	/////////////////////////////////////////////////////////////////////
	// ���� ���ų��� (����)
	public List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getMyOrdList ����");
		return mybatis.selectList("ordDAO.getMyOrdList",vo);
	}
	
	/////////////////////////////////////////////////////////////////////
	// ��� ��ü���ų���
	public List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getOrdHistoryList ����");
		return mybatis.selectList("ordDAO.getOrdHistoryList",vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
