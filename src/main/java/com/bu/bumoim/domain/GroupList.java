package com.bu.bumoim.domain;

import java.sql.Date;

public class GroupList {
	//
	private int grouplist_number;
	private String grouplist_name;
	private String grouplist_introduce;
	private String grouplist_interest;
	private int grouplist_people;
	private Date grouplist_date;
	private String grouplist_photo;
	
	public GroupList() {
		
	}
	public GroupList(String grouplist_name, String grouplist_introduce, String grouplist_interest, String grouplist_photo) {
		this.grouplist_name = grouplist_name;
		this.grouplist_introduce = grouplist_introduce;
		this.grouplist_interest = grouplist_interest;
		this.grouplist_photo = grouplist_photo;
	}
	
	public String getGrouplist_photo() {
		return grouplist_photo;
	}
	public void setGrouplist_photo(String grouplist_photo) {
		this.grouplist_photo = grouplist_photo;
	}
	public int getGrouplist_number() {
		return grouplist_number;
	}
	public void setGrouplist_number(int grouplist_number) {
		this.grouplist_number = grouplist_number;
	}
	public String getGrouplist_name() {
		return grouplist_name;
	}
	public void setGrouplist_name(String grouplist_name) {
		this.grouplist_name = grouplist_name;
	}
	public String getGrouplist_introduce() {
		return grouplist_introduce;
	}
	public void setGrouplist_introduce(String grouplist_introduce) {
		this.grouplist_introduce = grouplist_introduce;
	}
	public String getGrouplist_interest() {
		return grouplist_interest;
	}
	public void setGrouplist_interest(String grouplist_interest) {
		this.grouplist_interest = grouplist_interest;
	}
	public int getGrouplist_people() {
		return grouplist_people;
	}
	public void setGrouplist_people(int grouplist_people) {
		this.grouplist_people = grouplist_people;
	}
	public Date getGrouplist_date() {
		return grouplist_date;
	}
	public void setGrouplist_date(Date grouplist_date) {
		this.grouplist_date = grouplist_date;
	}
}