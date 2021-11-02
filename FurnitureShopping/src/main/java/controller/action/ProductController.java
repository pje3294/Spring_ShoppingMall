package controller.action;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	@ModelAttribute("category")
	public Map<String,String> searchMap(){
		Map<String,String> category=new HashMap<String,String>();
		category.put("����", "title");
		category.put("����", "stool");
		category.put("����", "sofa");
		return category;
	}
	
	
	
	

	@RequestMapping("/main.do")
	public String getProductList(ProductVO vo, Model model) {
		System.out.println("main.do Ȯ��");
		if (vo.getProCode() == 0) {
			System.out.println("mainùȭ�� ��ü Ȯ��");
			List<ProductVO> datas = productService.getProList(vo);
			model.addAttribute("datas", datas);
			System.out.println("datasȮ�� : " + datas);

		}
		if (vo.getCondition() == null) {
			vo.setCondition("");
		}
		if (vo.getKeyword() == null) {
			vo.setKeyword("");
		}
		
		List<ProductVO> datas = productService.getProList(vo);
		model.addAttribute("datas", datas);
		System.out.println("datasȮ�� : " + datas);
		/*
		 * List<ProductVO> datas=productService.getProList(vo);
		 * model.addAttribute("datas", datas);
		 */
		// System.out.println("datasȮ�� : "+ datas);
		return "main.jsp";
	}

	@RequestMapping("/productList.do")
	public String getProductList(ProductVO vo, HttpServletRequest request, Model model) {
		System.out.println("productList.do ����");
		String proCate = request.getParameter("proCate");
		vo.setProCate(proCate);
		List<ProductVO> datas = productService.getProList(vo);
		model.addAttribute("datas", datas);
		System.out.println("datasȮ�� : " + datas);
		return "category.jsp";
	}

	@RequestMapping("/productDetail.do")
	public String getProduct(ProductVO vo, Model model) {
		System.out.println("productDetail.do ����");
		
		model.addAttribute("data", productService.getProduct(vo));
		System.out.println("dataȮ��: "+ productService.getProduct(vo));
		return "product_detail.jsp";
	}

	@RequestMapping("/updateProduct.do")
	public String updateProduct(ProductVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println("updateProduct.do ����");
		
		MultipartFile fileUpload = vo.getFileUpload();
		
		System.out.println("���Ͼ��ε�: "+fileUpload);
		
		if(!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("���ϸ� : "+ fileName);
			vo.setProImg("\\images\\product\\"+fileName);
			fileUpload.transferTo(new File("C:\\Users\\������\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"+fileName));
			
		}
		
		productService.updateProduct(vo);
		HttpSession session = request.getSession();
		session.setAttribute("data", productService.getProduct(vo));
		
		return "productDetail.do";
	}

	@RequestMapping("/deleteProduct.do")
	public String deleteProduct(HttpServletRequest request, ProductVO vo) {
		System.out.println("deleteProduct.do ����");
		productService.deleteProduct(vo);
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/insertProduct.do",method=RequestMethod.GET)
	public String showInsertProduct(ProductVO vo) throws IllegalStateException, IOException {
		System.out.println("insertProduct.do -- inserPro page ����");
		
		
		return "insertPro.jsp";
	}

	@RequestMapping(value ="/insertProduct.do",method=RequestMethod.POST)
	public String insertProduct(ProductVO vo) throws IllegalStateException, IOException {
		System.out.println("insertProduct.do ����");
		
		
		System.out.println("productVO ȣ����: " +vo);
		
		MultipartFile fileUpload = vo.getFileUpload();
		if(!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("���ϸ� : "+ fileName);
			vo.setProImg("\\images\\product\\"+fileName);
			fileUpload.transferTo(new File("C:\\Users\\������\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"+fileName));
			//C:\Users\������\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\images\product
		}else {
			String fileName = "nonImg.png";
			System.out.println("���ϸ� : "+ fileName);
			vo.setProImg("\\images\\product\\"+fileName);
			/*fileUpload.transferTo(new File("C:\\Users\\������\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\product\\"+fileName));
			//C:\Users\������\git\Spring_ShoppingMall\FurnitureShopping\src\main\webapp\images\product
*/			
		}
		
		productService.insertProduct(vo);
		
		
		
		return "main.do";
	}

}
