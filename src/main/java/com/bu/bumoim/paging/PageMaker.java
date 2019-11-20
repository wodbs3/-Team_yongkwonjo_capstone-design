package com.bu.bumoim.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.bu.bumoim.paging.Criteria;

public class PageMaker {

	private int totalCount; // 寃뚯떆�뙋 �쟾泥� �뜲�씠�꽣 媛쒖닔
	private int displayPageNum = 5; // 寃뚯떆�뙋 �솕硫댁뿉�꽌 �븳踰덉뿉 蹂댁뿬吏� �럹�씠吏� 踰덊샇�쓽 媛쒖닔 ( 1,2,3,4,5,6,7,9,10)
	private int startPage; // �쁽�옱 �솕硫댁뿉�꽌 蹂댁씠�뒗 startPage 踰덊샇
	private int endPage; // �쁽�옱 �솕硫댁뿉 蹂댁씠�뒗 endPage 踰덊샇
	private boolean prev; // �럹�씠吏� �씠�쟾 踰꾪듉 �솢�꽦�솕 �뿬遺�
	private boolean next; // �럹�씠吏� �떎�쓬 踰꾪듉 �솢�꽌�솕 �뿬遺�
	private Criteria cri; // �븵�꽌 �깮�꽦�븳 Criteria瑜� 二쇱엯諛쏅뒗�떎.

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getBoardPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	}


}