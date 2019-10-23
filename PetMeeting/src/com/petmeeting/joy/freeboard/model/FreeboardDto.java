package com.petmeeting.joy.freeboard.model;

import java.io.Serializable;

public class FreeboardDto implements Serializable {

	private int seq;
	private String board_code;
	private String email;
	private String category;
	private String title;
	private String content;
	private int readcount;
	private int likecount;
	private int reportcount;
	private String regdate;
	private int del;
	
	public FreeboardDto() {

	}

	public FreeboardDto(int seq, String board_code, String email, String category, String title, String content,
			int readcount, int likecount, int reportcount, String regdate, int del) {
		super();
		this.seq = seq;
		this.board_code = board_code;
		this.email = email;
		this.category = category;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.likecount = likecount;
		this.reportcount = reportcount;
		this.regdate = regdate;
		this.del = del;
	}

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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public int getReportcount() {
		return reportcount;
	}

	public void setReportcount(int reportcount) {
		this.reportcount = reportcount;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "FreeBoardDto [seq=" + seq + ", board_code=" + board_code + ", email=" + email + ", category=" + category
				+ ", title=" + title + ", content=" + content + ", readcount=" + readcount + ", likecount=" + likecount
				+ ", reportcount=" + reportcount + ", regdate=" + regdate + ", del=" + del + "]";
	}
	
	
}
