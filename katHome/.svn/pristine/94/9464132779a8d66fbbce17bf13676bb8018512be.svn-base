package com.kat.home.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.NoticeDTO;

@Repository
public class BoardDaoImp implements BoardDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private SqlSessionTemplate sqlSession;

	// 게시글 레코드 개수
	@Override
	public int countNotice(CommPageDTO pageDto) {
		return sqlSession.selectOne("notice.countNotice", pageDto);
	}

	// 게시글 목록
	@Override
	public List<NoticeDTO> listAll(CommPageDTO pageDto) {		
		return sqlSession.selectList("notice.listAll", pageDto);
	}
	
	// 게시글 상세보기
	@Override
	public NoticeDTO boardRead(int adSeq) {
		return sqlSession.selectOne("notice.boardRead", adSeq);
	}
	
	// 조회수 증가
	@Override
	public void increaseViewcnt(int adSeq) {
		sqlSession.update("notice.increaseViewcnt", adSeq);
	}
	
	@Override
	public int boardInsert(NoticeDTO dto) {
		return sqlSession.insert("notice.boardInsert", dto);
	}
	
	@Override
	public int noticeTopUpdate(String lang) {
		return sqlSession.update("notice.noticeTopUpdate", lang);
	}
	
	@Override
	public String getAdminNoticeFile(NoticeDTO dto) {
		return sqlSession.selectOne("notice.getAdminNoticeFile", dto);
	}
	
	@Override
	public int updateBoard(NoticeDTO dto) {
		return sqlSession.update("notice.updateBoard", dto);
	}
	
	@Override
	public int deleteBoard(int adSeq) {
		// TODO Auto-generated method stub
		return sqlSession.delete("notice.deleteBoard", adSeq);
	}
}//class