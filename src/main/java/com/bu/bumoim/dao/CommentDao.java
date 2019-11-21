package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Comment;

public interface CommentDao {
	
	
//	Gallery Commentboard_number
	public void galInsertComment(Comment comment);
	
	public List<Comment> galGetCommentList(int photo_number);
	
	public void galUpdateComment(Comment comment);
	
	public void galCommentAllDelete(int photo_number);
	
	public void galCommentDelete(int comment_number);
	
	public int getPhotoNumber(int comment_number);

//  Board Comment	
	public void boardInsertComment(Comment comment);
	
	public List<Comment> boardGetCommentList(int groupList_number);
	
	public void boardUpdateComment(Comment comment);
	
	public void boardCommentAllDelete(int groupList_number);
	
	public void boardCommentDelete(int comment_number);
	
//  group Comment
	public void groupInsertComment(Comment comment);
	
	public List<Comment> groupGetCommentList(int groupList_number);
	
	public void groupUpdateComment(Comment comment);
	
	public void groupCommentAllDelete(int board_number);
	
	public void groupCommentDelete(int comment_number);
	
	
	
}
