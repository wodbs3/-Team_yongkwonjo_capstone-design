package com.bu.bumoim.main.store;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainStore {

   @Autowired
   private SqlSession sqlSession;
   
   public Map<String, Object> login(Map<String, Object> requestMap){
      return sqlSession.selectOne("login.loginAction", requestMap);
      
   }
   
   public int login_action(Map<String, Object> requestMap) {
      // TODO Auto-generated method stub
      return sqlSession.selectOne("login.loginActionCount", requestMap);
   }
}