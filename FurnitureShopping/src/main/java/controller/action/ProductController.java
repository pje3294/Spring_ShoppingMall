package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import model.product.ProductServiceImpl;
import model.product.ProductVO;

@Controller
@SessionAttributes("data")
public class ProductController {

	@Autowired
	ProductServiceImpl productService;

	/*
	 * @ModelAttribute("con") public Map<String,String> searchMap(){
	 * Map<String,String> con=new HashMap<String,String>(); con.put("상품명순",
	 * "proName"); con.put("최신순", "proDate"); return con; }
	 */

	@RequestMapping("/main.do")
	public String getProductList(ProductVO vo, Model model) {
		System.out.println("main.do 확인");
		if (vo.getProCode() == 0 && vo.getKeyword() == null && vo.getProCate()==null) {
			System.out.println("main첫화면 전체 확인");
			List<ProductVO> datas = productService.getProList(vo);
			model.addAttribute("datas", datas);
			System.out.println("(main.do) proCode==null ->  model.addAttribute : " + datas);

			return "main.jsp";
		}

		List<ProductVO> datas = productService.getProList(vo);
		model.addAttribute("datas", datas);
		System.out.println("매인-신상품(최신순) model.addAttribute : " + datas);

		return "category.jsp";
	}


	@RequestMapping("/productDetail.do")
	public String getProduct(ProductVO vo, Model model) {
		System.out.println("productDetail.do 실행");

		model.addAttribute("data", productService.getProduct(vo));
		System.out.println("productDetail.do -> model.addAttribute확인: " + productService.getProduct(vo));
		return "product_detail.jsp";
	}

	@RequestMapping("/updateProduct.do")
	public String updateProduct(ProductVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("updateProduct.do 실행");

		MultipartFile fileUpload = vo.getFileUpload();

		System.out.println("파일업로드: " + fileUpload);

		if (!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일명 : " + fileName);
			vo.setProImg("\\images\\product\\" + fileName);
			fileUpload.transferTo(new File(
					"C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"
							+ fileName));

		}

		productService.updateProduct(vo);
		HttpSession session = request.getSession();
		session.setAttribute("data", productService.getProduct(vo));

		return "productDetail.do";
	}

	@RequestMapping("/deleteProduct.do")
	public String deleteProduct(HttpServletRequest request, ProductVO vo) {
		System.out.println("deleteProduct.do 실행");
		productService.deleteProduct(vo);

		return "redirect:index.jsp";
	}

	@RequestMapping(value = "/insertProduct.do", method = RequestMethod.GET)
	public String showInsertProduct(ProductVO vo) throws IllegalStateException, IOException {
		System.out.println("insertProduct.do -- inserPro page 실행");

		return "insertPro.jsp";
	}

	@RequestMapping(value = "/insertProduct.do", method = RequestMethod.POST)
	public String insertProduct(ProductVO vo) throws IllegalStateException, IOException {
		System.out.println("insertProduct.do 실행");

		System.out.println("productVO 호가인: " + vo);

		MultipartFile fileUpload = vo.getFileUpload();
		if (!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일명 : " + fileName);
			vo.setProImg("\\images\\product\\" + fileName);
			fileUpload.transferTo(new File(
					"C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"
							+ fileName));
			// C:\Users\박정은\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\images\product
		} else {
			String fileName = "nonImg.png";
			System.out.println("파일명 : " + fileName);
			vo.setProImg("\\images\\product\\" + fileName);
			/*
			 * fileUpload.transferTo(new File(
			 * "C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"
			 * +fileName));
			 * //C:\Users\박정은\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\
			 * images\product
			 */
		}

		productService.insertProduct(vo);

		return "main.do";
	}

}
