package com.bu.bumoim.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;
 
import com.bu.bumoim.domain.Comment;
 
//@Repository("com.bu.bumoim.mapper.CommentMapper")
public interface CommentMapper {
    // 댓글 개수
    public int commentCount() throws Exception;
 
    // 댓글 목록
    public List<Comment> commentList() throws Exception;
 
    // 댓글 작성
    public int commentInsert(Comment comment) throws Exception;
    
    // 댓글 수정
    public int commentUpdate(Comment comment) throws Exception;
 
    // 댓글 삭제
    public int commentDelete(int comment_number) throws Exception;
 
}