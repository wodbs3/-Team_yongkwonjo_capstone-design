package com.bu.bumoim.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bu.bumoim.domain.SmallGroup;
import com.bu.bumoim.service.SmallGroupService;

@Controller
public class SmallGroupController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private SmallGroupService smallGroupService;
	
	@RequestMapping(value="/smallGroup.do", method=RequestMethod.GET)
	public String smallGroupCreate() {
		//
		return "smallGroup/smallGroupCreate";
	}
	
	@RequestMapping(value="/smallGroupCreate.do", method=RequestMethod.POST)
	public String smallGroupCraete(SmallGroup smallGroup, Model model) {
		//
		int result = smallGroupService.create(smallGroup);
		
		if(result == 1) {
			logger.info("소모임 생성 성공!!!");
		} else {

			logger.info("소모임 생성 실패...!!!");
		}
		
		return "smallGroup/createSuccess";
	}
	
	@RequestMapping(value="/somoimDetail.do", method=RequestMethod.GET)
	public String smallGroupDetail(int somoim_number, Model model) {
		//
		SmallGroup smallGroupDetail = smallGroupService.readOne(somoim_number);
		logger.info(smallGroupDetail.toString());
		
		model.addAttribute("smallGroupDetail", smallGroupDetail);
		
		return "smallGroup/smallGroupInfo";
	}
}