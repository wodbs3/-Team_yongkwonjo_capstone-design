package com.bu.bumoim.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bu.bumoim.domain.Comment;
import com.bu.bumoim.mapper.CommentMapper;

//@Service("com.bu.bumoim.service.CommentService")
public class CommentService {
 
//    @Resource(name="com.bu.bumoim.mapper.CommentMapper")
    CommentMapper mCommentMapper;
    
    public List<Comment> commentListService() throws Exception{
        
        return mCommentMapper.commentList();
    }
    
    public int commentInsertService(Comment comment) throws Exception{
        
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(Comment comment) throws Exception{
        
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int comment_number) throws Exception{
        
        return mCommentMapper.commentDelete(comment_number);
    }
}