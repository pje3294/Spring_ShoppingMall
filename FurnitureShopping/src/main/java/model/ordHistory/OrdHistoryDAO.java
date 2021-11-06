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

	// ��ٱ��� ���� �� -> �ֹ� ������ �߰���
	
	@Transactional
	public void insertOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-insertOrdHistory ����");
		System.out.println("vo Ȯ��: " + vo);

		Object[] args = { vo.getProCode(),vo.getProName(), vo.getId(), vo.getAmount(), vo.getPayment(), vo.getpCode(), vo.getAddr(),
				vo.getEtcAddr(), vo.getRecName(), vo.getRecPhone(), vo.getMemo()};
		jdbcTemplate.update(insertSQL, args);
		
		System.out.println("���ų��� �߰�");
		String downStock = "update product set proStock= proStock - ? where proCode=?";
		
		Object[] arg = {vo.getAmount(), vo.getProCode()};
		jdbcTemplate.update(downStock, arg);

		System.out.println("���ŵǼ� ��� ���� ");
	}

	/////////////////////////////////////////////////////////////////////
	// ������� (����)
	public void deleteOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-deleteOrdHistory ����");
		jdbcTemplate.update(deleteSQL, vo.getOrdCode());

	}

	/////////////////////////////////////////////////////////////////////
	// �ּ��� ���� 
	public void updateOrdHistroy(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-updateOrdHistroy ����");
		// "update ordhistory set  pCode=?, addr=?,etcAddr=?, recName=?, recPhone=?, memo=? where ordCode=?";
		Object[] args = {vo.getpCode(), vo.getAddr(), vo.getEtcAddr(),vo.getRecName(), vo.getRecPhone(),vo.getMemo(), vo.getOrdCode()};
		jdbcTemplate.update(updateSQL, args);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////
	// �������� �󼼺��� 
	public OrdHistoryVO getOrdHistory(OrdHistoryVO vo) {
		System.out.println("OrdHistoryDAO-getOrdHistory ����");
		Object[] args = {vo.getOrdCode()};
		return jdbcTemplate.queryForObject(getOrdSQL,args, new OrdHistoryMapper());
	}
	
	/////////////////////////////////////////////////////////////////////
	// ���� ���ų��� (����)
	public List<OrdHistoryVO> getMyOrdList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getMyOrdList ����");
		Object[] args = {vo.getId()};
		return jdbcTemplate.query(getMyOrdSQL, args, new OrdHistoryMapper());
	}
	
	/////////////////////////////////////////////////////////////////////
	// ��� ��ü���ų���
	public List<OrdHistoryVO> getOrdHistoryList(OrdHistoryVO vo){
		System.out.println("OrdHistoryDAO-getOrdHistoryList ����");
		return jdbcTemplate.query(getAllOrdSQL, new OrdHistoryMapper());
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
