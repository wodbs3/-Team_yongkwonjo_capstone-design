package com.bu.bumoim.controller;

import java.util.List;

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
  
//	/**Write update*/
//    @RequestMapping(value="/write.do")
//    public String board_write(@ModelAttribute("board") Board board, Model model) throws Exception {
//    	
//    	boardservice.insertBoard(board);
//        
//        return "redirect:/boardList.do";
//	}
	@RequestMapping("/detail.do")
	public String board_detail() {
		
		return "board/Detail";
	}
    
	/**Detail*/
    @RequestMapping("/boardDetail.do")
    public ModelAndView DetailList(Board board, @RequestParam("board_number") int board_number) {
    	ModelAndView modelAndView = new ModelAndView("board/Detail");
    	modelAndView.setViewName("board/Detail");
    	modelAndView.addObject("Board", boardservice.detail(board_number));
    	
    	List<Board> list = boardservice.selectBoardList(board);
    	
    	System.out.println("=================================");
    	System.out.println(list.toString());
    	
    	return modelAndView;
    }
    
	@RequestMapping(value="/boardUpdate.do") 
	public String updateBoard(@ModelAttribute("board") Board board, Model model) throws Exception {
		
		try {
			boardservice.updateBorad(board);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/boardList.do";
		
	}
    
//    @RequestMapping(value="/addComment.do")
//    @ResponseBody
//    public String ajax_addComment(@ModelAttribute("boardVO") Board board, HttpServletRequest request) throws Exception{
//        
//        HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
//        
//        try{
//        
//            board.setWriter(loginVO.getUser_id());        
//            boardServicelogic.addComment(board);
//            
//        } catch (Exception e){
//            e.printStackTrace();
//        }
//        
//        return "success";
//    }
}
