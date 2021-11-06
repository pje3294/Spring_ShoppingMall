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
		data.setProSubCate(rs.getString("proSubCate"));
		data.setProName(rs.getString("proName"));
		data.setProPrice(rs.getInt("proPrice"));
		data.setProStock(rs.getInt("proStock"));
		data.setProDate(rs.getDate("proDate"));
		data.setProRating(rs.getDouble("proRating"));
		data.setProKC(rs.getString("proKC"));
		data.setProColor(rs.getString("proColor"));
		data.setProCmpt(rs.getString("proCmpt"));
		data.setProSize(rs.getString("proSize"));
		data.setProMtrl(rs.getString("proMtrl"));
		data.setProMnfct(rs.getString("proMnfct"));
		data.setProNation(rs.getString("proNation"));
		data.setProFee(rs.getInt("proFee"));
		data.setProCerti(rs.getString("proCerti"));
		data.setProAS(rs.getString("proAS"));
		data.setProImg(rs.getString("proImg"));
		//System.out.println("mapper date :" + data);
		return data;
	}

}

@Repository
public class ProductDAO {

	/*
	 * proCode number(20) primary key, -- 상품번호 proCate varchar2(30) not null, -- 상품
	 * 카테고리 proName varchar2(100) not null, -- 상품명 proPrice number(10) not null, --
	 * 상품가격 proStock number(5) not null, -- 상품재고 proDate date default sysdate, --
	 * 상품등록일 proRating number(2,1) default 0.0, -- 평점 proKC varchar2(30) not null,
	 * -- KC인증 proColor varchar2(200) not null, -- 색상 proCmpt varchar2(200) not
	 * null, -- 구성품 proMtrl varchar2(200) not null, -- 주요소재 proMnfct varchar2(200)
	 * not null, -- 제조자(수입자) proNation varchar2(100) not null, -- 제조국 proSize
	 * varchar2(200) not null, -- 크기 proFee number(5) not null, -- 배송,설치비용 proCerti
	 * varchar2(100) not null, -- 품질보증기준 proAS varchar2(100) not null, -- A/S 책임자와
	 * 전화번호 proImg1 varchar2(200) default 'nonImg.png', -- 상품 이미지1 proImg2
	 * varchar2(200)default 'nonImg.png', -- 상품 이미지2 proImg3 varchar2(200) default
	 * 'nonImg.png', -- 상품 이미지3 proSelling number(20) default 0
	 */
	private final String insertSQL = "insert into product (proCode, proCate,proSubCate, proName, proPrice, proStock, proKC, "
			+ "proColor, proCmpt, proMtrl, proMnfct, proNation, proSize, proFee, proCerti, proAS, proImg) "
			+ "values((select nvl(max(proCode),0)+1 from product),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

	// 상품 등록일, 평점은 수정 xxxx
	private final String updateSQL = "update product set proCate=?, proSubCate=?, proName=? , proPrice=?, proStock=?, proKC=?, proColor=? , proCmpt=?, "
			+ "proMtrl=?, proMnfct=?, proNation=?, proSize=?, proFee=?, proCerti=?, proAS=?, proImg=? where proCode=?";

	private final String deleteSQL = "delete from product where proCode=?";

	private final String getProductSQL = "select * from product where proCode=?";
	// 최신순
	// private final String getProductListSQL_PRODATE = "select * from product order
	// by proDate desc";
	// 상품명순
	// private final String getProductListSQL_PRONAME = "select * from product order
	// by proName desc";

	/*
	 * "SELECT * FROM (" + "SELECT ROWNUM AS RNUM, board.* FROM (" +
	 * "SELECT * FROM board WHERE bctgr = ? AND btitle LIKE '%'||?||'%' ORDER BY recnt DESC, bdate DESC"
	 * + ") board WHERE ROWNUM <= ?" //끝점 + ") WHERE RNUM > ? ORDER BY recnt DESC";
	 */

	@Autowired
	private JdbcTemplate jdbcTemplate;

	/////////////////////////////////////////////////////////////////////

	// 상품 추가(관리자영역)
	public void insertProduct(ProductVO vo) {
		System.out.println("ProductDAO-insertProduct 실행");
		// (proCode, proCate, proName, proPrice, proStock, proKC, "
		// "proColor, proCmpt, proMtrl, proMnfct, proNation, proSize, proFee, proCerti,
		// proAS, proImg1, proImg2, proImg3)
		Object[] args = { vo.getProCate(), vo.getProSubCate(), vo.getProName(), vo.getProPrice(), vo.getProStock(),
				vo.getProKC(), vo.getProColor(), vo.getProCmpt(), vo.getProMtrl(), vo.getProMnfct(), vo.getProNation(),
				vo.getProSize(), vo.getProFee(), vo.getProCerti(), vo.getProAS(), vo.getProImg() };
		jdbcTemplate.update(insertSQL, args);

	}

	/////////////////////////////////////////////////////////////////////
	// 상품 수정 (관리자영역)
	public void updateProduct(ProductVO vo) {
		System.out.println("ProductDAO-updateProduct 실행");
		// "update product set proCate=?, proName=? , proPrice=?, proStock=?, proKC=?,
		// proColor=? , proCmpt=?, "
		// + "proMtrl=?, proMnfct=?, proNation=?, proSize=?, proFee=?, proCerti=?,
		// proAS=?, proImg1=?, proImg2=?, proImg3=? where proCode=?";
		Object[] args = { vo.getProCate(), vo.getProSubCate(), vo.getProName(), vo.getProPrice(), vo.getProStock(),
				vo.getProKC(), vo.getProColor(), vo.getProCmpt(), vo.getProMtrl(), vo.getProMnfct(), vo.getProNation(),
				vo.getProSize(), vo.getProFee(), vo.getProCerti(), vo.getProAS(), vo.getProImg(), vo.getProCode() };
		jdbcTemplate.update(updateSQL, args);
	}

	/////////////////////////////////////////////////////////////////////
	// 상품 삭제(관리자영역)
	public void deleteProduct(ProductVO vo) {
		System.out.println("ProductDAO-deleteProduct 실행");
		// "delete from product where proCode=?";
		jdbcTemplate.update(deleteSQL, vo.getProCode());

	}

	/////////////////////////////////////////////////////////////////////
	// 상품 1개 선택
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("ProductDAO-getProduct 실행");
		Object[] args = { vo.getProCode() };
		return jdbcTemplate.queryForObject(getProductSQL, args, new ProductMapper());
	}

	/////////////////////////////////////////////////////////////////////
	// 상품 전체 목록
	/*
	 * public List<ProductVO> getMemberList(ProductVO vo) {
	 * System.out.println("ProductDAO-getMemberList 실행"); // 메인 하단 -> BestSellers
	 * 선택안해도 바로 나옴 // 메인페이지 -> 의자 /스툴/소파/신상품 선택
	 * 
	 * // 베스트셀러 (판매순) String getProductListSQL_PROSELLING =
	 * "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM product WHERE ROWNUM <= 5) WHERE RNUM > 0 ORDER BY proSelling DESC"
	 * ;
	 * 
	 * Object[] args = { vo.getKeyword() };
	 * 
	 * // 베스트 셀러 5개만 메인페이지에 설정 if (vo.getCondition().equals("proSelling")) { return
	 * jdbcTemplate.query(getProductListSQL_PROSELLING, args, new ProductMapper());
	 * 
	 * } // 메인페이지에서 "의자"카테고리 선택 시, else if(vo.getCondition().equals("chair")) {
	 * return jdbcTemplate.query(getProductListSQL_PROSELLING, args, new
	 * ProductMapper()); } }
	 */

	// 메인 -> 선택한 카테고리 상품 목록 (category.jsp)
	public List<ProductVO> getProList(ProductVO vo) {
		System.out.println("ProductDAO-getProList 실행");
		String getProductListSQL_Cate = "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM(select * from product where proCate=? order by proDate desc) product WHERE ROWNUM <= 20) WHERE RNUM > 0 ORDER BY proDate DESC";
		String getProductListSQL_SubCate = "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM(select * from product where proCate=? and proSubCate=? order by proDate desc) product WHERE ROWNUM <= 20) WHERE RNUM > 0 ORDER BY proDate DESC";
		String getProductList_ALL = "select * from product order by proDate desc";
		//String getProductList_ProName = "SELECT * FROM (select ROWNUM AS RNUM, product.* FROM(select * from product where proName like '%'||?||'%' order by proDate desc) product WHERE ROWNUM <= 20) WHERE RNUM > 0 ORDER BY proDate DESC";
		;

		System.out.println("vo확인" + vo);
		System.out.println("get Condtion : " + vo.getCondition());

		if (vo.getCondition() != null || vo.getKeyword() != null) { // 상품 정렬, 검색 시
			System.out.println("vo.getKeyword 이 null아닐때");
			System.out.println("condition & keyword " + vo.getCondition() + " : " + vo.getKeyword());
			Object[] args = { vo.getKeyword() };
			String sql_ProName = "select * from product where proName like '%'||?||'%' order by proDate desc";
			return jdbcTemplate.query(sql_ProName, args, new ProductMapper());

		} else {
			System.out.println("컨디션이 널일때");
			if (vo.getProCate().equals("의자")) {
				if (vo.getProSubCate() != null) { // 의자 하위 카테고리
					System.out.println("의자만");
					System.out.println("vo.getProCate확인: " + vo.getProCate());
					System.out.println("vo.getProSubCate확인: " + vo.getProSubCate());

					Object[] args = { vo.getProCate(), vo.getProSubCate() };
					return jdbcTemplate.query(getProductListSQL_SubCate, args, new ProductMapper());
				}

				System.out.println("vo.getProCate확인: " + vo.getProCate());
				Object[] args = { vo.getProCate() };
				return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());

			} else if (vo.getProCate().equals("스툴")) {
				System.out.println("스툴만");
				Object[] args = { vo.getProCate() };
				return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());
			} else if (vo.getProCate().equals("소파")) {
				if (vo.getProSubCate() != null) { 
				System.out.println("소파만");
				System.out.println("vo.getProCate확인: " + vo.getProCate());
				System.out.println("vo.getProSubCate확인: " + vo.getProSubCate());

				Object[] args = { vo.getProCate(), vo.getProSubCate() };
				return jdbcTemplate.query(getProductListSQL_SubCate, args, new ProductMapper());
				}

				System.out.println("vo.getProCate확인: " + vo.getProCate());
				Object[] args = { vo.getProCate() };
				return jdbcTemplate.query(getProductListSQL_Cate, args, new ProductMapper());
			} 
		}

		System.out.println("로깅체크");
		return jdbcTemplate.query(getProductList_ALL, new ProductMapper());

	}

}
