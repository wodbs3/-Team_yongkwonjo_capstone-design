package com.bu.bumoim.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.paging.PageMaker;
import com.bu.bumoim.service.BoardService;
import com.bu.bumoim.service.CommentService;

@Controller
public class BoardController {

	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	private BoardService boardservice;
	@Autowired
	private CommentService commentService;
	
	@Resource(name = "uploadPath")
	String uploadPath;
	private ModelAndView mav;
	
	
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView list(Board board, @ModelAttribute("cri") Criteria cri, HttpServletRequest request)  {
		
		List<Board> list = boardservice.selectBoardList(cri);
//		List<Board> lists = boardservice.selectgetCount(board_number);
		ModelAndView mav = new ModelAndView("board/List");
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		mav.addObject("Board", list);
		mav.addObject("pageMaker2", pageMaker);
		
		return mav;
	}
	
	/**Write*/
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
    public String boardwrite_view(Model model, int groupList_number){
		model.addAttribute("groupList_number", groupList_number);
        return "board/Write";
    }
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.POST)
	public String board_Write(Board board, HttpServletRequest req, Model model, int groupList_number) {
		
		board = fileUpload(req,board);
		board.setgroupList_number(groupList_number);
		logger.info("3333333333333333333333333333333333333333333333333");
		logger.info("域밸챶竊� 占쎄퐜甕곤옙 =========" + groupList_number);
		logger.info("3333333333333333333333333333333333333333333333333");
		
		boardservice.insertBoard(board);
		model.addAttribute("groupList_number", groupList_number);
		return "redirect:/group/groupInfo.do?groupList_number=" + groupList_number + "#board";
	}
  
	
	@RequestMapping(value="/boardDetail.do", method=RequestMethod.GET) 
	public ModelAndView board_detail(Model model, int board_number, HttpSession session, HttpServletRequest request,HttpServletResponse response, Board board_detail, int groupList_number) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		
		List<Comment> comment = commentService.boardCommentList(board_number);
		int board_count = 0;
		boardservice.boardCount(board_number);
		model.addAttribute("board_count", board_count);
		Board board = boardservice.detailBoard(board_number);
		logger.info("癰귣�諭띰옙沅볢쳸占�: " + board.getboard_number());
		
		mav.setViewName("board/Detail");
		mav.addObject("Board", board);
		mav.addObject("commentList",comment);
//		model.addAttribute("groupList_number", groupList_number);
		
		return mav;
	}
    

	@RequestMapping(value ="/boardUpdate.do", method= RequestMethod.GET)
	public String board_update(HttpSession session, int board_number, Model model) throws Exception {
		

			model.addAttribute("Board", boardservice.detailBoard(board_number));
			
			return "board/Update";
	}
	
	@RequestMapping(value ="/boardModify.do", method= RequestMethod.POST)
	public String board_modify(Board board, int groupList_number) throws Exception {
		
		
		boardservice.updateBoard(board);
		return "redirect:boardDetail.do?groupList_number="+board.getgroupList_number()+ "&board_number="+ board.getboard_number();
	}
	
	
	
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.GET)
	public String board_delete(Board board, HttpSession session, int board_number, int groupList_number) throws Exception {
		
		int deleteResult = boardservice.deleteBoard(board_number);
		
		if (deleteResult == -1) {
			logger.info("Insert~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11~~~~~~");
		}else {
			logger.info("FAIL~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~~~~~~~~~~");
		}
		
		return  "redirect:/group/groupInfo.do?groupList_number=" + groupList_number +"&board_number="+ board_number;
	}
	
	
	public Board fileUpload(HttpServletRequest req, Board board) {
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
				String fieldName = (String) iter.next(); // �뜝�럡���뜝�럩�뮔�뜝�럩諭� �뤆�룊�삕�뜝�럩二у뜝�룞�삕�뜝�럡�맋
				uploadFile = mhsr.getFile(fieldName);
				String origName;
				origName = new String(uploadFile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); // �뜝�럥由썹뼨�먯삕占쎈뙀�넫濡�異� �뛾�렮維쀥뜝占�
				logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> origName: " + origName);
				if ("".equals(origName)) {
					continue;
				}

				String ext = origName.substring(origName.lastIndexOf('.')); // �뜝�럩�꼪�뜝�럩�궋�뜝�럩�겱
				String saveFileName = origName + ext;

				File serverFile = new File(uploadPath + File.separator + saveFileName);
				uploadFile.transferTo(serverFile);
				logger.info("path: " + uploadFile);
				logger.info("fileName: " + uploadFile.getOriginalFilename());

				board = new Board(saveFileName, board.getboard_title(), board.getboard_content(), board.getboard_date(), board.getboard_writer());
				
			
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

		return board;
		
	}
	
	private static String getUuid() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	
		   
}
