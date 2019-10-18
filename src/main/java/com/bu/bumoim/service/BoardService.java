package com.bu.bumoim.service;

import java.util.List;
import java.util.Map;

import com.bu.bumoim.domain.Board;

public interface BoardService {
	List<Board> selectBoardList(Board board);
	
	public Board detail(int board_number) throws Exception;

	public int insertBoard(Board board);
    
	public int deleteBoard(int board_number) throws Exception;

	public int updateBoard(Board board) throws Exception; 
	
}
