package com.kat.home.commons;

public class CommPageDTO {
	
	private int nowPage = 0;
	private int totalCount = 0;
	private int startRow;
	private int endRow;
	private String startDate = "";
	private String endDate = "";
	private String searchCate = "";
	private String searchValue = "";
	private String language;
	
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getSearchCate() {
		return searchCate;
	}
	public void setSearchCate(String searchCate) {
		this.searchCate = searchCate;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	@Override
	public String toString() {
		return "CommPageDTO [nowPage=" + nowPage + ", totalCount=" + totalCount
				+ ", startRow=" + startRow + ", endRow=" + endRow
				+ ", startDate=" + startDate + ", endDate=" + endDate
				+ ", searchCate=" + searchCate + ", searchValue=" + searchValue
				+ ", language=" + language + "]";
	}
	
}
