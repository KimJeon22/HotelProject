package net.hb.reply;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {
	String m_id, re_content;
	Date re_date;
	int h_id, m_num, re_id;
}
