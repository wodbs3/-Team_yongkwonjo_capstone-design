package com.bu.bumoim.domain;

import java.util.Date;

public class Comment {
	//
	private int commentNumber;
	private int boardNumber;
	private int photoNumber;
	private String id;
	private String content;
	private Date date;
	
	public int getCommentNumber() {
		return commentNumber;
	}
	
	public void setCommentNumber(int commentNumber) {
		this.commentNumber = commentNumber;
	}
	
	public int getBoardNumber() {
		return boardNumber;
	}
	
	public void setBoardNumber(int boardNumber) {
		this.boardNumber = boardNumber;
	}
	
	public int getPhotoNumber() {
		return photoNumber;
	}
	
	public void setPhotoNumber(int photoNumber) {
		this.photoNumber = photoNumber;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public Date getDate() {
		return date;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
}