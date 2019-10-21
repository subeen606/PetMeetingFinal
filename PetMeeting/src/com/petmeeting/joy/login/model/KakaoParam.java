package com.petmeeting.joy.login.model;

public class KakaoParam {

	private String email;
	private String nickname;
	private String myprofile_img;
	
	public KakaoParam() {
		// TODO Auto-generated constructor stub
	}
	
	public KakaoParam(String email, String nickname, String myprofile_img) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.myprofile_img = myprofile_img;
	}
	
	public KakaoParam(String email, String myprofile_img) {
		super();
		this.email = email;
		this.myprofile_img = myprofile_img;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getMyprofile_img() {
		return myprofile_img;
	}

	public void setMyprofile_img(String myprofile_img) {
		this.myprofile_img = myprofile_img;
	}

	@Override
	public String toString() {
		return "kakaoParam [email=" + email + ", nickname=" + nickname + ", myprofile_img=" + myprofile_img + "]";
	}
	
	
	
	
}
