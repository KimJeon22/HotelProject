package net.hb.member;

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
		temp.insert("member.add", dto);
	}

	public int loginCheck(MemberDTO dto) {
		int result = 0;
		
		System.out.println(dto.getIdcnt());
		System.out.println(dto.getPwdcnt());
		dto = temp.selectOne("member.loginidCheck", dto);

		
		if (dto.getIdcnt() == 0)
			result = 1; // id가 없을 때
		else {
			dto = temp.selectOne("member.loginpwdCheck", dto);
			if (dto.getPwdcnt() == 0)
				result = 2; // password가 틀릴 때
			else
				result = 3; // id,password가 일치할 때 == 로그인 성공
		}
		return result;
	}
}
