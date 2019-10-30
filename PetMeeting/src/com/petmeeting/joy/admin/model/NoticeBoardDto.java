package com.petmeeting.joy.admin.model;

import java.io.Serializable;
import java.util.Date;

public class NoticeBoardDto implements Serializable{

	private int seq;
	private String board_code;
	private String email;
	private String title;
	private String content;
	private int readcount;
	private Date regdate;
	
	public NoticeBoardDto() {}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getBoard_code() {
		return board_code;
	}
	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public NoticeBoardDto(String email, String title, String content) {
		super();
		this.email = email;
		this.title = title;
		this.content = content;
	}
	public NoticeBoardDto(int seq, String board_code, String email, String title, String content, int readcount,
			Date regdate) {
		super();
		this.seq = seq;
		this.board_code = board_code;
		this.email = email;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NoticeBoardDto [seq=" + seq + ", board_code=" + board_code + ", email=" + email + ", title=" + title
				+ ", content=" + content + ", readcount=" + readcount + ", regdate=" + regdate + "]";
	}
	
	
}
