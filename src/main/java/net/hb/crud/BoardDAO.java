package net.hb.crud;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class BoardDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	BoardDTO dto;
	
	public List<BoardDTO> dbSelect() {
		List<BoardDTO> list = temp.selectList("board.selectAll");
		return list;
	}
	
	public BoardDTO dbDetail(String title) {
		BoardDTO list = (BoardDTO) temp.selectOne("board.detail", title);
		return list;
	}
}
