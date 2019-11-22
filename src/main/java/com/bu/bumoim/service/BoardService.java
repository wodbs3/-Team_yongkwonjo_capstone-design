package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

public interface BoardService {
	List<Board> selectBoardList(Criteria cri);
	
	List<Board> selectGroupBoardList(int groupList_number, Criteria boardCri);
	
	public Board detailBoard(int board_number) throws Exception;
	
	public int insertBoard(Board board);
    
	public int deleteBoard(int board_number) throws Exception;

	public int updateBoard(Board board) throws Exception; 
	
	public int selectgetCount(int board_number);

	Board read(int board_number) throws Exception;
	
	void boardCount(int board_number) throws Exception;
}
