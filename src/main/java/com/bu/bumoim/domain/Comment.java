package com.bu.bumoim.domain;

import java.util.Date;

public class Comment {
	//
	private int comment_number;
	private int board_number;
	private String comment_id;
	private String comment_content;
	private Date comment_date;
	
	public int getcomment_number() {
		return comment_number;
	}
	
	public void setcomment_number(int comment_number) {
		this.comment_number = comment_number;
	}

	public int getboard_number() {
		return board_number;
	}
	
	public void setboard_number(int board_number) {
		this.board_number = board_number;
	}

	public String getcomment_id() {
		return comment_id;
	}
	
	public void setcomment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	
	public String getcomment_content() {
		return comment_content;
	}
	
	public void setcomment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	
	public Date getcomment_date() {
		return comment_date;
	}
	
	public void setcomment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
}