package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;

 
public interface BoardDao {

    List<Board> selectBoardList(Board board);
    
//    List<Board> detail(int board_number);
    
    public Board detail(int board_number) throws Exception;
    
    public int insertBoard(Board board);

    public int deleteBoard(int board_number) throws Exception;

    public int updateBoard(Board board, int board_number) throws Exception;
 

}