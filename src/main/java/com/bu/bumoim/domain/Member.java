package com.bu.bumoim.domain;

public class Member {
	//
	private String member_id;
	private String member_pw;
	private String member_studentId;
	private String member_name;
	private String member_department;
	private String member_interest;
	private String member_gender;
	private String member_birth;
	private String member_email;
	private String fileName;
	private int group1;
	private int group2;
	private int group3;
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_pw() {
		return member_pw;
	}
	
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	
	public String getMember_studentId() {
		return member_studentId;
	}
	
	public void setMember_studentId(String member_studentId) {
		this.member_studentId = member_studentId;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	
	public String getMember_department() {
		return member_department;
	}
	
	public void setMember_department(String member_department) {
		this.member_department = member_department;
	}
	
	public String getMember_interest() {
		return member_interest;
	}
	
	public void setMember_interest(String member_interest) {
		this.member_interest = member_interest;
	}
	
	public String getMember_gender() {
		return member_gender;
	}
	
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	
	public String getMember_birth() {
		return member_birth;
	}
	
	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}
	
	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	
	public int getGroup1() {
		return group1;
	}
	
	public void setGroup1(int group1) {
		this.group1 = group1;
	}
	
	public int getGroup2() {
		return group2;
	}
	
	public void setGroup2(int group2) {
		this.group2 = group2;
	}
	
	public int getGroup3() {
		return group3;
	}
	
	public void setGroup3(int group3) {
		this.group3 = group3;
	}
	
	@Override
	public String toString() {
		//
		StringBuilder builder = new StringBuilder();
		
		builder.append("member id: ").append(member_id);
		builder.append(", name: ").append(member_name);
		builder.append(", email: ").append(member_email);
		
		return builder.toString();
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


}