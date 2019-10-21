package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

 
public interface BoardDao {

    List<Board> selectBoardList(Criteria cri);
    
//    List<Board> detail(int board_number);
    
    public Board detail(int board_number) throws Exception;
    
    public int insertBoard(Board board);

    public int deleteBoard(int board_number) throws Exception;

    public int updateBoard(Board board) throws Exception;
 
    public int selectgetCount(int board_nunber);

}