package net.hb.member;

import lombok.Data;

@Data
public class MemberDTO {
	int m_num, m_phone, idcnt, pwdcnt;
	String m_id, m_pwd, m_name;
}
