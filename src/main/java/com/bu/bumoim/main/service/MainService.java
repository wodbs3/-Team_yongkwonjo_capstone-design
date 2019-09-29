package com.bu.bumoim.main.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.main.store.MainStore;

@Repository
public class MainService {

   
   @Autowired
   private MainStore mainStore;
   
   public Map<String, Object> login(Map<String,Object> requestMap) {
      return mainStore.login(requestMap);
   }
   
   public int login_action(Map<String, Object> requestMap) {
      return mainStore.login_action(requestMap);
   }
}