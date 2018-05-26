package com.oracle.shop.model.javabean;

public class PageBean {
	private int  count;
	private int nowPage;
	private int  nextPage;
	private int previousPage;
	private int firstPage;
	private int wagePage;
	private int allCount;
	public PageBean(int count, int nowPage, int nextPage, int previousPage, int firstPage, int wagePage, int allCount) {
		super();
		this.count = count;
		this.nowPage = nowPage;
		this.nextPage = nextPage;
		this.previousPage = previousPage;
		this.firstPage = firstPage;
		this.wagePage = wagePage;
		this.allCount = allCount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getNextPage() {
		return nextPage;
	}
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	public int getPreviousPage() {
		return previousPage;
	}
	public void setPreviousPage(int previousPage) {
		this.previousPage = previousPage;
	}
	public int getFirstPage() {
		return firstPage;
	}
	public void setFirstPage(int firstPage) {
		this.firstPage = firstPage;
	}
	public int getWagePage() {
		return wagePage;
	}
	public void setWagePage(int wagePage) {
		this.wagePage = wagePage;
	}
	public int getAllCount() {
		return allCount;
	}
	public void setAllCount(int allCount) {
		this.allCount = allCount;
	}
	

}
