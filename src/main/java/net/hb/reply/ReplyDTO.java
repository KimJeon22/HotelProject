package net.hb.reply;

import java.text.SimpleDateFormat;
import java.util.Date;


public class ReplyDTO {
	String m_id, re_content,date,url;
	Date re_date;
	int h_id, m_num, re_id,re_rate,avg;
	
	
	public int getAvg() {
		return avg;
	}
	public void setAvg(int avg) {
		this.avg = avg;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getRe_rate() {
		return re_rate;
	}
	public void setRe_rate(int re_rate) {
		this.re_rate = re_rate;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public Date getRe_date() {
		return re_date;
	}
	
	public String getDate() {
		SimpleDateFormat f = new SimpleDateFormat("yy-MM-dd hh:mm");
		return f.format(re_date);
	}
	
	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}
	public int getH_id() {
		return h_id;
	}
	public void setH_id(int h_id) {
		this.h_id = h_id;
	}
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public int getRe_id() {
		return re_id;
	}
	public void setRe_id(int re_id) {
		this.re_id = re_id;
	}
	
	
}
