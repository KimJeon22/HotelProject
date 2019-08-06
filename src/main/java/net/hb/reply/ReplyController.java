package net.hb.reply;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ReplyController {
	
	@Autowired
	@Inject
	ReplyDAO dao;
	String url;
	
	int id;
	
	@RequestMapping("/rinsert.do")
	public String reply_insert(ReplyDTO dto,HttpSession session) {
		dto.setH_id(id);
		dto.setM_id((String) session.getAttribute("m_id"));
		dao.dbInsert(dto);
		return "redirect:detail.do?"+dto.getUrl();
	}
	@RequestMapping("/rselect.do")
	public ModelAndView reply_Select(@RequestParam("Gidx") int h_id, HttpServletRequest req, HttpSession session) {
		id=h_id;
		url = req.getQueryString();
		String m_id = (String)session.getAttribute("m_id");
		ModelAndView mav = new ModelAndView();
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		list=dao.dbreplySelect(h_id);
		mav.addObject("redto", list);
		mav.addObject("url", url);
		mav.addObject("m_id", m_id);
		mav.setViewName("WEB-INF/views/reply.jsp");
		
		return mav;
	}
	
	
	@RequestMapping("/replydelete.do")
	public String reply_Delete(@RequestParam("Gidx") int re_id) {
		dao.dbDelete(re_id);
		return "redirect:detail.do?"+url;
	}
	
}
