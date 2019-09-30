package com.bu.bumoim.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	//
	@RequestMapping(value="/login.do")
	public String login() {
		//
		return "user/login";
	}
	
	@RequestMapping(value="/join.do")
	public String join() {
		//
		return "user/join";
	}
}