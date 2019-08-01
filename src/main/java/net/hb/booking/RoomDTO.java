package net.hb.booking;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class RoomDTO {
	int r_id,r_price, r_inwon;
	List<Integer> rl_price, rl_inwon;
	String h_name,r_name, r_service;;
	List<String> rl_name, rl_service;
	String r_cheap;
	
	public RoomDTO() {
		rl_price=new ArrayList<Integer>();
		rl_inwon=new ArrayList<Integer>();
		rl_name=new ArrayList<String>();
		rl_service=new ArrayList<String>();
	}

}
