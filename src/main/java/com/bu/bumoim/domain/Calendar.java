package com.bu.bumoim.domain;

public class Calendar {
	
	private String calendar_id;
	private String member_id;
	private String calendar_title;
	private String calendar_content;
	private String calendar_rDate;
	private String calendar_wDate;
	private String calendar_color;
	
	public String getCalendar_id() {
		return calendar_id;
	}

	public void setCalendar_id(String calendar_id) {
		this.calendar_id = calendar_id;
	}

	public String getCalendar_color() {
		return calendar_color;
	}

	public void setCalendar_color(String calendar_color) {
		this.calendar_color = calendar_color;
	}

	public Calendar() {
		
	}
	
	public Calendar(String member_id, String calendar_title, String calendar_content, String calendar_rDate) {
		super();
		this.member_id = member_id;
		this.calendar_content = calendar_content;
		this.calendar_title = calendar_title;
		this.calendar_rDate = calendar_rDate;
	}
	
	public Calendar(String member_id, String calendar_title, String calendar_content, String calendar_rDate, String calendar_wDate) {
		super();
		
		this.member_id = member_id;
		this.calendar_title = calendar_title;
		this.calendar_content = calendar_content;
		this.calendar_rDate = calendar_rDate;
		this.calendar_wDate = calendar_wDate;
	}
	
	
	
	
	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_content() {
		return calendar_content;
	}

	public void setCalendar_content(String calendar_content) {
		this.calendar_content = calendar_content;
	}

	public String getCalendar_rDate() {
		return calendar_rDate;
	}

	public void setCalendar_rDate(String calendar_rDate) {
		this.calendar_rDate = calendar_rDate;
	}

	public String getCalendar_wDate() {
		return calendar_wDate;
	}

	public void setCalendar_wDate(String calendar_wDate) {
		this.calendar_wDate = calendar_wDate;
	}

	@Override
	public String toString() {
		return "Calendar [calendar_id=" + calendar_id + ", member_id=" + member_id + ", calendar_title=" + calendar_title + ","
				+ ", calendar_content=" + calendar_content + ", calendar_rDate=" + calendar_rDate + ", calendar_wDate=" + calendar_wDate + "]";	}

}
