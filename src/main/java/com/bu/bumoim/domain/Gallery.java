package com.bu.bumoim.domain;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Gallery {
	//
	private int num;
	private String content;
	private String writer;
	private Date regDate;
	private String fileName;
	private int groupList_number;
	private String oriName;
	
	
	public int getGroupList_number() {
		return groupList_number;
	}

	public void setGrouplist_number(int groupList_number) {
		this.groupList_number = groupList_number;
	}

	private MultipartFile[] files;
	
	

	public Gallery() {
		
	}
	
	public Gallery(String fileName, String content, Date regDate, String writer, String oriName) {
		this.fileName = fileName;
		this.content = content;
		this.regDate = regDate;
		this.writer = writer;
		this.oriName = oriName;
	}
		
	
	public Gallery(String fileName, String content, Date regDate, String writer, int num) {
		this.fileName = fileName;
		this.content = content;
		this.regDate = regDate;
		this.writer = writer;
		this.num = num;
	}
	public MultipartFile[] getFiles() {
		return files;
	}

	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}

	public int getNum() {
		return num;
	}
	
	public void setNum(int num) {
		this.num = num;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	
	@Override
	public String toString() {
		//
		StringBuilder builder = new StringBuilder();
		
		builder.append("gallery num: ").append(num);
		builder.append(", gallery writer: ").append(writer);
		builder.append(", gallery groupList_number: ").append(groupList_number);
		
		return builder.toString();
	}

	public String getOriName() {
		return oriName;
	}

	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
}