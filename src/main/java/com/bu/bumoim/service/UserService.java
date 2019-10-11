package com.bu.bumoim.service;

import java.util.Map;

public interface UserService {
	//
	public Map<String, Object> login(Map<String,Object> requestMap);
	public int login_action(Map<String, Object> requestMap);
}