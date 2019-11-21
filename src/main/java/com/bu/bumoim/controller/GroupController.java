package com.bu.bumoim.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.domain.GroupList;
import com.bu.bumoim.domain.Member;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.GalleryCriteria;
import com.bu.bumoim.paging.GalleryPageMaker;
import com.bu.bumoim.paging.PageMaker;
import com.bu.bumoim.service.BoardService;
import com.bu.bumoim.service.GalleryService;
import com.bu.bumoim.service.GroupService;
import com.bu.bumoim.service.UserService;

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
	
	@Resource(name = "uploadPath") // bean�뜝�럩踰� id�뤆�룊�삕 uploadPath�뜝�럩逾� �뜝�럡臾뜹윜諛몄굡�뜝�룞�삕 嶺뚣�볦굣占쏙옙
	String uploadPath;
	
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
	public String groupcreate(HttpServletRequest req, GroupList grouplist, Model model) {
		grouplist = fileUpload(req, grouplist);
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
	public String groupInfoView(int groupList_number, Model model, @ModelAttribute("cri") GalleryCriteria cri, @ModelAttribute("boardCri") Criteria boardCri) {
		//媛ㅻ윭由�
		
		
		List<Gallery> galleryList = galleryService.getGroupGallery(groupList_number, cri);
		logger.info(galleryList.toString());
		
		//寃뚯떆�뙋
		List<Board> boardList = boardService.selectGroupBoardList(groupList_number, boardCri);
		GroupList groupDetail = groupService.findGroupDetail(groupList_number);
		
		//紐⑥엫�쉶�썝
		List<Member> groupMemberList = groupService.getGroupMemberList(groupList_number);
		logger.info(groupMemberList.toString());
		
		PageMaker boardPageMaker = new PageMaker();
		boardPageMaker.setCri(boardCri);
		boardPageMaker.setTotalCount(100);
		
		
		GalleryPageMaker pageMaker = new GalleryPageMaker();		
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		model.addAttribute("groupDetail", groupDetail);
		model.addAttribute("galleryList", galleryList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("boardPageMaker", boardPageMaker);
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
	
	public GroupList fileUpload(HttpServletRequest req, GroupList groupList) {
		try {
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req;
			Iterator iter = mhsr.getFileNames();
			MultipartFile uploadFile = null;

			// create directory
			File dir = new File(uploadPath);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			while (iter.hasNext()) {
				String fieldName = (String) iter.next(); // 占쎄땀占쎌뒠占쎌뱽 揶쏉옙占쎌죬占쏙옙占쎄퐣
				uploadFile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // 占쎈립疫뀐옙�댆醫롮춾 獄쎻뫗占�

				// 占쎈솁占쎌뵬筌뤿굞�뵠 占쎈씨占쎈뼄筌롳옙
				if ("".equals(origName)) {
					continue;
				}

				// 占쎈솁占쎌뵬 筌륅옙 癰귨옙野껓옙(uuid嚥∽옙 占쎈릊占쎌깈占쎌넅)
				String ext = origName.substring(origName.lastIndexOf('.')); // 占쎌넇占쎌삢占쎌쁽
				String saveFileName = getUuid() + ext;

				// 占쎄퐬占쎌젟占쎈립 path占쎈퓠 占쎈솁占쎌뵬占쏙옙占쎌삢
				File serverFile = new File(uploadPath + File.separator + saveFileName);
				uploadFile.transferTo(serverFile);
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());

				groupList = new GroupList(groupList.getGrouplist_name(), groupList.getGrouplist_introduce(), groupList.getGrouplist_interest(), saveFileName);
				
			
			}

		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}

		
			return groupList;
	}

	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
