package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

 
public interface BoardDao {

 
    /**
     * 野껊슣�뻻�눧占� �뵳�딅뮞占쎈뱜 鈺곌퀬�돳
     * @param boardVO
     * @return
     * @throws Exception
     */
   
    List<Board> selectBoardList(Criteria cri);

    List<Board> selectGroupBoardList(int groupList_number, Criteria boardCri);
    
//    List<Board> detail(int board_number);
    
    public Board detailBoard(int board_number) throws Exception;
    
    public int insertBoard(Board board);

    public int deleteBoard(int board_number) throws Exception;

    public int updateBoard(Board board) throws Exception;
 
    public int selectgetCount(int board_nunber);

	public Board read(int board_number) throws Exception;

	public void boardCount(int board_number) throws Exception;

	public int groupboardcount(int groupList_number);
}