package net.hb.booking;

import lombok.Data;

@Data
public class RoomDTO {
	int r_id, r_price1, r_inwon1, r_price2, r_inwon2, r_price3, r_inwon3, r_price4, r_inwon4;
	String h_name, r_name1, r_service1, r_name2, r_service2, r_name3, r_service3, r_name4, r_service4;

}
