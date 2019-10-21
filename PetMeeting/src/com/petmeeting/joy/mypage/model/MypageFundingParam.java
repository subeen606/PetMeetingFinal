package com.petmeeting.joy.mypage.model;

import java.io.Serializable;

public class MypageFundingParam implements Serializable {

	 private int seq;
	 private String title;
	 private String thumbnail;
	 private int max_price;
	 private int current_price;
	 private int personcount;
	 private int likecount;
	 private String sdate;
	 private String edate;
	 private int donation;
	 
	 public MypageFundingParam() {

	 }

	public MypageFundingParam(int seq, String title, String thumbnail, int max_price, int current_price,
			int personcount, int likecount, String sdate, String edate, int donation) {
		super();
		this.seq = seq;
		this.title = title;
		this.thumbnail = thumbnail;
		this.max_price = max_price;
		this.current_price = current_price;
		this.personcount = personcount;
		this.likecount = likecount;
		this.sdate = sdate;
		this.edate = edate;
		this.donation = donation;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public int getMax_price() {
		return max_price;
	}

	public void setMax_price(int max_price) {
		this.max_price = max_price;
	}

	public int getCurrent_price() {
		return current_price;
	}

	public void setCurrent_price(int current_price) {
		this.current_price = current_price;
	}

	public int getPersoncount() {
		return personcount;
	}

	public void setPersoncount(int personcount) {
		this.personcount = personcount;
	}

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	@Override
	public String toString() {
		return "MypageFundingParam [seq=" + seq + ", title=" + title + ", thumbnail=" + thumbnail + ", max_price="
				+ max_price + ", current_price=" + current_price + ", personcount=" + personcount + ", likecount="
				+ likecount + ", sdate=" + sdate + ", edate=" + edate + ", donation=" + donation + "]";
	}
	 
	 
}
