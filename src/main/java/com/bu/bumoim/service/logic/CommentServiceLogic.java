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
	
	@Override
	public int getPhotoNumber(int comment_number) {
		int photo_number = commentDao.getPhotoNumber(comment_number);
		return photo_number;
	}
	
	@Override
	public void boardCommentInsert(Comment comment) {
		commentDao.boardInsertComment(comment);
	}
	
	@Override
	public List<Comment> boardCommentList(int board_number) {
		List<Comment> comment = commentDao.boardGetCommentList(board_number);
		return comment;
	}
	
	@Override
	public void boardDeleteAllComment(int board_number) {
		commentDao.boardCommentAllDelete(board_number);
	}
	
	@Override
	public void boardDeleteComment(int comment_number) {
		commentDao.boardCommentDelete(comment_number);
		
	}

	@Override
	public void boardUpdateComment(Comment comment) {
		commentDao.boardUpdateComment(comment);
	}
		
}