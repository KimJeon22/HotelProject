package net.hb.reply;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.hb.booking.RoomDTO;
import net.hb.member.MemberDTO;


@Controller
public class ReplyController {
	
	@Autowired
	@Inject
	ReplyDAO dao;
	
	@RequestMapping("/rinsert.do")
	public String reply_insert(@RequestParam("Gidx") int h_id,ReplyDTO dto,HttpSession session) {
		dto.setH_id(h_id);
		dto.setM_id((String) session.getAttribute("m_id"));
		dao.dbInsert(dto);
		return "redirect:/detail.do?Gidx="+h_id;
	}
	@RequestMapping("/rselect.do")
	public ModelAndView replySelect(@RequestParam("Gidx") int h_id) {
		ModelAndView mav = new ModelAndView();
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		list=dao.dbreplySelect(h_id);
		mav.addObject("redto", list);
		mav.setViewName("WEB-INF/views/reply.jsp");
		return mav;
	}
}
