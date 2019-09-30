package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Board;

public interface BoardService {

	void insertBoard(Board vo);
	
	void updateBorad(Board vo);
	
	void deleteBoard(Board vo);
	
	Board getBoard(Board vo);
	
	List<Board> getBoardList(Board vo);
	
}