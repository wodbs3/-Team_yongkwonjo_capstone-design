package com.bu.bumoim.domain;

import java.sql.Date;

public class Board {
	//
	private int board_number;
	private String board_title;
	private String board_content;
	private String board_writer;
	private String board_photo;
	private Date board_date;

	
	public Board() {
	
	}
	
	public Board(String board_photo, String board_title, String board_content, Date board_date, String board_writer) {
		this.board_photo = board_photo;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_writer = board_writer;
	}
	public Board(String board_photo, String board_title, String board_content, Date board_date, String board_writer, int board_number) {
		this.board_photo = board_photo;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_date = board_date;
		this.board_writer = board_writer;
		this.board_number = board_number;
	}
	
	public int getboard_number() {
		return board_number;
	}
	public void setboard_number(int board_number) {
		this.board_number = board_number;
	}
	
	public String getboard_title() {
		return board_title;
	}
	
	public void setboard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getboard_content() {
		return board_content;
	}
	
	public void setboard_content(String board_content) {
		this.board_content = board_content;
	}
	
	public String getboard_writer() {
		return board_writer;
	}
	
	public void setboard_writer(String board_writer) {
		this.board_writer = board_writer;
	}
	
	public String getboard_photo() {
		return board_photo;
	}
	
	public void setboard_photo(String board_photo) {
		this.board_photo = board_photo;
	}
	
	public Date getboard_date() {
		return board_date;
	}
	
	public void setboard_date(Date board_date) {
		this.board_date = board_date;
	}

}
