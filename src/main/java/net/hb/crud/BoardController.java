package net.hb.crud;


import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import net.hb.booking.RoomDTO;

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
	int pageCount = 5;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@RequestMapping("/list.do")
	public ModelAndView board_list(BoardDTO dto) {
		ModelAndView mav = new ModelAndView();
		int total = dao.dbCount();
		int start = 0, end = 5;
		
		if( total < 5) end = total;
		
		List<BoardDTO> hotelList = dao.dbSelect(start, end, dto.getH_adress());
		 
		
		//몇 박인지 계산하기
		if(dto.getCheckIn_date() == null) {mav.addObject("day", 1);}
		else {
			try {
		        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		        Date beginDate = formatter.parse(dto.getCheckIn_date());
		        Date endDate = formatter.parse(dto.getCheckOut_date());
		         
		        // 시간차이를 시간,분,초를 곱한 값으로 나누면 하루 단위가 나옴
		        long diff = endDate.getTime() - beginDate.getTime();
		        long diffDays = diff / (24 * 60 * 60 * 1000);
		        mav.addObject("day", diffDays);
		        
		    	} catch (ParseException e) {
		        e.printStackTrace();
		    	}
			}
		mav.addObject("start", start);
		mav.addObject("end",end);
		mav.addObject("total",total);
		mav.addObject("HL", hotelList);
		mav.addObject("adress", dto.getH_adress());
		mav.addObject("checkIn", dto.getCheckIn_date());
		mav.addObject("checkOut",dto.getCheckOut_date());
		mav.setViewName("WEB-INF/views/list.jsp");
		return mav;
	}
	
	@RequestMapping("/list.ajax")
	public @ResponseBody List<BoardDTO> AjaxView(
	@RequestParam("Gnum") int data, @RequestParam("adress") String adress, @RequestParam("rate") int rate, BoardDTO dto)  {
		int start = 0, end = 0;
		
		start = (data - 1) * 5+1;
		end = (data) * 5;
		System.out.println(start +" asd " + end);
		int total = dao.dbCount();
		if( total < 5) end = total;
		
		List<BoardDTO> ldto = dao.dbDetailSelect(start, end, adress, rate);
		
		return ldto;
	}
	
	@RequestMapping(value="/boardInsert.do" , method = RequestMethod.POST)
	public String board_Insert(MultipartHttpServletRequest multipartHttpServletRequest, BoardDTO hdto, RoomDTO rdto)
			throws IOException {
		String path = application.getRealPath("/resources/upload/");
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		File file = new File(path);
		String fileName = files.get(0).getOriginalFilename();
		
		for (int i = 0; i < files.size(); i++) {
			file = new File(path + files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
			if(i>=1) {fileName +="/" + files.get(i).getOriginalFilename();}
		}
		hdto.setH_image(fileName);
		dao.dbInsert(hdto, rdto);
		
		return "index.jsp";
	}
	
	@RequestMapping("/detail.do")
	public ModelAndView board_detail(@RequestParam("Gidx") int data,BoardDTO bdto,RoomDTO rdto) {
		ModelAndView mav = new ModelAndView();
		bdto = dao.dbDetail(data);
		mav.addObject("LG", bdto);
		mav.setViewName("detail.jsp");
		return mav;
	}
}
