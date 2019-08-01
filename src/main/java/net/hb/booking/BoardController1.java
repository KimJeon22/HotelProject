package net.hb.booking;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.hb.crud.BoardDAO;

@Controller
public class BoardController1 {

	@Autowired
	ServletContext application;
	
	@Autowired
	@Inject
	BoardDAO1 dao;
	
	@RequestMapping(value="/boardInsert.do" , method = RequestMethod.POST)
	public String board_Insert(MultipartHttpServletRequest multipartHttpServletRequest, HotelDTO hdto, RoomDTO rdto)
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
		
		dao.boardInsert(hdto, rdto);
		
		
		return "redirect:list.do";
	}

}
