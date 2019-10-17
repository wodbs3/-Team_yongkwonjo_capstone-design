package com.bu.bumoim.service.logic;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.*;
import com.bu.bumoim.domain.Board;
import com.bu.bumoim.service.BoardService;

@Service
public class BoardServiceLogic implements BoardService {

	@Autowired
	private BoardDAO boarddao;
	
	@Override
	public List<Board> selectBoardList(Board board) {
//		List<Board> list = null;
//		list = boarddao.selectBoardList(board);
//		return list;
		return boarddao.selectBoardList(board);
	}
	
	@Override
	public List<Board> detail(int board_number) {
		return boarddao.detail(board_number);
	}
 	
	
	@Override
	public int insertBoard(Board board) {
		return boarddao.insertBoard(board);
	}

	@Override
	public void updateBorad(Board board) throws Exception {
		boarddao.updateBoard(board);

	}

	@Override
	public void deleteBoard(Board board) throws Exception {
		boarddao.deleteBoard(board);
		
	}


	@Override
	public Board selectBoardByCode(Board board) throws Exception {
		
		Board result = boarddao.selectBoardByCode(board);
		
		return result;
	}
}
