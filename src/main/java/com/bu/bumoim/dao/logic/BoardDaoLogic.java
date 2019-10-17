package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.BoardDao;
import com.bu.bumoim.domain.Board;

@Repository
public class BoardDaoLogic implements BoardDao{

	@Autowired
	private SqlSession sqlSession;
	
	public List<Board> selectBoardList(Board board){
		return sqlSession.selectList("board.selectBoardList", board);
	}

	@Override
	public int insertBoard(Board board){
		return sqlSession.insert("board.insertBoard", board);
	}
	
	@Override
	public Board detail(int board_number) {
		return sqlSession.selectOne("board.detail", board_number);
	}

	@Override
	public int deleteBoard(int board_number) {
		return sqlSession.delete("board.deleteBoard", board_number);
	}

	@Override
	public int updateBoard(Board board, int board_number) {
		return sqlSession.update("board.updateBoard", board_number);
	}
}