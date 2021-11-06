package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		cartCnt++;

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

		System.out.println("status : " + status);
		cart.remove(status);

		int cartCnt = (Integer) session.getAttribute("cartCnt");
		cartCnt--;

		session.setAttribute("cartCnt", cartCnt);

		return "cart.jsp";
	}

	// 주문하러가기
	@RequestMapping(value = "/order.do")
	public String orderProduct(HttpServletRequest request, OrdHistoryVO vo) {
		// 회원id, 상품 번호, 이미지, 상품명, 가격, / 수량(request.get , int), total(가격x수량)
		// id, proCode(int) , proImg , proName , proPrice(int),

		System.out.println("order.do-VO 확인 : " + vo);

		HttpSession session = request.getSession();
		List<OrdHistoryVO> cart = (List<OrdHistoryVO>) session.getAttribute("cart");
		System.out.println("cart확인: " + cart);

		for (OrdHistoryVO v : cart) {
			v.setAddr(vo.getAddr());
			v.setpCode(vo.getpCode());
			v.setEtcAddr(vo.getEtcAddr());
			v.setRecPhone(vo.getRecPhone());
			v.setRecName(vo.getRecName());
			v.setMemo(vo.getMemo());
			v.setPayment(vo.getPayment());

			orderHistoryService.insertOrdHistory(v);
			System.out.println("insertOrdHistory확인: " + v);
		}

		List<OrdHistoryVO> ordHistory = orderHistoryService.getMyOrdList(vo);

		session.setAttribute("ordHistory", ordHistory);

		return "main.do";
	}

	// 구매내역보기
	@RequestMapping(value = "/myOrder.do")
	public String getOrderHistoryList(HttpServletRequest request, HttpServletResponse response, OrdHistoryVO vo) {
		// 회원id, 상품 번호, 이미지, 상품명, 가격, / 수량(request.get , int), total(가격x수량)
		// id, proCode(int) , proImg , proName , proPrice(int),
		System.out.println("/myOrder.do 실행 ");

		String id = request.getParameter("id");

		vo.setId(id);

		HttpSession session = request.getSession();
		System.out.println("vo : " + vo);

		List<OrdHistoryVO> ordHistory = orderHistoryService.getMyOrdList(vo);

		session.setAttribute("ordHistory", ordHistory);

		for (OrdHistoryVO v : ordHistory) {
			System.out.println("ord확인: " + v);

		}

		return "myOrdHistory.jsp";
	}
	
	@RequestMapping(value = "/updateOrder.do", method = RequestMethod.GET)
	public String showUpdateOrderHistory(HttpServletRequest request, OrdHistoryVO vo, Model model) {
		System.out.println("/updateOrder.do 실행-get");

		OrdHistoryVO myOrder = orderHistoryService.getOrdHistory(vo);
		model.addAttribute("myOrder",myOrder);
		
		return "updateMyOrder.jsp";
	}
	

	// 주문 수정 (==배송지 변경)
	// updateOrder.do
	@RequestMapping(value = "/updateOrder.do", method = RequestMethod.POST)
	public String updateOrderHistory(HttpServletRequest request, OrdHistoryVO vo) {
		System.out.println("/updateOrder.do 실행");

		orderHistoryService.updateOrdHistroy(vo);

		return "myOrder.do";
	}

	@RequestMapping(value = "/deleteOrder.do")
	public String deleteOrderHistory(HttpServletRequest request, OrdHistoryVO vo) {
		System.out.println("/deleteOrder.do 실행");

		orderHistoryService.deleteOrdHistory(vo);
		

		return "myOrder.do";
	}

	
	
	
}
