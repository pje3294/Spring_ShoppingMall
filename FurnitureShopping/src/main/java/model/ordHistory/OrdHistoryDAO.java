package model.ordHistory;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

class OrdHistoryMapper implements RowMapper<OrdHistoryVO> {

	@Override
	public OrdHistoryVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		OrdHistoryVO data = new OrdHistoryVO();
		data.setAddr(rs.getString("addr"));
		data.setAmount(rs.getInt("amount"));
		data.setEtcAddr(rs.getString("etcAddr"));
		data.setId(rs.getString("id"));
		data.setMemo(rs.getString("memo"));
		data.setOrdCode(rs.getInt("ordCode"));
		data.setOrderDate(rs.getDate("orderDate"));
		data.setPayment(rs.getInt("payment"));
		data.setpCode(rs.getString("pCode"));
		data.setProCode(rs.getInt("proCode"));
		data.setProName(rs.getString("proName"));
		data.setRecName(rs.getString("recName"));
		data.setRecPhone(rs.getString("recPhone"));
		data.setRevYN(rs.getString("revYN"));
		return data;
	}

}

@Repository
public class OrdHistoryDAO {

	private final String insertSQL = "insert into ordhistory (ordCode, proCode, proName, id, amount, payment, pCode, addr, "
			+ "etcAddr, recName, recPhone, memo) values((select nvl(max(ordCode),0)+1 from ordhistory),?,?,?,?,?,?,?,?,?,?,?)";

	/*
	 * private final String updateSQL =
	 * "update ordhistory set proCate=?, proSubCate=?, proName=? , proPrice=?, proStock=?, proKC=?, proColor=? , proCmpt=?, "
	 * +
	 * "proMtrl=?, proMnfct=?, proNation=?, proSize=?, proFee=?, proCerti=?, proAS=?, proImg=? where ordCode=?"
	 * ;
	 */

	private final String deleteSQL = "delete from ordhistory where ordCode=?";
	
	private final String updateSQL = "update ordhistory set  pCode=?, addr=?,etcAddr=?, recName=?, recPhone=?, memo=? where ordCode=?";

	private final String getOrdSQL = "select * from ordhistory where ordCode=?";

	private final String getAllOrdSQL = "select * from ordhistory order by orderDate desc";
	
	private final String getMyOrdSQL = "select * from ordhistory where id=? order by orderDate desc";

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// 장바구니 결제 후 -> 주문 내역에 추가됨
	
	@Transactional
	public void insertOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-insertOrdHistory 실행");
		System.out.println("vo 확인: " + vo);

		Object[] args = { vo.getProCode(),vo.getProName(), vo.getId(), vo.getAmount(), vo.getPayment(), vo.getpCode(), vo.getAddr(),
				vo.getEtcAddr(), vo.getRecName(), vo.getRecPhone(), vo.getMemo()};
		jdbcTemplate.update(insertSQL, args);
		
		System.out.println("구매내역 추가");
		String downStock = "update product set proStock= proStock - ? where proCode=?";
		
		Object[] arg = {vo.getAmount(), vo.getProCode()};
		jdbcTemplate.update(downStock, arg);

		System.out.println("구매되서 재고 감소 ");
	}

	/////////////////////////////////////////////////////////////////////
	// 구매취소 (삭제)
	public void deleteOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-deleteOrdHistory 실행");
		jdbcTemplate.update(deleteSQL, vo.getOrdCode());

	}

	/////////////////////////////////////////////////////////////////////
	// 주소지 변경 
	public void updateOrdHistroy(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-updateOrdHistroy 실행");
		// "update ordhistory set  pCode=?, addr=?,etcAddr=?, recName=?, recPhone=?, memo=? where ordCode=?";
		Object[] args = {vo.getpCode(), vo.getAddr(), vo.getEtcAddr(),vo.getRecName(), vo.getRecPhone(),vo.getMemo(), vo.getOrdCode()};
		jdbcTemplate.update(updateSQL, args);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	// 구내내역 상세보기 
	public OrdHistoryVO getOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-getOrdHistory 실행");
		Object[] args = {vo.getOrdCode()};
		return jdbcTemplate.queryForObject(getOrdSQL,args, new OrdHistoryMapper());
	}
	
	/////////////////////////////////////////////////////////////////////
	// 나의 구매내역 (전쳬)
	public List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getMyOrdList 실행");
		Object[] args = {vo.getId()};
		return jdbcTemplate.query(getMyOrdSQL, args, new OrdHistoryMapper());
	}
	
	/////////////////////////////////////////////////////////////////////
	// 모든 전체구매내역
	public List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getOrdHistoryList 실행");
		return jdbcTemplate.query(getAllOrdSQL, new OrdHistoryMapper());
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
