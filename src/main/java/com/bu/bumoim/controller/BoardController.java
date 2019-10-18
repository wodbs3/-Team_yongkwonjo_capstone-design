package com.bu.bumoim.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.service.BoardService;


@Controller
public class BoardController {

	private Logger logger = Logger.getLogger(getClass());
	@Autowired
	private BoardService boardservice;
	
	@RequestMapping(value="/boardList.do")
	public ModelAndView list(Board board) {
		
		List<Board> list = boardservice.selectBoardList(board);
		ModelAndView mav = new ModelAndView("board/List");
		mav.addObject("Board", list);
		
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
	public ModelAndView Detail(@RequestParam int board_number, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/Detail");
		mav.addObject("Board", boardservice.detail(board_number));
		
		return mav;
	}
    
	@RequestMapping(value ="/boardUpdate.do", method= RequestMethod.GET)
	public String Update(HttpSession session, int board_number, Model model) throws Exception {
		

			model.addAttribute("Board", boardservice.detail(board_number));
			
			return "board/Update";
	}
	
//	@RequestMapping(value ="/boardModify.do", method= RequestMethod.POST)
//	public String Modify(ModelAndView modelAndView, int board_number, @RequestParam(value="board_title") String board_title, @RequestParam(value="board_content") String board_content) throws Exception {
//		
//		Board board = boardservice.detail(board_number);
//		
//		//System.out.println(title);
//		System.out.println("**********************************");
//		board.setboard_title(board_title);
//		System.out.println(board_title);
//		board.setboard_content(board_content);
//		System.out.println(board_content);
//		logger.info(board);
//		System.out.println("***********************");
//		
//		boardservice.updateBoard(board, board_number);
//		modelAndView.addObject("Board", boardservice.updateBoard(board, board_number));
//		
//		return "redirect:/boardDetail.do?board_number="+board_number;
//	}
	@RequestMapping(value ="/boardModify.do", method= RequestMethod.POST)
	public String Modify(Board board) throws Exception {
		
		
		boardservice.updateBoard(board);
		
		return "redirect:/boardDetail.do?board_number="+ board.getboard_number();
	}
	@RequestMapping(value="/boardDelete.do", method=RequestMethod.GET)
	public String Delete(HttpSession session, int board_number) throws Exception {
		
		int deleteResult = boardservice.deleteBoard(board_number);
		
		if (deleteResult == -1) {
			logger.info("Insert~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!11~~~~~~");
		}else {
			logger.info("FAIL~~~~~~~~~~~~~~~!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!~~~~~~~~~~");
		}
		
		return "redirect:/boardList.do";
	}
}