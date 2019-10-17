package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;

 
public interface BoardDao {
 
    /**
     * 게시물 리스트 조회
     * @param boardVO
     * @return
     * @throws Exception
     */
    List<Board> selectBoardList(Board board);
    
    List<Board> detail(int board_number);
    
    /**
     * 게시물 등록
     * @param boardVO
     * @throws Exception
     */
    public int insertBoard(Board board);
    
    void updateBoard(Board board) throws Exception;
 
    /**
     * 게시물 삭제
     * @param boardVO
     * @throws Exception
     */
    void deleteBoard(Board board) throws Exception;
 
    /**
     * 게시물 조회
     * @param boardVO
     * @return
     * @throws Exception
     */
    Board selectBoardByCode(Board board) throws Exception;
 

}