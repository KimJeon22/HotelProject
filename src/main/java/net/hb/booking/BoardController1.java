package net.hb.booking;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class BoardController1 {

	@Autowired
	ServletContext application;

	@RequestMapping("/boardInsert.do")
	public String board_detail(MultipartHttpServletRequest multipartHttpServletRequest, HotelDTO hdto, RoomDTO rdto)
			throws IOException {
		String path = application.getRealPath("/resources/upload");
		String fileName = null;
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		File file = new File(path);
		for (int i = 0; i < files.size(); i++) {
			fileName += files.get(i).getOriginalFilename()+"/";
			file = new File(path + files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);
		}
		System.out.println(fileName);
		return "redirect:/";
	}

}
