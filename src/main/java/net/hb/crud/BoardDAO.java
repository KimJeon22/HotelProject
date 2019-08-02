package net.hb.crud;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.booking.RoomDTO;
import net.hb.booking.SelectSort;

@Repository
@Component
public class BoardDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;

	public List<BoardDTO> dbSelect(int start, int end, String adress) {
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setH_adress(adress);
		List<BoardDTO> list = temp.selectList("board.selectAll", dto);
		return list;
	}

	public List<BoardDTO> dbDetailSelect(int start, int end, String adress, int rate) {
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		dto.setH_adress(adress);
		dto.setH_rate(rate);
		List<BoardDTO> list = temp.selectList("board.selectDetail", dto);
		return list;
	}

	public int dbCount() {
		int cnt = temp.selectOne("board.countAll");
		return cnt;
	}

	public BoardDTO dbDetail(int data) {
		BoardDTO list = temp.selectOne("board.detail", data);
		return list;
	}

	public void dbInsert(BoardDTO hdto, RoomDTO rdto) {
		SelectSort sort = new SelectSort();

		temp.insert("board.hotelAdd", hdto);

		rdto = sort.SelectSort(rdto);

		for (int i = 0; i < rdto.getRl_price().size(); i++) {
			if (i == 0) {
				rdto.setH_name(hdto.getH_name());
				rdto.setR_cheap("c");
				rdto.setR_inwon(rdto.getRl_inwon().get(i));
				rdto.setR_price(rdto.getRl_price().get(i));
				rdto.setR_name(rdto.getRl_name().get(i));
				rdto.setR_service(rdto.getRl_service().get(i));
				temp.insert("room.roomAdd", rdto);
			} else {
				rdto.setH_name(hdto.getH_name());
				rdto.setR_cheap("d");
				rdto.setR_inwon(rdto.getRl_inwon().get(i));
				rdto.setR_price(rdto.getRl_price().get(i));
				rdto.setR_name(rdto.getRl_name().get(i));
				rdto.setR_service(rdto.getRl_service().get(i));
				temp.insert("room.roomAdd", rdto);
			}
		}

	}

}
