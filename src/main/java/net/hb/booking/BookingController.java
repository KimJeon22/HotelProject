package net.hb.booking;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import net.hb.crud.BoardDAO;
import net.hb.crud.BoardDTO;
import net.hb.member.MemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BookingController {
	
	@Autowired
	ServletContext application;
	
	@Autowired
	@Inject
	bookingDAO dao;
	@Autowired
	@Inject
	MemberDAO mdao;
	
	private static final Logger logger = LoggerFactory.getLogger(BookingController.class);
	
	@RequestMapping(value="/bookingInsert.do" , method = RequestMethod.POST)
	public ModelAndView bookingInsert(bookerDTO bdto, bookingDTO kdto) {
		ModelAndView mav = new ModelAndView();
			
		dao.bookingInsert(kdto);
		dao.bookerInsert(bdto);
		
		
		mav.setViewName("WEB-INF/views/test.jsp");
		return mav;
	}
	
	
	
}
