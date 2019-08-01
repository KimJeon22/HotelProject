package net.hb.booking;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class BoardDAO1 {

	@Inject
	@Autowired
	SqlSessionTemplate temp;

	public void boardInsert(HotelDTO hdto, RoomDTO rdto) {
		SelectSort sort = new SelectSort();
		
		temp.insert("board1.hotelAdd", hdto);

		rdto = sort.SelectSort(rdto);

		for (int i = 0; i < rdto.getRl_price().size(); i++) {
			if (i == 0) {
				rdto.setH_name(hdto.getH_name());
				rdto.setR_cheap("c");
				rdto.setR_inwon(rdto.getRl_inwon().get(i));
				rdto.setR_price(rdto.getRl_price().get(i));
				rdto.setR_name(rdto.getRl_name().get(i));
				rdto.setR_service(rdto.getRl_service().get(i));
				temp.insert("board1.roomAdd",rdto);
			} else {
				rdto.setH_name(hdto.getH_name());
				rdto.setR_cheap("d");
				rdto.setR_inwon(rdto.getRl_inwon().get(i));
				rdto.setR_price(rdto.getRl_price().get(i));
				rdto.setR_name(rdto.getRl_name().get(i));
				rdto.setR_service(rdto.getRl_service().get(i));
				temp.insert("board1.roomAdd",rdto);
			}
		}

	}
}
