package com.bu.bumoim.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView list(Board board, @ModelAttribute("cri") Criteria cri, HttpServletRequest request) {
		
		List<Board> list = boardservice.selectBoardList(cri);
//		List<Board> lists = boardservice.selectgetCount(board_number);
		ModelAndView mav = new ModelAndView("board/List");
//		int resultCount = boardservice.selectgetCount(board_number);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(100);
		
		
		mav.addObject("Board", list);
		mav.addObject("pageMaker", pageMaker);
		
		
//		
//		logger.info("�쟾泥� 移댁슫�꽣 踰덊샇 : " + resultCount);
//		
//		PageMaker pageMaker = new PageMaker();
//		pageMaker.setCri(cri);
//		pageMaker.setTotalCount(resultCount);
//		
//		int pagestart = cri.getPageStart();
//		
//		logger.info("�떆�옉踰덊샇: " + pagestart);
//		
//		int perPageNum = cri.getPerPageNum();
		
		
		return mav;
	}
	
	/**Write*/
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.GET)
    public String boardwrite_view(){
        
        return "board/Write";
    }
	
	@RequestMapping(value="/boardWrite.do", method=RequestMethod.POST)
	public String board_Write(Board board, Model model) {
		int insertResult = boardservice.insertBoard(board);
		if (insertResult == 1) {
			logger.info("Insert~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11~~~~~~");
		}else {
			logger.info("FAIL~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~~~~~~~~~~");
		}
		return "redirect:/boardList.do";
	}
  
	
	@RequestMapping(value="/boardDetail.do", method=RequestMethod.GET)
	public ModelAndView board_detail(@RequestParam int board_number, HttpSession session) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/Detail");
		mav.addObject("Board", boardservice.detailBoard(board_number));
		
		return mav;
	}
    
	@RequestMapping(value ="/boardUpdate.do", method= RequestMethod.GET)
	public String board_update(HttpSession session, int board_number, Model model) throws Exception {
		

			model.addAttribute("Board", boardservice.detailBoard(board_number));
			
			return "board/Update";
	}
	
	@RequestMapping(value ="/boardModify.do", method= RequestMethod.POST)
	public String board_modify(Board board) throws Exception {
		
		
		boardservice.updateBoard(board);
		
		return "redirect:/boardDetail.do?board_number="+ board.getboard_number();
	}
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.GET)
	public String board_delete(HttpSession session, int board_number) throws Exception {
		
		int deleteResult = boardservice.deleteBoard(board_number);
		
		if (deleteResult == -1) {
			logger.info("Insert~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11~~~~~~");
		}else {
			logger.info("FAIL~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~~~~~~~~~~");
		}
		
		return "redirect:/boardList.do";
	}
}