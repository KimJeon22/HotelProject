package net.hb.crud;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	@Inject
	BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list.do")
	@ResponseBody
	public ModelAndView board_list(BoardDTO dto, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int total = dao.dbCount();
		int pageCount = 5;
		String data = request.getParameter("Gnum");
		if(data == "" || data == null) data = "1";
		int pageNum = Integer.parseInt(data);
		int start = 0, end = 0;
		
		start = (pageNum - 1) * 5+1;
		end = (pageNum) * 5;
		if( total < pageCount) pageCount = total;
		System.out.println(start +"\t½ÃÀÛ -- ³¡   " + end);
		
		List<BoardDTO> hotelList = dao.dbSelect(start, end);
		
		mav.addObject("start", start);
		mav.addObject("end",end);
		mav.addObject("pageNum",pageNum);
		mav.addObject("pageCount", pageCount);
		mav.addObject("total",total);
		mav.addObject("HL", hotelList);
		mav.setViewName("WEB-INF/views/list.jsp");
		return mav;
	}
	
	@RequestMapping("/Detail.do")
	public ModelAndView board_detail(BoardDTO dto, @RequestParam("Title") String data) {
		ModelAndView mav = new ModelAndView();
		BoardDTO dtos = dao.dbDetail(data);
		
		mav.addObject("LG", dtos);
		mav.setViewName("WEB-INF/views/boardDetail.jsp");
		return mav;
	}
}
