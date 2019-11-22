package com.bu.bumoim.dao.logic;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bu.bumoim.dao.BoardDao;
import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

@Repository
public class BoardDaoLogic implements BoardDao{

	private static String namespace = "board";
	@Autowired
	private SqlSession sqlSession;
	
	public List<Board> selectBoardList(Criteria cri){
		return sqlSession.selectList("board.selectBoardList", cri);
	}
	
	public Board read(int board_number) throws Exception {
		return sqlSession.selectOne(namespace +".read", board_number);
	}
	
	public List<Board> selectGroupBoardList(int groupList_number) {
		return sqlSession.selectList("board.selectGroupBoardList", groupList_number);
	}

	@Override
	public int insertBoard(Board board){
		return sqlSession.insert("board.insertBoard", board);
	}
	
	@Override
	public Board detailBoard(int board_number) {
		return sqlSession.selectOne("board.detail", board_number);
	}

	@Override
	public int deleteBoard(int board_number) {
		return sqlSession.delete("board.deleteBoard", board_number);
	}

	@Override
	public int updateBoard(Board board) {
		return sqlSession.update("board.updateBoard", board);
	}
	
	@Override
	public int selectgetCount(int board_number) {
		return sqlSession.selectOne("board.selectgetCount", board_number);
	}
	
	@Override
	public void boardCount(int board_number) throws Exception {
		sqlSession.update(namespace + ".boardCount", board_number);
	}
}