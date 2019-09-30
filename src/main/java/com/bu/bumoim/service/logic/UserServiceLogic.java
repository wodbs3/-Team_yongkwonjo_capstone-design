package com.bu.bumoim.service.logic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.UserDao;
import com.bu.bumoim.service.UserService;

@Repository
public class UserServiceLogic implements UserService{
	//
	@Autowired
	private UserDao userDao;
	
	public Map<String, Object> login(Map<String,Object> requestMap) {
		//
		return userDao.login(requestMap);
	}
	public int login_action(Map<String, Object> requestMap) {
		//
		return userDao.login_action(requestMap);
	}
}