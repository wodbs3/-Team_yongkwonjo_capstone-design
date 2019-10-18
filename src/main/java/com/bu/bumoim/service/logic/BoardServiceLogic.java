package com.bu.bumoim.service.logic;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.BoardDao;
import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;
import com.bu.bumoim.service.BoardService;

@Service
public class BoardServiceLogic implements BoardService {

	@Autowired
	private BoardDao boarddao;
	
	@Override
	public List<Board> selectBoardList(Criteria cri) {
//		List<Board> list = null;
//		list = boarddao.selectBoardList(board);
//		return list;
		return boarddao.selectBoardList(cri);
	}
	
 	@Override 
 	public Board detail(int board_number) throws Exception {
 		return boarddao.detail(board_number);
 	}
 	
	
	@Override
	public int insertBoard(Board board) {
		return boarddao.insertBoard(board);
	}

	@Override
	public int updateBoard(Board board) throws Exception {
		return boarddao.updateBoard(board);

	}

	@Override
	public int deleteBoard(int board_number) throws Exception {
		return boarddao.deleteBoard(board_number);
		
	}
	
	@Override
	public int selectgetCount(int board_number) {
		return boarddao.selectgetCount(board_number);
	}


}
