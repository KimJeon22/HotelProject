package net.hb.booking;


import java.util.Date;

import lombok.Data;

@Data
public class bookingDTO {

	String cin,cout,is_check;
	int r_id, dateCheck;
	Date check_in, check_out, date;
	
}
