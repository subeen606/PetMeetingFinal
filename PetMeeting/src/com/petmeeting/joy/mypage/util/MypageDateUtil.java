package com.petmeeting.joy.mypage.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.petmeeting.joy.playboard.model.PlayboardDto;

public class MypageDateUtil {

	private Date d;
	private String title;
	private String location;
	

	
	public Date getD() {
		return d;
	}
	public void setD(Date d) {
		this.d = d;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public static String ReduceTitle(String title) {	
		String str = "";		
		if(title.length() > 18) {
			str = title.substring(0, 15) + "...";	
			
		}else {
			str = title.trim();
		}
		return str;
	}
	
	public static String ConvertDate(Date pdate) {
		SimpleDateFormat playDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		
		return playDate.format(pdate);
	}
	
	public String getDateString() {
		String week = null;
		SimpleDateFormat ppdate = new SimpleDateFormat("yyyy년 MM월 dd일");
		System.out.println("요일 확인 좀 합시다 " + d.getDay());
		switch(d.getDay()) {
			case 0:
				week = " (일)";
				break;
			case 1:
				week = " (월)";
				break;
			case 2:
				week = " (화)";
				break;
			case 3:
				week = " (수)";
				break;
			case 4:
				week = " (목)";
				break;
			case 5:
				week = " (금)";
				break;
			case 6:
				week = " (토)";
				break;
		}
			week = ppdate.format(d) + week;

		return week;
	}
	
	public String getSimpleLoc() {
		
		String locSplit[] = location.split(" ");
		
		return locSplit[0]+" "+locSplit[1];
	}
}
