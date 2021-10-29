package controller.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import model.member.MemberServiceImpl;
import model.member.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberServiceImpl memberService;

	@RequestMapping(value = "/login.do")
	public String login(HttpSession session, MemberVO vo, HttpServletRequest request) {

		System.out.println("msg 초기상태 확인 : " + request.getAttribute("msg"));
		System.out.println("vo확인: " + vo);

		MemberVO data = memberService.login(vo);

		System.out.println("data 확인: " + data);

		if (data != null) {
			session.setAttribute("user", data);
			return "redirect:index.jsp";
		} else {
			request.setAttribute("msg", "failure"); // 아이디 혹은 비밀번호 불일치 시 화면에 문구 보여줌
			System.out.println("msg-failure 확인 : " + request.getAttribute("msg"));
			return "login.jsp";
		}
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:index.jsp";
	}

	@RequestMapping("/join.do")
	public String join(HttpServletRequest request, MemberVO vo) {

		memberService.insertMember(vo);
		return "redirect:index.jsp";
	}

	/*
	 * @RequestMapping("/myPage.do") public String myPage(HttpServletRequest
	 * request, MemberDAO dao, MemberVO vo) { dao.insertMember(vo); return "index";
	 * }
	 */

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
	public String updateMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo) {
		response.setContentType("text/html; charset=UTF-8");

		String name = ""; // 이름
		String id = ""; // 아이디
		String password = ""; // 비밀번호
		String phone = ""; // 전화번호
		String email = ""; // 이메일
		String pCode = ""; // 우편번호
		String addr = ""; // 도록명(지번)
		String etcAddr = ""; // 상세주소
		String admin = ""; // 권한여부
		String birth = ""; // 생년월일
		String profile = ""; // 프로필사진

		name = request.getParameter("name");
		id = request.getParameter("id");
		password = request.getParameter("password");
		phone = request.getParameter("phone");
		email = request.getParameter("email");
		pCode = request.getParameter("pCode");
		addr = request.getParameter("addr");
		etcAddr = request.getParameter("etcAddr");
		admin = request.getParameter("admin");
		birth = request.getParameter("birth");
		profile = request.getParameter("profile");

		vo.setAddr(addr);
		vo.setAdmin(admin);
		vo.setBirth(birth);
		vo.setEmail(email);
		vo.setEtcAddr(etcAddr);
		vo.setId(id);
		vo.setName(name);
		vo.setPassword(password);
		vo.setpCode(pCode);
		vo.setPhone(phone);
		vo.setProfile(profile);

		System.out.println("vo 확인: " + vo);

		memberService.updateMember(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("user", memberService.getMember(vo));
		
		
		return "redirect:myPage.jsp";
	}

	@RequestMapping("/myPage.do")
	public String myPage(HttpSession session, MemberVO vo) {

		String id = (String) session.getAttribute(vo.getId());

		vo.setId(id);

		memberService.getMember(vo);
		return "myPage.jsp";
	}

	@RequestMapping("/deleteMember.do")
	public String deleteMember(HttpServletRequest request, MemberVO vo) {

		String id = (String) request.getParameter("id");

		vo.setId(id);

		memberService.deleteMember(vo);
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:index.jsp";
	}

}
