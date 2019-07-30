package net.hb.crud;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	int h_id, h_rate,start, end;
	String h_name, h_adress, h_image, h_content;
	String checkIn_date, checkOut_date;
}
