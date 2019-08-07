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
	
	int id;
	String url;
	
	@RequestMapping("/rinsert.do")
	public String reply_insert(ReplyDTO dto,HttpSession session) {
		dto.setH_id(id);
		dto.setM_id((String) session.getAttribute("m_id"));
		dao.dbInsert(dto);
		url = dto.getUrl();
		return "redirect:detail.do?"+dto.getUrl();
	}
	@RequestMapping("/rselect.do")
	public ModelAndView replySelect(@RequestParam("Gidx") int h_id, HttpServletRequest req) {
		id=h_id;
		int num=0;
		url = req.getQueryString();
		ModelAndView mav = new ModelAndView();
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		list=dao.dbreplySelect(h_id);
		
		ReplyDTO dto = new ReplyDTO();
		dto.setH_id(h_id);
		if(list.size()==0) {
			dto.setAvg(0);
			dao.dbAvgUpdate(dto);
			System.out.println("´ñ±Û 0");
		} else {
			for(int i=0;i<list.size();i++) 
				num+=list.get(i).getRe_rate();
			dto.setAvg(num/list.size());
			dao.dbAvgUpdate(dto);
			System.out.println(dto.getH_id());
		}
		
		//dao.dbAvgUpdate(list,h_id);
		mav.addObject("redto", list);
		mav.addObject("url", url);
		mav.setViewName("WEB-INF/views/reply.jsp");
		return mav;
	}
	
	@RequestMapping("/replydelete.do")
	public String reply_Delete(@RequestParam("Gidx") int re_id) {
		dao.dbDelete(re_id);
		return "redirect:detail.do?"+url;
	}
}
