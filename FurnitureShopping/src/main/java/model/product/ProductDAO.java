package model.product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

class ProductMapper implements RowMapper<ProductVO> {

	@Override
	public ProductVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ProductVO data = new ProductVO();
		data.setProCode(rs.getInt("proCode"));
		data.setProCate(rs.getString("proCate"));
		data.setProName(rs.getString("proName"));
		data.setProPrice(rs.getInt("proPrice"));
		data.setProStock(rs.getInt("proStock"));
		data.setProDate(rs.getDate("proDate"));
		data.setProRating(rs.getDouble("proRating"));
		data.setProKC(rs.getString("proKC"));
		data.setProColor(rs.getString("proColor"));
		data.setProCmpt(rs.getString("proCmpt"));
		data.setProMtrl(rs.getString("proMtrl"));
		data.setProMnfct(rs.getString("proMnfct"));
		data.setProNation(rs.getString("proNation"));
		data.setProFee(rs.getInt("proFee"));
		data.setProCerti(rs.getString("proCerti"));
		data.setProAS(rs.getString("proAS"));
		data.setProImg1(rs.getString("proImg1"));
		data.setProImg2(rs.getString("proImg2"));
		data.setProImg3(rs.getString("proImg3"));

		return data;
	}

}

@Repository
public class ProductDAO {

	/*
	 * proCode number(20) primary key, -- ��ǰ��ȣ proCate varchar2(30) not null, -- ��ǰ
	 * ī�װ��� proName varchar2(100) not null, -- ��ǰ�� proPrice number(10) not null, --
	 * ��ǰ���� proStock number(5) not null, -- ��ǰ��� proDate date default sysdate, --
	 * ��ǰ����� proRating number(2,1) default 0.0, -- ���� proKC varchar2(30) not null,
	 * -- KC���� proColor varchar2(200) not null, -- ���� proCmpt varchar2(200) not
	 * null, -- ����ǰ proMtrl varchar2(200) not null, -- �ֿ���� proMnfct varchar2(200)
	 * not null, -- ������(������) proNation varchar2(100) not null, -- ������ proSize
	 * varchar2(200) not null, -- ũ�� proFee number(5) not null, -- ���,��ġ��� proCerti
	 * varchar2(100) not null, -- ǰ���������� proAS varchar2(100) not null, -- A/S å���ڿ�
	 * ��ȭ��ȣ proImg1 varchar2(200) default 'nonImg.png', -- ��ǰ �̹���1 proImg2
	 * varchar2(200)default 'nonImg.png', -- ��ǰ �̹���2 proImg3 varchar2(200) default
	 * 'nonImg.png', -- ��ǰ �̹���3 proSelling number(20) default 0
	 */
	private final String insertSQL = "insert into product (proCode, proCate, proName, proPrice, proStock, proKC, "
			+ "proColor, proCmpt, proMtrl, proMnfct, proNation, proSize, proFee, proCerti, proAS, proImg1, proImg2, proImg3) "
			+ "values((select nvl(max(proCode),0)+1 from product),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	// ��ǰ �����, ������ ���� xxxx
	private final String updateSQL = "update product set proCate=?, proName=? , proPrice=?, proStock=?, proKC=?, proColor=? , proCmpt=?, "
			+ "proMtrl=?, proMnfct=?, proNation=?, proSize=?, proFee=?, proCerti=?, proAS=?, proImg1=?, proImg2=?, proImg3=?  where proCode=?";

	private final String deleteSQL = "delete from product where proCode=?";

	private final String getProductSQL = "select * from product where proCode=?";
	// �ֽż�
	// private final String getProductListSQL_PRODATE = "select * from product order
	// by proDate desc";
	// ��ǰ����
	// private final String getProductListSQL_PRONAME = "select * from product order
	// by proName desc";

	/*
	 * "SELECT * FROM (" + "SELECT ROWNUM AS RNUM, board.* FROM (" +
	 * "SELECT * FROM board WHERE bctgr = ? AND btitle LIKE '%'||?||'%' ORDER BY recnt DESC, bdate DESC"
	 * + ") board WHERE ROWNUM <= ?" //���� + ") WHERE RNUM > ? ORDER BY recnt DESC";
	 */

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/////////////////////////////////////////////////////////////////////

	// ��ǰ �߰�(�����ڿ���)
	public void insertProduct(ProductVO vo) {
		System.out.println("ProductDAO-insertMember ����");
		// (proCode, proCate, proName, proPrice, proStock, proKC, "
		// "proColor, proCmpt, proMtrl, proMnfct, proNation, proSize, proFee, proCerti,
		// proAS, proImg1, proImg2, proImg3)
		Object[] args = { vo.getProCate(), vo.getProName(), vo.getProPrice(), vo.getProStock(), vo.getProKC(),
				vo.getProColor(), vo.getProCmpt(), vo.getProMtrl(), vo.getProMnfct(), vo.getProNation(),
				vo.getProSize(), vo.getProFee(), vo.getProCerti(), vo.getProAS(), vo.getProImg1(), vo.getProImg2(),
				vo.getProImg3() };
		jdbcTemplate.update(insertSQL, args);

	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ���� (�����ڿ���)
	public void updateProduct(ProductVO vo) {
		System.out.println("ProductDAO-updateProduct ����");
		// "update product set proCate=?, proName=? , proPrice=?, proStock=?, proKC=?,
		// proColor=? , proCmpt=?, "
		// + "proMtrl=?, proMnfct=?, proNation=?, proSize=?, proFee=?, proCerti=?,
		// proAS=?, proImg1=?, proImg2=?, proImg3=? where proCode=?";
		Object[] args = { vo.getProCate(), vo.getProName(), vo.getProPrice(), vo.getProStock(), vo.getProKC(),
				vo.getProColor(), vo.getProCmpt(), vo.getProMtrl(), vo.getProMnfct(), vo.getProNation(),
				vo.getProSize(), vo.getProFee(), vo.getProCerti(), vo.getProAS(), vo.getProImg1(), vo.getProImg2(),
				vo.getProImg3(), vo.getProCode() };
		jdbcTemplate.update(updateSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ����(�����ڿ���)
	public void deleteProduct(ProductVO vo) {
		System.out.println("ProductDAO-deleteProduct ����");
		// "delete from product where proCode=?";
		jdbcTemplate.update(deleteSQL, vo.getProCode());

	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ 1�� ����
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("ProductDAO-getProduct ����");
		Object[] args = { vo.getProCode() };
		return jdbcTemplate.queryForObject(getProductSQL, args, new ProductMapper());
	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ��ü ���
	/*
	 * public List<ProductVO> getMemberList(ProductVO vo) {
	 * System.out.println("ProductDAO-getMemberList ����"); // ���� �ϴ� -> BestSellers
	 * ���þ��ص� �ٷ� ���� // ���������� -> ���� /����/����/�Ż�ǰ ����
	 * 
	 * // ����Ʈ���� (�Ǹż�) String getProductListSQL_PROSELLING =
	 * "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM product WHERE ROWNUM <= 5) WHERE RNUM > 0 ORDER BY proSelling DESC"
	 * ;
	 * 
	 * Object[] args = { vo.getKeyword() };
	 * 
	 * // ����Ʈ ���� 5���� ������������ ���� if (vo.getCondition().equals("proSelling")) { return
	 * jdbcTemplate.query(getProductListSQL_PROSELLING, args, new ProductMapper());
	 * 
	 * } // �������������� "����"ī�װ��� ���� ��, else if(vo.getCondition().equals("chair")) {
	 * return jdbcTemplate.query(getProductListSQL_PROSELLING, args, new
	 * ProductMapper()); } }
	 */

	// ���� -> ������ ī�װ��� ��ǰ ��� (category.jsp)
	public List<ProductVO> getProList(ProductVO vo) {
		System.out.println("ProductDAO-getProList ����");
		String getProductListSQL_Cate = "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM(select * from product where proCate=? order by proDate desc) product WHERE ROWNUM <= 5) WHERE RNUM > 0 ORDER BY proDate DESC";
		String getProductList_ALL = "select * from product order by proDate desc";
		String getProductListSQL_ProDate = "select rownum as rnum, product.* from(select * from product where proName=? order by proDate desc) product "
				+ "where rownum <= 5) where rnum >0? order by proDate desc";

		System.out.println("voȮ��" + vo);
		if(vo.getProCode()==0 && vo.getProCate()== null) { // ���� ���۽� 
			System.out.println("�ʱ�");
			return jdbcTemplate.query(getProductList_ALL, new ProductMapper());
		}
		
		
		// ī�װ��� ���� (����, ����, ����)
		if (vo.getProCate().equals("chair")) {
			//System.out.println("vo.getProCateȮ��: "+vo.getProCate());
			Object[] args = { vo.getProCate() };
			return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());
		} else if (vo.getProCate().equals("stool")) {
			Object[] args = { vo.getProCate() };
			return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());
		} else if (vo.getProCate().equals("sofa")) {
			Object[] args = { vo.getProCate() };
			return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());
		}

		// �Ż�ǰ(��ϳ�¥��_proDate), �˻�(��ǰ��_proName), ���������������� ������(proRating) & ���ݼ�(proPrice)
		if (vo.getCondition().equals("proDate")) {

			Object[] args = { vo.getKeyword() };
			return jdbcTemplate.query(getProductListSQL_ProDate, args, new ProductMapper());
		}
		System.out.println("�α�üũ");
		return jdbcTemplate.query(getProductList_ALL, new ProductMapper());

	}

}