package com.bu.bumoim.dao;

import java.util.Map;

import com.bu.bumoim.domain.Member;

public interface UserDao {
	//
	public int login_action(Map<String, Object> requestMap);
	
	public int join(Member member);
	public Map<String, Object> login(Map<String, Object> requestMap);  
	
	public Member idDuplicationCheck(String member_id);
}