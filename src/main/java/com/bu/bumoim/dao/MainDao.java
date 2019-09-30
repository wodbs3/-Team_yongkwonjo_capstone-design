package com.bu.bumoim.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public interface MainDao {
	//
	public Map<String, Object> login(Map<String, Object> requestMap);   
	public int login_action(Map<String, Object> requestMap);
}