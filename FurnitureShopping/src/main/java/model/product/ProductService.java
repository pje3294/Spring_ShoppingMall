package model.product;

import java.util.List;

public interface ProductService {
	void insertProduct(ProductVO vo);

	void updateProduct(ProductVO vo);

	void deleteProduct(ProductVO vo);

	ProductVO getProduct(ProductVO vo);

	List<ProductVO> getProList(ProductVO vo);

}
