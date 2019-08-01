package net.hb.crud;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

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
	
	public int dbCount() {
		int cnt = temp.selectOne("board.countAll");
		return cnt;
	}
	
	public BoardDTO dbDetail(int data) {
		BoardDTO list = temp.selectOne("board.detail", data);
		return list;
	}

	
}
