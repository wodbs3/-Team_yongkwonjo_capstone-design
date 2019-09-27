package com.bu.bumoim.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.beans.factory.annotation.Autowired;



@Controller
public class BoardController {
	
	/**����Ʈ ��*/
	@RequestMapping(value="/board/boardList.do")
	public String board_boardlist() {

		
		return "board/List";
	}
	

	/**�۾��� ��*/
	@RequestMapping(value="/board/boardWrite.do")
    public String board_boardwrite() throws Exception{
        
        return "board/Write";
    }
    
//	/**�Խñ� ��� ��*/
//    @RequestMapping(value="/board/write.do")
//    
//        
//        return "redirect:/board/boardList.do";
//    }
//    
//
/**������ ��*/
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