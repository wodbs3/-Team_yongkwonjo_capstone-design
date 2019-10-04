package com.bu.bumoim.service;

import java.util.List;

import com.bu.bumoim.domain.Board;

public interface BoardService {

	/**boardinsert*/
	void insertBoard(Board vo);
	
	/**boardupdate*/
	void updateBorad(Board vo);
	
	/**boardelete*/
	void deleteBoard(Board vo);
	
	/***/
	Board getBoard(Board vo);
	
	/**boardlist*/
	List<Board> getBoardList(Board vo);
}
