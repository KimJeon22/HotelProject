package net.hb.booking;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import net.hb.crud.BoardDAO;
import net.hb.crud.BoardDTO;
import net.hb.member.MemberDAO;
import net.hb.member.MemberDTO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BookingController {

	@Autowired
	ServletContext application;

	@Autowired
	bookingDAO dao;
	@Autowired
	MemberDAO mdao;
	@Autowired
	BoardDAO bdao;
	private static final Logger logger = LoggerFactory.getLogger(BookingController.class);

	@RequestMapping("/booking.do")
	public ModelAndView board_booking(
			@RequestParam("checkIn_date") String checkIn, @RequestParam("checkOut_date") String checkOut,
			@RequestParam("h_id") int h_id, @RequestParam("r_id") int r_id,
			@RequestParam("price") int price, BoardDTO dto, bookingDTO kdto, HttpSession session,HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		List<RoomDTO> rlist = bdao.dbRoomSelect2(r_id);
		List<BoardDTO> hlist = bdao.hotelSelect(h_id);
		Date startDate,endDate;
		response.setCharacterEncoding("UTF-8");
		//로그인 여부확인
		
		String m_id = (String) session.getAttribute("m_id");
		List<MemberDTO> mlist = mdao.memberSelect(m_id);
		mav.addObject("member",mlist);
		
		//체크인 체크아웃 날짜 비교
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		startDate = java.sql.Date.valueOf(checkIn);
		endDate = java.sql.Date.valueOf(checkOut);
		ArrayList<String> dates = new ArrayList<String>();
		
		Date currentDate = startDate;
        while (currentDate.compareTo(endDate) <= 0) {
            dates.add(sdf.format(currentDate));
            Calendar c = Calendar.getInstance();
            c.setTime(currentDate);
            c.add(Calendar.DAY_OF_MONTH, 1);
            currentDate = c.getTime();
        }
        
        for (String date : dates) {
        	bookingDTO day = new bookingDTO();
        	day.setDate(java.sql.Date.valueOf(date));
        	day.setDateCheck(r_id);
            
            int check = dao.checkDate(day);
            if(check != 0) {
            	try {
            		response.setContentType("text/html; charset=utf-8");
            		response.getWriter().append("<script>alert('빈 방이 없습니다'); history.go(-1);</script>").flush();;
					break;
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
            }
        }
    
		mav.addObject("checkIn", checkIn);
		mav.addObject("checkOut", checkOut);
		mav.addObject("price",price);
		mav.addObject("room", rlist);
		mav.addObject("hotel",hlist);
		mav.setViewName("WEB-INF/views/booking.jsp");
		return mav;
	}
	
	@RequestMapping(value = "/bookingInsert.do", method = RequestMethod.POST)
	public ModelAndView bookingInsert(bookerDTO bdto, bookingDTO kdto) {
		ModelAndView mav = new ModelAndView();
		Date in, out;

		in = java.sql.Date.valueOf(kdto.getCin());
		out = java.sql.Date.valueOf(kdto.getCout());
		kdto.setCheck_in(in);
		kdto.setCheck_out(out);


		dao.bookingInsert(kdto);
		dao.bookerInsert(bdto);
		mav.setViewName("WEB-INF/views/test.jsp");
		return mav;
	}

}
