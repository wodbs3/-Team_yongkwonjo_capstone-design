package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Comment;

public interface CommentDao {
	
	
//	Gallery Comment
	public void galInsertComment(Comment comment);
	
	public List<Comment> galGetCommentList(int photo_number);
	
	public int getPhotoNumber(int comment_number);
	
	public void galUpdateComment(Comment comment);
	
	public void galCommentAllDelete(int photo_number);
	
	public void galCommentDelete(int comment_number);
	
	
}
