package com.petmeeting.joy.mypage.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.petmeeting.joy.playboard.model.PlayboardDto;

public class MypageDateUtil {

	private Date date1;
	private Date date2;
	private Date date3;
	
	private String title;
	private String location;
	

	

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

	public Date getDate1() {
		return date1;
	}
	public void setDate1(Date date1) {
		this.date1 = date1;
	}
	public Date getDate2() {
		return date2;
	}
	public void setDate2(Date date2) {
		this.date2 = date2;
	}
	public Date getDate3() {
		return date3;
	}
	public void setDate3(Date date3) {
		this.date3 = date3;
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
	
	public String getDateString1() {
		String week = null;
		SimpleDateFormat ppdate = new SimpleDateFormat("yyyy년 MM월 dd일");
		System.out.println("요일 확인 좀 합시다 " + date1.getDay());
		switch(date1.getDay()) {
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
			week = ppdate.format(date1) + week;

		return week;
	}
	public String getDateString2() {
		String week = null;
		SimpleDateFormat ppdate = new SimpleDateFormat("yyyy년 MM월 dd일");
		System.out.println("요일 확인 좀 합시다 " + date2.getDay());
		switch(date2.getDay()) {
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
			week = ppdate.format(date2) + week;

		return week;
	}
	
	public String getSimpleLoc() {
		
		String locSplit[] = location.split(" ");
		
		return locSplit[0]+" "+locSplit[1];
	}
	
	public  int getIsEnd2(){
		Calendar c=Calendar.getInstance();
		c.setTime(date2);
		Calendar t=Calendar.getInstance();
		//오늘이 마지막날 보다 큰가?
		return Integer.parseInt(StringCal(t))>Integer.parseInt(StringCal(c))? 0:1;
	}
	public int getIsEnd3(){
		Calendar c=Calendar.getInstance();
		c.setTime(date3);
		Calendar t=Calendar.getInstance();
		//오늘이 마지막날 보다 큰가?
		return Integer.parseInt(StringCal(t))>Integer.parseInt(StringCal(c))? 0:1;
	}
	
	public static String StringCal(Calendar dd){
		String s=dd.get(Calendar.YEAR)+""+
		dd.get(Calendar.MONTH)+1+""+
		dd.get(Calendar.DATE)+"";
		return s;
	}
}
