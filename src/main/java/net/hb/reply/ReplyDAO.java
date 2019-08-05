package net.hb.reply;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class ReplyDAO {

	@Inject
	@Autowired
	SqlSessionTemplate temp;

	public List<ReplyDTO> dbreplySelect(int h_id) {
		List<ReplyDTO> list = temp.selectList("reply.replySelect", h_id);
		return list;
	}

	public void dbInsert(ReplyDTO dto) {
		temp.insert("reply.replyAdd", dto);
	}

}
