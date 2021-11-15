package controller.action;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import model.member.MemberServiceImpl;
import model.member.MemberVO;
import model.ordHistory.OrdHistoryVO;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	@RequestMapping(value = "/login.do")
	public String login(HttpSession session, MemberVO vo, HttpServletRequest request) {

		System.out.println("msg 초기상태 확인 : " + request.getAttribute("msg"));
		System.out.println("vo확인: " + vo);

		MemberVO member = memberService.login(vo);

		System.out.println("member 확인: " + member);

		if (member == null) { // 로그인 실패,
			request.setAttribute("msg", "failure"); // 아이디 혹은 비밀번호 불일치 시 화면에 문구 보여줌
			System.out.println("msg-failure 확인 : " + request.getAttribute("msg"));
			return "login.jsp";
		}
		// 로그인 성공,

		// 1) 관리자 로그인
		if (member.getAdmin().equals("Y")) {
			System.out.println("관리자모드로 로그인!!!");
			session.setAttribute("manager", member);
			return "main.do";
		}

		// 2) 회원 로그인
		session.setAttribute("user", member);
		// 장바구니 생성
		List<OrdHistoryVO> cart = new ArrayList<OrdHistoryVO>();
		session.setAttribute("cart", cart);
		int cartCnt =0;
		session.setAttribute("cartCnt", cartCnt);

		return "redirect:index.jsp";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping("/join.do")
	public String join(MemberVO vo) throws IllegalStateException, IOException {

		memberService.insertMember(vo);
		return "redirect:index.jsp";
	}


	@RequestMapping("/idCheck.do")
	public String idCheck(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		String id = request.getParameter("id");
		vo.setId(id);

		PrintWriter out = null;

		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (!Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{5,15}$", id)) {
			out.print("false"); // 잘못된 아이디 형식
		} else if (memberService.getMember(vo) != null) {
			out.print("fail"); // 이미 아이디 존재
		} else {
			out.print("success");
		}

		return null;
	}

	@RequestMapping("/updateMember.do")
	public String updateMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo)
			throws IllegalStateException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		System.out.println("vo 확인: " + vo);

		MultipartFile fileUpload = vo.getFileUpload();

		System.out.println("파일업로드: " + fileUpload);

		if (!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("파일명 : " + fileName);
			vo.setProfile("\\images\\member\\" + fileName);
			fileUpload.transferTo(new File(
					"C:\\Users\\박정은\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\member\\"
							+ fileName));

		}

		memberService.updateMember(vo);

		HttpSession session = request.getSession();

		if (vo.getAdmin().equals("Y")) {
			
			System.out.println("관리자 확인, id: "+vo.getId());
			session.setAttribute("manager", memberService.getMember(vo));
			System.out.println("세션확인: "+session.getAttribute("manager"));
			return "myPage.jsp";
		}

		System.out.println("회원 확인");
		session.setAttribute("user", memberService.getMember(vo));
		return "myPage.jsp";

	}

/*	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session, MemberVO vo) {

		String id = (String) session.getAttribute(vo.getId());

		System.out.println("myPage.do id ="+ id);
		vo.setId(id);

		memberService.getMember(vo);
		
		
		
		
		return "myPage.jsp";
	}*/

	@RequestMapping("/deleteMember.do")
	public String deleteMember(HttpServletRequest request, MemberVO vo) {

		String id = (String) request.getParameter("id");

		vo.setId(id);

		memberService.deleteMember(vo);
		HttpSession session = request.getSession();
		session.invalidate();
		return "main.do";
	}
	
	@RequestMapping("/getMemberList.do")
	public String getMemberList(Model model) {
		System.out.println("/getMemberList.do 실행");
		
		List<MemberVO> memList = memberService.getMemberList();
		model.addAttribute("memList",memList);
		System.out.println("매인-신상품(최신순) model.addAttribute : " + memList);
		
		return "myOrdHistory.jsp"; //관리자는 회원 목록보기용으로 재활용 
		
		
	}
	

}
