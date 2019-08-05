package net.hb.booking;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class bookingDAO {

	 @Autowired
	 SqlSessionTemplate temp;
	 	
	public void bookingInsert(bookingDTO dto) {
		temp.insert("booking.add", dto);
	}
	
	public void bookerInsert(bookerDTO dto) {
		temp.insert("booking.eradd",dto);
	}
	
}
