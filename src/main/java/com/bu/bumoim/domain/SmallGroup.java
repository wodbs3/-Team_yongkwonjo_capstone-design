package com.bu.bumoim.domain;

public class SmallGroup {
	//
	private int somoim_number;
	private String somoim_name;
	private String somoim_place;
	private String somoim_map;
	private int somoim_price;
	private int somoim_people;
	private String somoim_date;
	private String somoim_latitude;
	private String somoim_longitude;
	private int grouplist_number;
	
	@Override
	public String toString() {
		//
		StringBuilder builder = new StringBuilder();
		
		builder.append("somoim_number: ").append(somoim_number);
		builder.append(", somoim_name: ").append(somoim_name);
		builder.append(", somoim_place: ").append(somoim_place);
		builder.append(", somoim_map: ").append(somoim_map);
		builder.append(", somoim_price: ").append(somoim_price);
		builder.append(", grouplist_number: ").append(grouplist_number);
		
		return builder.toString();
	}
	
	public int getSomoim_number() {
		return somoim_number;
	}
	public void setSomoim_number(int somoim_number) {
		this.somoim_number = somoim_number;
	}
	public String getSomoim_name() {
		return somoim_name;
	}
	public void setSomoim_name(String somoim_name) {
		this.somoim_name = somoim_name;
	}
	public String getSomoim_place() {
		return somoim_place;
	}
	public void setSomoim_place(String somoim_place) {
		this.somoim_place = somoim_place;
	}
	public String getSomoim_map() {
		return somoim_map;
	}
	public void setSomoim_map(String somoim_map) {
		this.somoim_map = somoim_map;
	}
	public int getSomoim_price() {
		return somoim_price;
	}
	public void setSomoim_price(int somoim_price) {
		this.somoim_price = somoim_price;
	}
	public int getSomoim_people() {
		return somoim_people;
	}
	public void setSomoim_people(int somoim_people) {
		this.somoim_people = somoim_people;
	}
	public String getSomoim_date() {
		return somoim_date;
	}
	public void setSomoim_date(String somoim_date) {
		this.somoim_date = somoim_date;
	}
	public String getSomoim_latitude() {
		return somoim_latitude;
	}
	public void setSomoim_latitude(String somoim_latitude) {
		this.somoim_latitude = somoim_latitude;
	}
	public String getSomoim_longitude() {
		return somoim_longitude;
	}
	public void setSomoim_longitude(String somoim_longitude) {
		this.somoim_longitude = somoim_longitude;
	}
	public int getGroupList_number() {
		return grouplist_number;
	}
	public void setGroupList_number(int grouplist_number) {
		this.grouplist_number = grouplist_number;
	}
}