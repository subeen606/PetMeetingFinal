package com.petmeeting.joy.mypage.model;

import java.io.Serializable;

public class MypagemylikefreeboardDto implements Serializable {

	
	private String email;
	private String category;
	private String selection;
	private String board_code;
	
	public MypagemylikefreeboardDto() {
		
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

	public String getSelection() {
		return selection;
	}

	public void setSelection(String selection) {
		this.selection = selection;
	}

	public String getBoard_code() {
		return board_code;
	}

	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}

	public MypagemylikefreeboardDto(String email, String category, String selection, String board_code) {
		super();
		this.email = email;
		this.category = category;
		this.selection = selection;
		this.board_code = board_code;
	}

	@Override
	public String toString() {
		return "MypagemylikefreeboardDto [email=" + email + ", category=" + category + ", selection=" + selection
				+ ", board_code=" + board_code + "]";
	}
	
}
