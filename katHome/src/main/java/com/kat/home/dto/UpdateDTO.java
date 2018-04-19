package com.kat.home.dto;

/**
 * @author Nam
 *
 */
public class UpdateDTO {
	
	private int upSeq;
	private String upTitle;
	private String upDownload;
	private String upLanguage;
	private String upContents;
	private String upOrgFileName;
	private String upFileName;
	private int upHit;
	private String createUserId;
	private String createDate;
	private String modifyUserId;
	private String modifyDate;
	private String statusKind;
	
	private int tNum;
	
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	private String updateCheck;
	
	public int getUpSeq() {
		return upSeq;
	}
	public void setUpSeq(int upSeq) {
		this.upSeq = upSeq;
	}
	public String getUpTitle() {
		return upTitle;
	}
	public void setUpTitle(String upTitle) {
		this.upTitle = upTitle;
	}
	public String getUpDownload() {
		return upDownload;
	}
	public void setUpDownload(String upDownload) {
		this.upDownload = upDownload;
	}
	public String getUpLanguage() {
		return upLanguage;
	}
	public void setUpLanguage(String upLanguage) {
		this.upLanguage = upLanguage;
	}
	public String getUpContents() {
		return upContents;
	}
	public void setUpContents(String upContents) {
		this.upContents = upContents;
	}
	public String getUpOrgFileName() {
		return upOrgFileName;
	}
	public void setUpOrgFileName(String upOrgFileName) {
		this.upOrgFileName = upOrgFileName;
	}
	public String getUpFileName() {
		return upFileName;
	}
	public void setUpFileName(String upFileName) {
		this.upFileName = upFileName;
	}
	public int getUpHit() {
		return upHit;
	}
	public void setUpHit(int upHit) {
		this.upHit = upHit;
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
	public String getModifyUserId() {
		return modifyUserId;
	}
	public void setModifyUserId(String modifyUserId) {
		this.modifyUserId = modifyUserId;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getStatusKind() {
		return statusKind;
	}
	public void setStatusKind(String statusKind) {
		this.statusKind = statusKind;
	}
	public String getUpdateCheck() {
		return updateCheck;
	}
	public void setUpdateCheck(String updateCheck) {
		this.updateCheck = updateCheck;
	}
	@Override
	public String toString() {
		return "UpdateDTO [upSeq=" + upSeq + ", upTitle=" + upTitle
				+ ", upDownload=" + upDownload + ", upLanguage=" + upLanguage
				+ ", upContents=" + upContents + ", upOrgFileName="
				+ upOrgFileName + ", upFileName=" + upFileName + ", upHit="
				+ upHit + ", createUserId=" + createUserId + ", createDate="
				+ createDate + ", modifyUserId=" + modifyUserId
				+ ", modifyDate=" + modifyDate + ", statusKind=" + statusKind
				+ ", tNum=" + tNum + ", updateCheck=" + updateCheck + "]";
	}		
	

}
