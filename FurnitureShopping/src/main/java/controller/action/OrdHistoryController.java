package controller.action;

import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.ordHistory.OrdHistoryServiceImpl;
import model.ordHistory.OrdHistoryVO;

@Controller
public class OrdHistoryController {

	@Autowired
	OrdHistoryServiceImpl orderHistoryService;

	// 장바구니 추가

	@RequestMapping(value = "/addCart.do")
	public String addCart(HttpServletRequest request, OrdHistoryVO vo) {
		// 회원id, 상품 번호, 이미지, 상품명, 가격, / 수량(request.get , int), total(가격x수량)
		// id, proCode(int) , proImg , proName , proPrice(int),

		HttpSession session = request.getSession();

		// 장바구니 생성
		List<OrdHistoryVO> cart = (List<OrdHistoryVO>) session.getAttribute("cart");
		System.out.println("dsfd: " + vo);

		int cartCnt = cart.size();
		System.out.println(cartCnt);
		
		cart.add(vo);
		cartCnt ++;
		

		System.out.println("cart: " + cart);

		session.setAttribute("cart", cart);
		session.setAttribute("cartCnt", cartCnt);

		System.out.println("cartCnt: " + cartCnt);
		return "redirect:cart.jsp";
	}
	
	
	@RequestMapping(value = "/deleteCart.do")
	public String deleteCart(HttpServletRequest request, OrdHistoryVO vo, @RequestParam int status) {
		HttpSession session = request.getSession();
		
		List<OrdHistoryVO> cart = (List<OrdHistoryVO>) session.getAttribute("cart");
		
		System.out.println("status : "+ status);
		cart.remove(status);
		
		int cartCnt = (Integer) session.getAttribute("cartCnt");
		cartCnt --;
		
		return "cart.jsp";
	}
	
	
	

	// 주문하러가기

	@RequestMapping(value = "/order.do")
	public String orderProduct(HttpServletRequest request, OrdHistoryVO vo) {
		// 회원id, 상품 번호, 이미지, 상품명, 가격, / 수량(request.get , int), total(가격x수량)
		// id, proCode(int) , proImg , proName , proPrice(int),

		HttpSession session = request.getSession();
		List<OrdHistoryVO> cart = (List<OrdHistoryVO>) session.getAttribute("cart");

		orderHistoryService.insertOrdHistory(vo);
		
		return "order.jsp";
	}

	// 구매내역보기

	@RequestMapping(value = "/myOrder.do")
	public String getOrderHistoryList(HttpSession session, OrdHistoryVO vo) {
		// 회원id, 상품 번호, 이미지, 상품명, 가격, / 수량(request.get , int), total(가격x수량)
		// id, proCode(int) , proImg , proName , proPrice(int),

		return "checkout.jsp";
	}

	

	
}
