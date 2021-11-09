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

	// ��ǰ �߰�(�����ڿ���)
	public void insertProduct(ProductVO vo) {
		System.out.println("ProductDAO-insertProduct ����");
		mybatis.insert("proDAO.insertProduct",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ���� (�����ڿ���)
	public void updateProduct(ProductVO vo) {
		System.out.println("ProductDAO-updateProduct ����");
		mybatis.update("proDAO.updateProduct",vo);
		
	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ����(�����ڿ���)
	public void deleteProduct(ProductVO vo) {
		System.out.println("ProductDAO-deleteProduct ����");
		// "delete from product where proCode=?";
		mybatis.delete("proDAO.deleteProduct",vo);
		

	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ 1�� ����
	public ProductVO getProduct(ProductVO vo) {
		System.out.println("ProductDAO-getProduct ����");
		return (ProductVO) mybatis.selectOne("proDAO.getProduct",vo);
	}

	/////////////////////////////////////////////////////////////////////
	// ��ǰ ��ü ���


	// ���� -> ������ ī�װ� ��ǰ ��� (category.jsp)
	public List<ProductVO> getProList(ProductVO vo) {
		System.out.println("ProductDAO-getProList ����");

		System.out.println("voȮ��" + vo);
		System.out.println("get Condtion : " + vo.getCondition());

		if (vo.getCondition() != null || vo.getKeyword() != null) { // ��ǰ ����, �˻� ��
			System.out.println("vo.getKeyword �� null�ƴҶ�");
			System.out.println("condition & keyword " + vo.getCondition() + " : " + vo.getKeyword());
			if(vo.getCondition().equals("proDate")){
				vo.setKeyword("");
			}
			return mybatis.selectList("proDAO.searchProductList",vo);
			

		} 
		System.out.println("������� ���϶�");
		if (vo.getProCate().equals("����") || vo.getProCate().equals("����")) {
			if (vo.getProSubCate() != null) { // ���� ���� ī�װ�
				System.out.println("���ڸ�");
				System.out.println("vo.getProCateȮ��: " + vo.getProCate());
				System.out.println("vo.getProSubCateȮ��: " + vo.getProSubCate());

				return mybatis.selectList("proDAO.cateProductList",vo);
			}

		} /* else if (vo.getProCate().equals("����")) { */
		System.out.println("������");

		return mybatis.selectList("proDAO.getProductList",vo);

	}

}
