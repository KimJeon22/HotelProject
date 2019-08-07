package net.hb.crud;

import java.util.Date;


import lombok.Data;

@Data
public class BoardDTO {
	int h_id, h_rate,start, end, r_price, multi_price;
	String h_name, h_adress, h_image, h_content;
	String checkIn_date, checkOut_date;
	
	//maps 
    String t_area, m_lat, m_long;
		
}
