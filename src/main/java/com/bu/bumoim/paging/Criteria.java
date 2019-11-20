package com.bu.bumoim.paging;

public class Criteria {

   private int boardPage;            // �쁽�옱 �럹�씠吏� 踰덊샇
   private int perPageNum;   // �럹�씠吏��떦 蹂댁뿬以� 寃뚯떆湲��쓽 媛쒖닔
   String keyword;
   String searchType;
   
   public Criteria() {
      this.boardPage = 1;
      this.perPageNum = 15;
   }

   public int getBoardPage() {
      return boardPage;
   }

   public void setBoardPage(int boardPage) {
      if(boardPage <= 0) {
         this.boardPage = 1;
         return;
      }
      this.boardPage = boardPage;
   }

   public int getPerPageNum() {
      return perPageNum;
   }

   public void setPerPageNum(int perPageNum) {
      if(perPageNum <= 0 || perPageNum > 100) {
         this.perPageNum = 15;
         return;
      }
      this.perPageNum = perPageNum;
   }
   
  /* 留덉씠諛뷀떚�뒪 議고쉶荑쇰━�쓽 #{pageStart}�뿉 �쟾�떖�맂�떎. */
   public int getPageStart() {
      return (this.boardPage -1) * perPageNum;
   }
   

   @Override
   public String toString() {
      return "Criteria [boardPage=" + boardPage + ", perPageNum=" + perPageNum + "]";
   }

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
}