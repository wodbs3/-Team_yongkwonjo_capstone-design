package com.bu.bumoim.service.logic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.UserDao;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.service.UserService;

@Service
public class UserServiceLogic implements UserService{
	//
	@Autowired
	private UserDao userDao;
	
	@Override
	public int login_action(Map<String, Object> requestMap) {
		//
		return userDao.login_action(requestMap);
	}
	
	@Override
	public int join(Member member) {
		//
		return userDao.join(member);
	}
	
	@Override
	public Map<String, Object> login(Map<String, Object> requestMap) {
		return userDao.login(requestMap);
	}
	
	@Override
	public Member idDuplicationCheck(String member_id) {
		return userDao.idDuplicationCheck(member_id);
	}
}
