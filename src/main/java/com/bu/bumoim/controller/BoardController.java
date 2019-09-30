package com.bu.bumoim.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	//
	private Logger logger = Logger.getLogger(getClass());
	
	@RequestMapping(value="/board/boardList.do")
	public String board_boardlist() {

		
		return "board/List";
	}
	

	@RequestMapping(value="/board/boardWrite.do")
    public String board_boardwrite() throws Exception{
        
        return "board/Write";
    }
    
//	/**�Խñ� ���? ��*/
//    @RequestMapping(value="/board/write.do")
//    
//        
//        return "redirect:/board/boardList.do";
//    }
//    
//
	@RequestMapping(value="/board/comment.do")
	public String board_comment() {

		
		return "board/Comment";
	}
	
    @RequestMapping(value="/board/boardDetail.do")
    public String board_boarddetail() throws Exception{
        
//        int code = Integer.parseInt(request.getParameter("code"));
//        boardVO.setCode(code);
//        
//        BoardVO resultVO = boardServiceImpl.selectBoardByCode(boardVO);
//        
//        model.addAttribute("result", resultVO);
//    	(@ModelAttribute("boardVO") BoardVO boardVO, Model model, HttpServletRequest request)
        
        return "board/Detail";
    }
}