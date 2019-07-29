package net.hb.member;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


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
	
}
