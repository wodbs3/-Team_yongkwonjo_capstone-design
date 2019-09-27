package com.bu.bumoim.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	

	//메인
	@RequestMapping(value="/index")
	public String main() {

		return "main/main";
	}
	
	@RequestMapping(value="/login")
	public String login() {
		
		return "main/login";
	}
}
