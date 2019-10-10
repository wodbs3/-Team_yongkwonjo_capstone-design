package com.bu.bumoim.dao.logic;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.UserDao;
import com.bu.bumoim.domain.Member;

@Repository
public class UserDaoLogic implements UserDao {
	//
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, Object> login(Map<String, Object> requestMap){
		//
		return sqlSession.selectOne("login.loginAction", requestMap);
	}

	@Override
	public int login_action(Map<String, Object> requestMap) {
		//
		return sqlSession.selectOne("login.loginActionCount", requestMap);
	}

	@Override
	public int join(Member member) {
		//		
		return sqlSession.insert("login.insertMember", member);
	}
}