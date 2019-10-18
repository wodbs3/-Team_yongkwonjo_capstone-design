package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Comment;

public interface CommentDao {
	
	 public int commentCount() throws Exception;
	 
	    // 댓글 목록
	 public List<Comment> commentList() throws Exception;
	 
	    // 댓글 작성
	 public int commentInsert(Comment comment) throws Exception;
	    
	    // 댓글 수정
	 public int commentUpdate(Comment comment) throws Exception;
	 
	    // 댓글 삭제
	 public int commentDelete(int comment_number) throws Exception;
	
//	Gallery Comment
	public void galInsertComment(Comment comment);
	
	public List<Comment> galGetCommentList(int photo_number);
	
	public void galCommentDelete(int photo_number);
}
