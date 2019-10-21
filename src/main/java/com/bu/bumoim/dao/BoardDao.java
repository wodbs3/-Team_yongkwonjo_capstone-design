package com.bu.bumoim.dao;

import java.util.List;

import com.bu.bumoim.domain.Board;
import com.bu.bumoim.paging.Criteria;

 
public interface BoardDao {

 
    /**
     * 寃뚯떆臾� 由ъ뒪�듃 議고쉶
     * @param boardVO
     * @return
     * @throws Exception
     */
   
    List<Board> selectBoardList(Criteria cri);

    
//    List<Board> detail(int board_number);
    
    public Board detailBoard(int board_number) throws Exception;
    
    public int insertBoard(Board board);

    public int deleteBoard(int board_number) throws Exception;

    public int updateBoard(Board board) throws Exception;
 
    public int selectgetCount(int board_nunber);

}