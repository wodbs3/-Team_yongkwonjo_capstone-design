package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.bu.bumoim.dao.BoardDao;
import com.bu.bumoim.domain.Board;
import com.bu.bumoim.mapper.BoardMapper;

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
	public void updateBoard(Board board) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.updateBoard(board);
	}

	@Override
	public void deleteBoard(Board board) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		mapper.deleteBoard(board);
	}

	@Override
	public Board selectBoardByCode(Board board) throws Exception {
		BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
		return mapper.selectBoardByCode(board);
	}
	@Override
	public List<Board> detail(int board_number) {
		return sqlSession.selectList("board.detailBoard", board_number);
	}
}