package com.kat.home.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.commons.Common;
import com.kat.home.dao.BoardDao;
import com.kat.home.dto.NoticeDTO;

@Service
public class BoardServiceImp implements BoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private BoardDao boardDao;

	// 게시글 레코드 개수
	@Override
	public int countNotice(CommPageDTO pageDto) {
    	return boardDao.countNotice(pageDto);
	}
	
	// 게시글 전체 목록
	@Override
	public List<NoticeDTO> listAll(CommPageDTO pageDto) {
        return boardDao.listAll(pageDto);
	}
	
	// 게시글 상세보기
	@Override
	public NoticeDTO boardRead(int adSeq) {
		return boardDao.boardRead(adSeq);
	}
	
	// 조회수 증가처리
	@Override
	public void increaseViewcnt(int adSeq) {
		boardDao.increaseViewcnt(adSeq);
	}
	
	// 파일 다운로드
	@Override
	public void fileDownLoad(HttpServletRequest request,
			HttpServletResponse response, String filePath, String fileName,
			String orgFileName) {
		
		Common common = new Common();
		common.fileDownLoad(request, response, filePath, fileName, orgFileName);
	}
	
	@Override
	public int boardInsert(NoticeDTO dto) {
		return boardDao.boardInsert(dto);
	}
	
	@Override
	public int noticeTopUpdate(String lang) {
		return boardDao.noticeTopUpdate(lang);
	}
	
	@Override
	public String getAdminNoticeFile(NoticeDTO dto) {
		return boardDao.getAdminNoticeFile(dto);
	}
	
	@Override
	public int updateBoard(NoticeDTO dto) {
		return boardDao.updateBoard(dto);
	}

	@Override
	public int deleteBoard(int adSeq) {
		return boardDao.deleteBoard(adSeq);
	}
	
}//class