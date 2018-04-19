package com.kat.home.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.NoticeDTO;

public interface BoardService {
	
    // 게시글 레코드 개수 조회
    public int countNotice(CommPageDTO pageDto);
    // 게시글 전체 목록 조회
    public List<NoticeDTO> listAll(CommPageDTO pageDto);
    // 조회수 증가처리
    public void increaseViewcnt(int adSeq);
    // 게시글 상세보기
    public NoticeDTO boardRead(int adSeq);
    
    // 파일 다운로드
    public void fileDownLoad(HttpServletRequest request, HttpServletResponse response, String filePath, String fileName, String orgFileName);
    
    public int boardInsert(NoticeDTO dto);
    
    public int noticeTopUpdate(String lang);
    
    public String getAdminNoticeFile(NoticeDTO dto);
    
    public int deleteBoard(int adSeq);
    
    public int updateBoard(NoticeDTO dto);

}