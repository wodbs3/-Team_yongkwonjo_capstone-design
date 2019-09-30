package com.bu.bumoim.service.logic;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.MainDao;
import com.bu.bumoim.service.MainService;

@Repository
public class MainServiceLogic implements MainService {
	//
   @Autowired
   private MainDao mainStore;
   
   public Map<String, Object> login(Map<String,Object> requestMap) {
      return mainStore.login(requestMap);
   }
   
   public int login_action(Map<String, Object> requestMap) {
      return mainStore.login_action(requestMap);
   }
}