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
	@RequestMapping(value="/index")
	public String main() {
		//
		return "main/main";
	}

	@RequestMapping(value="/introduce.do")
	public String introduce() {
		return "main/introduce";
	}
	
	
	@RequestMapping(value="/chat.do")
	public String chat() {
		return "chatting/chat";
	}
}