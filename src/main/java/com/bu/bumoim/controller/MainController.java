package com.bu.bumoim.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//
	private Logger logger = Logger.getLogger(getClass());

	//
	@RequestMapping(value="/index")
	public String main() {
		//
		return "main/main";
	}
	
	@RequestMapping(value="/login")
	public String login(HttpServletRequest request, Model model) {
	      HttpSession session = request.getSession();
	        Map<String, Object> loginMap = (Map<String, Object>) session.getAttribute("loginMap"); 
	        if(loginMap != null) {
	           model.addAttribute("loginMap", loginMap);
	        }
	        
	      return "user/login";
		
	}
}
