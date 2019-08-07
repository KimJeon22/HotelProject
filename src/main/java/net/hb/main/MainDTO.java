package net.hb.main;

import java.util.Date;
import lombok.Data;


@Data
public class MainDTO {
//hotel
  int h_id, h_rate; 
  String h_name, h_adress, h_image;
	 
//room
  int r_id, r_price;
  String r_name;
	
//booking
  int m_num;
  Date check_in, check_out;
  String is_check;
  
 //travel
  String  t_area, t_image, t_place, t_content, t_mlat;
  
 //maps 
  String m_lat, m_long;
 
}
