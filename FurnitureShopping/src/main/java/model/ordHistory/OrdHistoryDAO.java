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
	
	// 장바구니 결제 후 -> 주문 내역에 추가됨
	
	@Transactional
	public void insertOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-insertOrdHistory 실행");
		mybatis.insert("ordDAO.insertOrdHistory",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 구매취소 (삭제)
	public void deleteOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-deleteOrdHistory 실행");
		mybatis.delete("ordDAO.deleteOrdHistory",vo);

	}

	/////////////////////////////////////////////////////////////////////
	// 주소지 변경 
	public void updateOrdHistroy(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-updateOrdHistroy 실행");
		mybatis.update("ordDAO.updateOrdHistroy",vo);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	// 구내내역 상세보기 
	public OrdHistoryVO getOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-getOrdHistory 실행");
		return (OrdHistoryVO) mybatis.selectOne("ordDAO.getOrdHistory",vo);
	}
	
	/////////////////////////////////////////////////////////////////////
	// 나의 구매내역 (전쳬)
	public List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getMyOrdList 실행");
		return mybatis.selectList("ordDAO.getMyOrdList",vo);
	}
	
	/////////////////////////////////////////////////////////////////////
	// 모든 전체구매내역
	public List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getOrdHistoryList 실행");
		return mybatis.selectList("ordDAO.getOrdHistoryList",vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
