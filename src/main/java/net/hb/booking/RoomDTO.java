package net.hb.booking;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class RoomDTO {
	int r_id,r_price,r_inwon,r_price1, r_inwon1, r_price2, r_inwon2, r_price3, r_inwon3, r_price4, r_inwon4;
	String h_name, r_name, r_service, r_name1, r_service1, r_name2, r_service2, r_name3, r_service3, r_name4, r_service4;
	List<Integer> rl_price = new ArrayList<Integer>();
	List<Integer> rl_inwon = new ArrayList<Integer>();
	List<String> rl_name=new ArrayList<String>();
	List<String> rl_service=new ArrayList<String>();
	
	public void listAdd() {
		this.rl_price.add(r_price1);
		this.rl_price.add(r_price2);
		this.rl_price.add(r_price3);
		this.rl_price.add(r_price4);
		
		this.rl_inwon.add(r_inwon1);
		this.rl_inwon.add(r_inwon2);
		this.rl_inwon.add(r_inwon3);
		this.rl_inwon.add(r_inwon4);
		
		this.rl_name.add(r_name1);
		this.rl_name.add(r_name2);
		this.rl_name.add(r_name3);
		this.rl_name.add(r_name4);
		
		this.rl_service.add(r_service1);
		this.rl_service.add(r_service2);
		this.rl_service.add(r_service3);
		this.rl_service.add(r_service4);
	}
	
}
