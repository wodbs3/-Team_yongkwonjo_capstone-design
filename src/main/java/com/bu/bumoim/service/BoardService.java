package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

public interface BoardService {
	List<Board> selectBoardList(Criteria cri);
	
	public Board detail(int board_number) throws Exception;

	public int insertBoard(Board board);
    
	public int deleteBoard(int board_number) throws Exception;

	public int updateBoard(Board board) throws Exception; 
	
	public int selectgetCount(int board_number);
}
