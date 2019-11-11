package com.bu.bumoim.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bu.bumoim.domain.Member;
import com.bu.bumoim.service.UserService;

@Controller
public class UserController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/joinView.do", method=RequestMethod.GET)
	public String joinView(Model model) {
		//
		return "user/join";
	}
	
	// ID중복체크
	@ResponseBody
	@RequestMapping(value="/idDuplicationCheck.do", method=RequestMethod.POST)
	public int idDuplicationCheck(HttpServletRequest request, Model model) {
		//
		String member_id = request.getParameter("member_id");
		Member member = userService.idDuplicationCheck(member_id);
		
		if(member != null) {
			logger.info("아이디 중복 사용불가");
			return 0;
		} else {
			logger.info("아이디 사용가능");
			return 1;
		}
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(Member member, Model model) {
		//
		logger.info(member.toString());
		
		int joinResult = userService.join(member);
		if (joinResult == 1) {
			logger.info("Join Success !!!");
		} else {
			logger.info("Join Fail !!!");
		}
		
		return "user/joinSuccess";
	}
	
	@RequestMapping(value="/login.do")
	public String login() {
		
		return "user/login";
	}
	
	
	@RequestMapping(value = "/login.do" , method = RequestMethod.POST)
	public String login(HttpSession session, HttpServletRequest request, Model model) {
		Map<String, Object> requestMap = new HashMap<String, Object>();
		requestMap.put("member_id", request.getParameter("member_id"));
		requestMap.put("member_pw", request.getParameter("member_pw"));
		int result = userService.login_action(requestMap);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result == 1) {
			resultMap = userService.login(requestMap);
			request.getSession().setAttribute("loginMap", resultMap);
			resultMap.put("result", "success");
		}else {
			logger.info("로그인실패");
			resultMap.put("result", "fail");
		}
		
		return "redirect:/index.do";
	}
	
	@RequestMapping(value = "logout.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String logout(HttpSession session, Member member) {
	      
		session.invalidate();
	
		return "redirect:/index.do";
	}

	@RequestMapping(value = "mypage.do")
		public String mypage(HttpSession session) {
		
		return "user/mypage";
	}
}
