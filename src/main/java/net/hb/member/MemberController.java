package net.hb.member;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	
	@Autowired
	@Inject
	MemberDAO dao;
	
	@RequestMapping("/minsert.do")
	public String board_insert(MemberDTO dto) {
		dao.dbInsert(dto);
		
		return "redirect:list.do";
	}
	
	@RequestMapping("login.do")
	public String login() {
		return "WEB-INF/views/login.jsp";
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(MemberDTO dto) {
		System.out.println(dto.getIdcnt());
		System.out.println(dto.getPwdcnt());
		HttpSession session = null;
		ModelAndView mav = new ModelAndView();
		int result=0;
		result=dao.loginCheck(dto);
		System.out.println(result);
		
		if(result == 1) { //없는 id
			mav.setViewName("WEB-INF/views/login.jsp");
			mav.addObject("msg","id");
		} else if(result == 2) { //password 틀림
			mav.setViewName("WEB-INF/views/login.jsp");
			mav.addObject("msg","pwd");
		} else if(result == 3) { //로그인 성공
			session.setAttribute("m_id", dto.getM_id());
			mav.setViewName("redirect:list.do");
		}
			
		return mav;
	}
	
}
