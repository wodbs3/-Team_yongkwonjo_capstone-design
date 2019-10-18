package com.bu.bumoim.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.domain.Gallery;
import com.bu.bumoim.service.CommentService;
import com.bu.bumoim.service.GalleryService;


@Controller
public class CommentController {
	
	@Autowired
	private CommentService commentService;

	private Logger logger = Logger.getLogger(getClass());
	
	
	@RequestMapping(value="/commentInsert.do")
	public String commentInsert(int num, Comment comment) {
		
	
		comment.setPhoto_number(num);
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> photo_number: " + comment.getPhoto_number());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> comment_id: " + comment.getComment_id());
		logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>> content: " + comment.getComment_content());
		commentService.galCommentInsert(comment);
		
		return "redirect:galleryDetail.do?num=" + comment.getPhoto_number();
	}
	
	@RequestMapping(value="/commentDelete.do")
	public String commentDelete(Comment comment) {
		int comment_number = comment.getComment_number();
		commentService.galDeleteComment(comment_number);
		return "redirect:galleryDetail.do?num=" + comment.getPhoto_number();
	}
	
	
//	@Resource(name="com.bu.bumoim.service.CommentService")
//    CommentService mCommentService;
    
    
//    @RequestMapping("/list") //댓글 리스트
//    @ResponseBody
//    private List<Comment> mCommentServiceList(Model model) throws Exception{
//        
//        return mCommentService.commentListService();
//    }
//    
//    @RequestMapping("/insert") //댓글 작성 
//    @ResponseBody
//    private int mCommentServiceInsert(@RequestParam int board_number, @RequestParam String content) throws Exception{
//        
//        Comment comment = new Comment();
//        comment.setcomment_content(content);
//        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
//        comment.setcomment_id("root");  
//        
//        return mCommentService.commentInsertService(comment);
//    }
//    
//    @RequestMapping("/update") //댓글 수정  
//    @ResponseBody
//    private int mCommentServiceUpdateProc(@RequestParam int comment_number, @RequestParam String Comment_content) throws Exception{
//        
//        Comment comment = new Comment();
//        comment.setcomment_number(comment_number);
//        comment.setcomment_content(Comment_content);
//        
//        return mCommentService.commentUpdateService(comment);
//    }
//    
//    @RequestMapping("/delete/{Comment_number}") //댓글 삭제  
//    @ResponseBody
//    private int mCommentServiceDelete(@PathVariable int Comment_number) throws Exception{
//        
//        return mCommentService.commentDeleteService(Comment_number);
//    }
    
}
