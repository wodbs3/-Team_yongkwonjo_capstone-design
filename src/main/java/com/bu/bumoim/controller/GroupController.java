package com.bu.bumoim.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.GalleryCriteria;
import com.bu.bumoim.paging.GalleryPageMaker;
import com.bu.bumoim.paging.PageMaker;
import com.bu.bumoim.service.GalleryService;
import com.bu.bumoim.service.GroupService;
import com.bu.bumoim.service.UserService;
import com.bu.bumoim.service.BoardService;

@Controller
@RequestMapping("group")
public class GroupController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	private GroupService groupService;
	@Autowired
	private GalleryService galleryService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/GroupList.do")
	public ModelAndView grouplist(GroupList grouplist, String member_id, Model model,@ModelAttribute("cri") Criteria cri) {
		//
		List<GroupList> list = groupService.selectGroupList(cri);
		List<Member> memberList = userService.getMemberList(member_id);
		
		ModelAndView mav = new ModelAndView("group/grouplist");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		mav.addObject("GroupList", list);
		mav.addObject("memberList", memberList);
		mav.addObject("pageMaker", pageMaker);
		
		return mav;
	}
	
	@RequestMapping(value="/GroupCreate.do", method=RequestMethod.GET)
	public String group_groupcreate() {
		return "group/groupcreate";
	}
	
	@RequestMapping(value="/GroupCreate.do", method=RequestMethod.POST)
	public String groupcreate(GroupList grouplist, Model model) {
		int insertResult = groupService.insertGroup(grouplist);
		if (insertResult == 1) {
			logger.info("洹몃９�깮�꽦~~~~!");
		}else {
			logger.info("�떎�뙣�뻽吏�濡�~~~~~!!!!!!!!!!!!!!!!!!!!!!1");
		}
		return "redirect:GroupList.do";
	}
	
	//洹몃９ 以묐났泥댄겕
	@ResponseBody
	@RequestMapping(value="/groupDuplicationCheck.do", method=RequestMethod.POST)
	public int idDuplicationCheck(HttpServletRequest request, Model model) {
		//
		String grouplist_name = request.getParameter("grouplist_name");
		GroupList grouplist = groupService.groupDuplicationCheck(grouplist_name);
		
		if(grouplist != null) {
			logger.info("洹몃９�씠由� 以묐났 �궗�슜遺덇�");
			return 0;
		} else {
			logger.info("洹몃９�씠由� �궗�슜媛��뒫");
			return 1;
		}
	}

	// 洹몃９ => 洹몃９�젙蹂�
	@RequestMapping(value = "/groupInfo.do", method=RequestMethod.GET)
	public String groupInfoView(int groupList_number, Model model, @ModelAttribute("cri") GalleryCriteria cri) {
		//媛ㅻ윭由�
		List<Gallery> galleryList = galleryService.getGroupGallery(groupList_number, cri);
		logger.info(galleryList.toString());
		
		//寃뚯떆�뙋
		List<Board> boardList = boardService.selectGroupBoardList(groupList_number);
		GroupList groupDetail = groupService.findGroupDetail(groupList_number);
		
		//紐⑥엫�쉶�썝
		List<Member> groupMemberList = groupService.getGroupMemberList(groupList_number);
		logger.info(groupMemberList.toString());
		
		GalleryPageMaker pageMaker = new GalleryPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		model.addAttribute("groupDetail", groupDetail);
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("groupMemberList" , groupMemberList);
		
		return "group/groupInfo2";
	}
	
	// 洹몃９ 由ъ뒪�듃 => 洹몃９ 媛��엯�븯湲�
	@RequestMapping(value="/groupJoin.do", method=RequestMethod.GET)
	public String groupJoinView(int groupList_number, String member_id) {
		//
		System.out.println("999999999999999999999999999999999999999999999999");
		System.out.println(groupList_number + " " + member_id);
		groupService.groupJoin(groupList_number, member_id);
		
		return "group/groupJoin";
	}
}
