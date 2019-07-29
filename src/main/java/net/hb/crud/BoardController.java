package net.hb.crud;


import java.io.File;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView board_list(BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		List<BoardDTO> hotelList = dao.dbSelect();
		
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
