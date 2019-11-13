package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Comment;

public interface CommentDao {
	
	
//	Gallery Comment
	public void galInsertComment(Comment comment);
	
	public List<Comment> galGetCommentList(int photo_number);
	
	public void galUpdateComment(Comment comment);
	
	public void galCommentAllDelete(int photo_number);
	
	public void galCommentDelete(int comment_number);
	
	public int getPhotoNumber(int comment_number);

//  Board Comment	
	public void boardInsertComment(Comment comment);
	
	public List<Comment> boardGetCommentList(int board_number);
	
	public void boardUpdateComment(Comment comment);
	
	public void boardCommentAllDelete(int board_number);
	
	public void boardCommentDelete(int comment_number);
	
	
	
}
