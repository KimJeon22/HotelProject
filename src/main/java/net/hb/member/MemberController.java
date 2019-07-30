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
		
		return "redirect:login.do";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "WEB-INF/views/login.jsp";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "WEB-INF/views/loginCheck.jsp";
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
			mav.addObject("msg","id");
		} else if(result == 2) { //password 틀림
			mav.setViewName("WEB-INF/views/login.jsp");
			mav.addObject("msg","pwd");
		} else if(result == 3) { //로그인 성공
			session.setAttribute("m_id", dto.getM_id());
			mav.setViewName("WEB-INF/views/loginCheck.jsp");
		}
			
		return mav;
	}
	
}
