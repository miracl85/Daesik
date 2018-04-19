package com.kat.home.dto;

public class AffiliateDTO {
	private int tNum;
	private int affSeq;
	private int fileSeq;
	private String affTitle;
	private String affUrl;
	private String affIntro;
	private String fileStrnm;
	private String fileOrgnm;
	private String createUserId;
	private String createDate;
	private String statusKind;
	private String modifyUserId;
	private String modifyDate;
	
	
	public String getFileOrgnm() {
		return fileOrgnm;
	}
	public void setFileOrgnm(String fileOrgnm) {
		this.fileOrgnm = fileOrgnm;
	}
	public int gettNum() {
		return tNum;
	}
	public void settNum(int tNum) {
		this.tNum = tNum;
	}
	public String getFileStrnm() {
		return fileStrnm;
	}
	public void setFileStrnm(String fileStrnm) {
		this.fileStrnm = fileStrnm;
	}
	public int getFileSeq() {
		return fileSeq;
	}
	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}
	public String getAffUrl() {
		return affUrl;
	}
	public void setAffUrl(String affUrl) {
		this.affUrl = affUrl;
	}
	public String getAffIntro() {
		return affIntro;
	}
	public void setAffIntro(String affIntro) {
		this.affIntro = affIntro;
	}
	public int getAffSeq() {
		return affSeq;
	}
	public void setAffSeq(int affSeq) {
		this.affSeq = affSeq;
	}
	public String getAffTitle() {
		return affTitle;
	}
	public void setAffTitle(String affTitle) {
		this.affTitle = affTitle;
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
	public String getStatusKind() {
		return statusKind;
	}
	public void setStatusKind(String statusKind) {
		this.statusKind = statusKind;
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
	@Override
	public String toString() {
		return "AffiliateDTO [affSeq=" + affSeq + ", fileSeq=" + fileSeq
				+ ", affTitle=" + affTitle + ", affUrl=" + affUrl
				+ ", affIntro=" + affIntro + ", createUserId=" + createUserId
				+ ", createDate=" + createDate + ", statusKind=" + statusKind
				+ ", modifyUserId=" + modifyUserId + ", modifyDate="
				+ modifyDate + "]";
	}
	
}
