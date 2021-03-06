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
import net.hb.member.MemberDTO;


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
	 * System.out.println("넘어온이미지이름=" + timg); MainDTO dto = dao.dbTselect(timg);
	 * model.addAttribute("LG", dto); System.out.println("첫번째투어컨트롤러완료");
	 * 
	 * return "WEB-INF/views/hotelList.do"; }
	 */
	
		
	  @RequestMapping("/tourSearch.do") 
	  public ModelAndView toursearch(MainDTO dto, @RequestParam("timg") String timg, @RequestParam("area") String area ) {
		  //System.out.println("넘어온 이미지=" + timg + "넘어온지역명=" + area);
		  //관광지 스플릿변수설정
			  String A = null;
			  String B = null;
			  String C = null;
			  String D = null;
		  //메인위도경도변수명
			  String w = null;
			  String k = null;
		  //System.out.println("메인화면에서 넘어온 이미지이름=" + timg);
		  ModelAndView mav = new ModelAndView(); 
		  
		  //관광지정보
		  MainDTO dtos = dao.dbTselect(timg); 
			  String str = dtos.t_place;
			  //System.out.println("str="+ str);
			  String strA[] = str.split("/");
			  for(int i=0; i<strA.length; i++) {
				  //System.out.println("관광지스플릿="+strA[i]);
				   A = strA[0];
				   B = strA[1];
				   C = strA[2];
				   D = strA[3];			  
			  }	
		  //위도경도 정보 
			  String atr = dtos.t_mlat;
			  String atrA[] = atr.split("/");
			  for(int i=0; i<atrA.length; i++) {
				  //System.out.println("위도스플릿="+atrA[i]);
				  w = atrA[0];
				  k = atrA[1];
			  } 
			  				  
		  //지도관련정보
		  List<MainDTO> mt = dao.dbMselect(area);
		  
		  //호텔정보&룸가격 
		  List<MainDTO> dt = dao.dbHselect(area);
		  
		  
		/*
		 * for(int i=0; i<dtoss.size(); i++) { MainDTO dt = new MainDTO();
		 * //System.out.println("컨트롤러에서 나온호텔이름=" + dtoss.get(i).getH_name()); String
		 * hname = dtoss.get(i).getH_name(); }
		 */
		  mav.addObject("LG",dtos); 
		  mav.addObject("HG", dt);
		  mav.addObject("A", A); //관광지정보
		  mav.addObject("B", B); //관광지정보
		  mav.addObject("C", C); //관광지정보
		  mav.addObject("D", D); //관광지정보
		  mav.addObject("w", w); //위도정보
		  mav.addObject("k", k); //경도정보
		  mav.addObject("mt", mt); //maps db정보
				  
		  //System.out.println("컨트롤러 완료");
		  mav.setViewName("WEB-INF/views/MainDetail.jsp"); 	  
	  return mav; }
	 
	  
	/*
	 * @RequestMapping("/hotelList.do") public ModelAndView hotel_list() {
	 * ModelAndView mav = new ModelAndView(); List<MainDTO> HG = dao.dbHselect();
	 * mav.addObject("HG", HG); mav.setViewName("WEB-INF/views/MainDetail.jsp");
	 * System.out.println("두번쨰투어컨트롤러완료"); return mav; }
	 */
	  
			
		@RequestMapping("/mainpage.do")
		public String main(MemberDTO dto) {
			return "WEB-INF/views/Mainpage.jsp";
		}
	
	
}//class END
