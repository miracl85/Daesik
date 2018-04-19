package com.kat.home.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;

@Repository
public class IntroDaoImp implements IntroDao {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private SqlSessionTemplate sqlSession;

	@Override
	public int affTotalCount(AffiliateDTO affDto) {
		return sqlSession.selectOne("Affiliate.affTotalCount");
	}

	@Override
	public List<AffiliateDTO> affList(CommPageDTO pageDto) {
		return sqlSession.selectList("Affiliate.affList", pageDto);
	}

	@Override
	public int fileChk(FileDTO dto) {
		return sqlSession.selectOne("File.fileChk", dto);
	}

	@Override
	public List<AdminHistoryDTO> getHistoryList() {
		return sqlSession.selectList("History.historyList");
	}

	@Override
	public UpdateDTO getFileInfo(UpdateDTO updateDto) {
		return sqlSession.selectOne("Update.getFileInfo", updateDto);
	}
	
}//class