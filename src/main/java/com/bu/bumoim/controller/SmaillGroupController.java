package com.bu.bumoim.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SmaillGroupController {
	//
	@RequestMapping(value="smallGroup.do",  method=RequestMethod.GET)
	public String smallGroupMain() {
		//
		return "smallGroup/smallGroup";
	}
}