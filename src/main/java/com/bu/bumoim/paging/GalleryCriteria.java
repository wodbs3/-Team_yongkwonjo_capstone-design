package com.bu.bumoim.paging;

public class GalleryCriteria {
	   private int page;            // 현재 페이지 번호
	   private int perPageNum;   // 페이지당 보여줄 게시글의 개수
	   String keyword;
	   String searchType;
	   
	   public GalleryCriteria() {
	      this.page = 1;
	      this.perPageNum = 6;
	   }

	   public int getPage() {
	      return page;
	   }

	   public void setPage(int page) {
	      if(page <= 0) {
	         this.page = 1;
	         return;
	      }
	      this.page = page;
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
	   
	  /* 마이바티스 조회쿼리의 #{pageStart}에 전달된다. */
	   public int getPageStart() {
	      return (this.page -1) * perPageNum;
	   }
	   

	   @Override
	   public String toString() {
	      return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
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
