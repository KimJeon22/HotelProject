package net.hb.main;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.hb.crud.BoardDTO;


@Controller
public class MainController {
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	ServletContext application;
	
	@Autowired
	@Inject
	MainDAO dao;
	

	/*
	 * @RequestMapping("/tourSearch.do") public String
	 * tour_search( @RequestParam("timg") String timg, Model model) {
	 * System.out.println("�Ѿ���̹����̸�=" + timg); MainDTO dto = dao.dbTselect(timg);
	 * model.addAttribute("dto", dto); System.out.println("������Ʈ�ѷ��Ϸ�");
	 * 
	 * return "WEB-INF/views/MainDetail.jsp"; }
	 */
	 
	@RequestMapping("/tourSearch.do")
	public ModelAndView toursearch(BoardDTO dto, @RequestParam("timg") String timg ) {
		System.out.println("����ȭ�鿡�� �Ѿ�� �̹����̸�=" + timg);
		ModelAndView mav = new ModelAndView();
		MainDTO dtos = dao.dbTselect(timg);
		mav.addObject("LG", dtos);
		System.out.println("��Ʈ�ѷ� �Ϸ�");
		mav.setViewName("WEB-INF/views/MainDetail.jsp");
		return mav;
	}
	
	
}//class END
