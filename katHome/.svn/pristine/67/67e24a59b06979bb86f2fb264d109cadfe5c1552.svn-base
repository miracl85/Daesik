package com.kat.home.dao;

import java.util.List;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.NoticeDTO;

public interface BoardDao {
	
	// 게시글 레코드 개수 조회
	public int countNotice(CommPageDTO pageDto);
	// 게시글 전체 목록 조회
	public List<NoticeDTO> listAll(CommPageDTO pageDto);
	// 조회수 증가러치
	public void increaseViewcnt(int adSeq);
	// 게시글 상세보기
	public NoticeDTO boardRead(int adSeq);

	public int boardInsert(NoticeDTO dto);
	
	public int noticeTopUpdate(String lang);
	
	public String getAdminNoticeFile(NoticeDTO dto);
	
	public int deleteBoard(int adSeq);
	
	public int updateBoard(NoticeDTO dto);
}
