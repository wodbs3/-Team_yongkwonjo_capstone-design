package com.bu.bumoim.service;

import java.util.List;
import java.util.Map;

import com.bu.bumoim.domain.Board;

public interface BoardService {
	 /**
     * 게시물 리스트 조회
  	 */
	List<Board> selectBoardList(Board board);
	List<Board> detail(int board_number);
	
	public int insertBoard(Board board);
    
    /**
     * 게시물 수정
     */
	public void updateBorad(Board board) throws Exception;
    
    /**
     * 게시물 삭제
     */
    public void deleteBoard(Board board) throws Exception;
 
    /**
     * 게시글 조회
     */
    public Board selectBoardByCode(Board board) throws Exception;
	
	
	
}
