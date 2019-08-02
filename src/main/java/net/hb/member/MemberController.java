package net.hb.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	
	@Autowired
	@Inject
	MemberDAO dao;
	
	@RequestMapping("/minsert.do")
	public String board_insert(MemberDTO dto) {
		dao.dbInsert(dto);
		
		return "redirect:/Mainpage.jsp";
	}
	
	@RequestMapping("/header.do")
	public String header(MemberDTO dto) {
		
		return "WEB-INF/views/header.jsp";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "redirect:/Mainpage.jsp";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃");
		return "/Mainpage.jsp";
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@RequestParam("m_id")String m_id, @RequestParam("m_pwd")String m_pwd, MemberDTO dto, HttpSession session) {
		dto.setM_id(m_id);
		dto.setM_id(m_pwd);
		ModelAndView mav = new ModelAndView();
		int result=0;
		result=dao.loginCheck(dto);
	
		
		if(result == 1) { //없는 id
			mav.setViewName("WEB-INF/views/login.jsp");
		} else if(result == 2) { //password 틀림
			mav.setViewName("WEB-INF/views/login.jsp");
		} else if(result == 3) { //로그인 성공
			session.setAttribute("m_id", dto.getM_id());
			System.out.println("로그인성공");
			mav.setViewName("/Mainpage.jsp");
		}
		return mav;
	}
	
}
