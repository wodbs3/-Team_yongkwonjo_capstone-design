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
	public String commentDelete(int comment_number) {
		
		commentService.galDeleteComment(comment_number);
		
//		List<Comment> comment1 = commentService.boardCommentOne(comment_number);
		
		return "redirect:galleryDetail.do?num=" + comment_number;
	}
	
	

}
