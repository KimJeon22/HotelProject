package net.hb.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import net.hb.booking.RoomDTO;

@Repository
@Component
public class MemberDAO {

	@Autowired
	SqlSessionTemplate temp;
	MemberDTO dto;

	public void dbInsert(MemberDTO dto) {
		temp.insert("member.add", dto);
	}
	
	public List<MemberDTO> memberSelect(String m_id) {
		List<MemberDTO> list = temp.selectList("member.select", m_id);
		System.out.println(list.get(0));
		return list;
	}

	public int loginCheck(MemberDTO dto) {
		int result = 0;
		int a=0,b=0;
		
		a = temp.selectOne("member.loginidCheck", dto);
		dto.setIdcnt(a);
		
		if (dto.getIdcnt() == 0)
			result = 1; // id�� ���� ��
		else {
			b = temp.selectOne("member.loginpwdCheck", dto);
			dto.setPwdcnt(b);
			if (dto.getPwdcnt() == 0)
				result = 2; // password�� Ʋ�� ��
			else
				result = 3; // id,password�� ��ġ�� �� == �α��� ����
		}
		return result;
	}
}
