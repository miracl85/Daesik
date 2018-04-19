package com.kat.home.dto;

public class AdminDTO {

	private int seq;
	private String noticeTitle;
	private String noticeTop;
	private String noticeType;
	private String noticeContents;
	private String noticeOrgFileName;
	private String noticeFileName;
	private String language;
	private String createUserId;
	private String createDate;
	
	private int startRow;
	private int endRow;
	private String sDate;
	private String eDate;
	private String searchValue;
	private int rowNum;
	
	private String updateCheck;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeTop() {
		return noticeTop;
	}
	public void setNoticeTop(String noticeTop) {
		this.noticeTop = noticeTop;
	}
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	public String getNoticeContents() {
		return noticeContents;
	}
	public void setNoticeContents(String noticeContents) {
		this.noticeContents = noticeContents;
	}
	public String getNoticeOrgFileName() {
		return noticeOrgFileName;
	}
	public void setNoticeOrgFileName(String noticeOrgFileName) {
		this.noticeOrgFileName = noticeOrgFileName;
	}
	public String getNoticeFileName() {
		return noticeFileName;
	}
	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	public String getUpdateCheck() {
		return updateCheck;
	}
	public void setUpdateCheck(String updateCheck) {
		this.updateCheck = updateCheck;
	}
}
