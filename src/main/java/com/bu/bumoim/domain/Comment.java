package com.bu.bumoim.domain;

import java.util.Date;

public class Comment {
	//
	private int comment_number;
	private int board_number;
	private int photo_number;
	private String comment_id;
	private String comment_content;
	private Date comment_date;
	
	
	public int getComment_number() {
		return comment_number;
	}
	public void setComment_number(int comment_number) {
		this.comment_number = comment_number;
	}
	public int getBoard_number() {
		return board_number;
	}
	public void setBoard_number(int board_number) {
		this.board_number = board_number;
	}
	public int getPhoto_number() {
		return photo_number;
	}
	public void setPhoto_number(int photo_number) {
		this.photo_number = photo_number;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
	
	
}