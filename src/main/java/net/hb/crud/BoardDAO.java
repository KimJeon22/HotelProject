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
	
	public List<BoardDTO> dbSelect(int start, int end) {
		BoardDTO dto = new BoardDTO();
		dto.setStart(start);
		dto.setEnd(end);
		List<BoardDTO> list = temp.selectList("board.selectAll", dto);
		System.out.println("asdasd");
		return list;
	}
	
	public int dbCount() {
		int cnt = temp.selectOne("board.countAll");
		return cnt;
	}
	
	public BoardDTO dbDetail(String title) {
		BoardDTO list = (BoardDTO) temp.selectOne("board.detail", title);
		return list;
	}
}
