package com.bu.bumoim.controller;

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
import com.bu.bumoim.paging.GalleryCriteria;
import com.bu.bumoim.paging.GalleryPageMaker;
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
	public ModelAndView grouplist(GroupList grouplist, String member_id, Model model) {
		//
		List<GroupList> list = groupService.selectGroupList(grouplist);
		List<Member> memberList = userService.getMemberList(member_id);
		ModelAndView mav = new ModelAndView("group/grouplist");
		
		mav.addObject("GroupList", list);
		mav.addObject("memberList", memberList);
		
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
			logger.info("그룹생성~~~~!");
		}else {
			logger.info("실패했지롱~~~~~!!!!!!!!!!!!!!!!!!!!!!1");
		}
		return "redirect:GroupList.do";
	}
	
	//그룹 중복체크
	@ResponseBody
	@RequestMapping(value="/groupDuplicationCheck.do", method=RequestMethod.POST)
	public int idDuplicationCheck(HttpServletRequest request, Model model) {
		//
		String grouplist_name = request.getParameter("grouplist_name");
		GroupList grouplist = groupService.groupDuplicationCheck(grouplist_name);
		
		if(grouplist != null) {
			logger.info("그룹이름 중복 사용불가");
			return 0;
		} else {
			logger.info("그룹이름 사용가능");
			return 1;
		}
	}

	// 그룹 => 그룹정보
	@RequestMapping(value = "/groupInfo.do", method=RequestMethod.GET)
	public String groupInfoView(int groupList_number, Model model, @ModelAttribute("cri") GalleryCriteria cri) {
		//갤러리
		List<Gallery> galleryList = galleryService.getGroupGallery(groupList_number, cri);
		System.out.println("33333333333333333333333333333333333333333333333333333333");
		logger.info(galleryList.toString());
		
		//게시판
		List<Board> boardList = boardService.selectGroupBoardList(groupList_number);
		GroupList groupDetail = groupService.findGroupDetail(groupList_number);
		
		
		GalleryPageMaker pageMaker = new GalleryPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		model.addAttribute("groupDetail", groupDetail);
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMaker);
		return "group/groupInfo2";
	}
	
	// 그룹 리스트 => 그룹 가입하기
	@RequestMapping(value="/groupJoin.do", method=RequestMethod.GET)
	public String groupJoinView() {
		return "group/groupJoin";
	}
}
