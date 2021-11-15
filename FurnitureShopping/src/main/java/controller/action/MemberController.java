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

		System.out.println("msg �ʱ���� Ȯ�� : " + request.getAttribute("msg"));
		System.out.println("voȮ��: " + vo);

		MemberVO member = memberService.login(vo);

		System.out.println("member Ȯ��: " + member);

		if (member == null) { // �α��� ����,
			request.setAttribute("msg", "failure"); // ���̵� Ȥ�� ��й�ȣ ����ġ �� ȭ�鿡 ���� ������
			System.out.println("msg-failure Ȯ�� : " + request.getAttribute("msg"));
			return "login.jsp";
		}
		// �α��� ����,

		// 1) ������ �α���
		if (member.getAdmin().equals("Y")) {
			System.out.println("�����ڸ��� �α���!!!");
			session.setAttribute("manager", member);
			return "main.do";
		}

		// 2) ȸ�� �α���
		session.setAttribute("user", member);
		// ��ٱ��� ����
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
			out.print("false"); // �߸��� ���̵� ����
		} else if (memberService.getMember(vo) != null) {
			out.print("fail"); // �̹� ���̵� ����
		} else {
			out.print("success");
		}

		return null;
	}

	@RequestMapping("/updateMember.do")
	public String updateMember(HttpServletRequest request, HttpServletResponse response, MemberVO vo)
			throws IllegalStateException, IOException {
		response.setContentType("text/html; charset=UTF-8");

		System.out.println("vo Ȯ��: " + vo);

		MultipartFile fileUpload = vo.getFileUpload();

		System.out.println("���Ͼ��ε�: " + fileUpload);

		if (!fileUpload.isEmpty()) {
			String fileName = fileUpload.getOriginalFilename();
			System.out.println("���ϸ� : " + fileName);
			vo.setProfile("\\images\\member\\" + fileName);
			fileUpload.transferTo(new File(
					"C:\\Users\\������\\git\\Spring_ShoppingMall\\FurnitureShopping\\src\\main\\webapp\\images\\member\\"
							+ fileName));

		}

		memberService.updateMember(vo);

		HttpSession session = request.getSession();

		if (vo.getAdmin().equals("Y")) {
			
			System.out.println("������ Ȯ��, id: "+vo.getId());
			session.setAttribute("manager", memberService.getMember(vo));
			System.out.println("����Ȯ��: "+session.getAttribute("manager"));
			return "myPage.jsp";
		}

		System.out.println("ȸ�� Ȯ��");
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
		System.out.println("/getMemberList.do ����");
		
		List<MemberVO> memList = memberService.getMemberList();
		model.addAttribute("memList",memList);
		System.out.println("����-�Ż�ǰ(�ֽż�) model.addAttribute : " + memList);
		
		return "myOrdHistory.jsp"; //�����ڴ� ȸ�� ��Ϻ�������� ��Ȱ�� 
		
		
	}
	

}
