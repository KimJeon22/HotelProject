package net.hb.booking;

import java.util.Date;

import lombok.Data;

@Data
public class bookingDTO {

	String is_check;
	int r_id;
	Date heck_in, check_out;
}
