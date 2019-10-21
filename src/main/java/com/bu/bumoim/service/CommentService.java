package com.bu.bumoim.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.domain.Comment;



public interface CommentService {
 

    public void galCommentInsert(Comment comment);
	
	public List<Comment> galCommentList(int photo_number);
	
	public void galUpdateComment(Comment comment);
	
	public void galDeleteAllComment(int photo_number);
	
	public void galDeleteComment(int comment_number);
}

