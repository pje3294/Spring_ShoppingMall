package model.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductDAO {



	@Autowired
	private SqlSessionTemplate mybatis;

	/////////////////////////////////////////////////////////////////////

	// 상품 추가(관리자영역)
	public void insertProduct(ProductVO vo) {
		System.out.println("ProductDAO-insertProduct 실행");
		mybatis.insert("proDAO.insertProduct",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 상품 수정 (관리자영역)
	public void updateProduct(ProductVO vo) {
		System.out.println("ProductDAO-updateProduct 실행");
		mybatis.update("proDAO.updateProduct",vo);
		
	}

	/////////////////////////////////////////////////////////////////////
	// 상품 삭제(관리자영역)
	public void deleteProduct(ProductVO vo) {
		System.out.println("ProductDAO-deleteProduct 실행");
		// "delete from product where proCode=?";
		mybatis.delete("proDAO.deleteProduct",vo);
		

	}

	/////////////////////////////////////////////////////////////////////
	// 상품 1개 선택
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("ProductDAO-getProduct 실행");
		return (ProductVO) mybatis.selectOne("proDAO.getProduct",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// 상품 전체 목록
	// 메인 -> 선택한 카테고리 상품 목록 (category.jsp)
	public List<ProductVO> getProList(ProductVO vo) {
		System.out.println("ProductDAO-getProList 실행");

		System.out.println("vo확인" + vo);

		if (vo.getCondition() != null) { // 신상품 보기
			System.out.println("vo.getCondition 이 null아닐때");
			System.out.println("condition : " + vo.getCondition());
			
			if(vo.getCondition().equals("proDate")){
				System.out.println("신상품순으로 보여주기");
				vo.setKeyword("");
			}
			
			return mybatis.selectList("proDAO.searchProductList",vo);
			

		}
		
		System.out.println("컨디션이 널일때");
		
		if(vo.getKeyword() != null) {  // 상품명 검색 시
			System.out.println("vo.getKeyword 이 null아닐때");
			System.out.println("keyword : " + vo.getKeyword());
			String keyword = vo.getKeyword();
			vo.setKeyword(keyword);
			return mybatis.selectList("proDAO.searchProductList",vo);
		}
		
		
		if (vo.getProCate().equals("의자") || vo.getProCate().equals("소파")) {
			if (vo.getProSubCate() != null) { // 하위 카테고리
				System.out.println("하위카테고리만 보여주기");
				System.out.println("vo.getProCate확인: " + vo.getProCate());
				System.out.println("vo.getProSubCate확인: " + vo.getProSubCate());

				return mybatis.selectList("proDAO.cateProductList",vo);
			}

		} 
		System.out.println("상위카테고리만 보여주기");

		return mybatis.selectList("proDAO.getProductList",vo);

	}

}
