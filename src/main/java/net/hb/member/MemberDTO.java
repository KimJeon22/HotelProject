package net.hb.member;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDTO {
	int m_num, m_phone;
	String m_id, m_pwd, m_name;
}
