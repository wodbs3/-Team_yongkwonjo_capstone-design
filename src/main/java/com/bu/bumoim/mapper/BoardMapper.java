package com.bu.bumoim.mapper;

import java.util.List;

import com.bu.bumoim.domain.Board;

public interface BoardMapper {
	 
    // 게시물 리스트 조회
    public List<Board> selectBoardList(Board board) throws Exception;
    
    // 게시물 등록
    public void insertBoard(Board board) throws Exception;
    
    // 게시물 수정
    public void updateBoard(Board board) throws Exception;
    
    // 게시물 삭제
    public void deleteBoard(Board board) throws Exception;
 
    // 게시물 조회
    public Board selectBoardByCode(Board boardVO) throws Exception;
    
}