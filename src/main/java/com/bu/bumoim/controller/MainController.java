package com.bu.bumoim.controller;

//import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//
//	private Logger logger = Logger.getLogger(getClass());
	
	// ����
	@RequestMapping(value="/index")
	public String main() {
		//
		return "main/main";
	}
	
	// �α���
	@RequestMapping(value="/login")
	public String login() {
		//
		return "main/login";
	}
}
