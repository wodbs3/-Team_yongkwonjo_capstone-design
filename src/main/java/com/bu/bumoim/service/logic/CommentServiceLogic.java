package com.bu.bumoim.service.logic;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.CommentDao;
import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.service.CommentService;

@Service
public class CommentServiceLogic implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	
	@Override
	public void galCommentInsert(Comment comment) {
		commentDao.galInsertComment(comment);
		
	}

	@Override
	public List<Comment> galCommentList(int photo_number) {
		List<Comment> comment = commentDao.galGetCommentList(photo_number);
		return comment;
	}

	@Override
	public void galDeleteAllComment(int photo_number) {
		commentDao.galCommentAllDelete(photo_number);
		
	}

	@Override
	public void galDeleteComment(int comment_number) {
		commentDao.galCommentDelete(comment_number);
		
	}

	@Override
	public void galUpdateComment(Comment comment) {
		commentDao.galUpdateComment(comment);
		
	}
	
// board
	
	@Override
	public void borCommentInsert(Comment comment) {
		commentDao.borInsertComment(comment);
		
	}

	@Override
	public List<Comment> borCommentList(int board_number) {
		List<Comment> comment = commentDao.borGetCommentList(board_number);
		return comment;
	}

	@Override
	public void borDeleteAllComment(int board_number) {
		commentDao.borCommentAllDelete(board_number);
		
	}

	@Override
	public void borDeleteComment(int comment_number) {
		commentDao.borCommentDelete(comment_number);
		
	}

	@Override
	public void borUpdateComment(Comment comment) {
		commentDao.borUpdateComment(comment);
		
	}

	

}
