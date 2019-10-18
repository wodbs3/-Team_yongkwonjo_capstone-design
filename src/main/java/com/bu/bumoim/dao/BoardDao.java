package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

 
public interface BoardDao {

 
    /**
     * 게시물 리스트 조회
     * @param boardVO
     * @return
     * @throws Exception
     */
    List<Board> selectBoardList(Board board);


    List<Board> selectBoardList(Criteria cri);

    
//    List<Board> detail(int board_number);
    
    public Board detail(int board_number) throws Exception;
    
    public int insertBoard(Board board);

    public int deleteBoard(int board_number) throws Exception;

    public int updateBoard(Board board) throws Exception;
 
    public int selectgetCount(int board_nunber);

}