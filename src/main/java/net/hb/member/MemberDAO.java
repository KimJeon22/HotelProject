package net.hb.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Repository
@Component
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate temp;
	MemberDTO dto;
	
	public void dbInsert(MemberDTO dto) {
		temp.insert("member.add",dto);
	}
}
