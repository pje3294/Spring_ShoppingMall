package controller.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.product.ProductServiceImpl;
import model.product.ProductVO;

@Controller
@SessionAttributes("data")
public class ProductController {
	
	@Autowired
	ProductServiceImpl productService;
	
	
	@RequestMapping("/main.do")
	public String getBoardList(ProductVO vo,Model model) {
		System.out.println("main.do Ȯ��");
		if(vo.getProCode() == 0) {
			System.out.println("mainùȭ�� ��ü Ȯ��");
			List<ProductVO> datas=productService.getProList(vo);
			model.addAttribute("datas", datas);
			System.out.println("datasȮ�� : "+ datas);
			
		}
		if(vo.getCondition()==null) {
			vo.setCondition("");
		}
		if(vo.getKeyword()==null) {
			vo.setKeyword("");
		}
		/*List<ProductVO> datas=productService.getProList(vo);
		model.addAttribute("datas", datas);*/
		//System.out.println("datasȮ�� : "+ datas);
		return "main.jsp";
	}
	
	@RequestMapping("/productList.do")
	public String getBoardList(ProductVO vo, HttpServletRequest request,Model model) {
		System.out.println("productList.do ����");
		String proCate = request.getParameter("proCate");
		vo.setProCate(proCate);
		List<ProductVO> datas=productService.getProList(vo);
		model.addAttribute("datas", datas);
		System.out.println("datasȮ�� : "+ datas);
		return "category.jsp";
	}
	
}
