package com.kat.home.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.AdminDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;


@Repository
public class AdminDaoImpl implements AdminDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//affiliate
	@Override
	public int affInsert(AffiliateDTO dto) {
		return sqlSession.insert("Affiliate.affInsert", dto);
	}
	
	@Override
	public int affUpdate(AffiliateDTO dto) {
		return sqlSession.update("Affiliate.affUpdate", dto);
	}
	
	@Override
	public int affDelete(AffiliateDTO dto) {
		return sqlSession.update("Affiliate.affDelete", dto);
	}
	
	@Override
	public AffiliateDTO affDetail(AffiliateDTO dto) {
		return sqlSession.selectOne("Affiliate.affDetail", dto);
	} 

	//file
	@Override
	public int insertFile(FileDTO dto) {
		return sqlSession.insert("File.insertFile", dto);
	}
	
	@Override
	public String fileSelect(int fileSeq) {
		return sqlSession.selectOne("File.fileSelect",fileSeq);
	}
	
	@Override
	public int selFileSeq(FileDTO dto) {
		return sqlSession.selectOne("File.selFileSeq",dto);
	}
	
	//history
	@Override
	public int getHistoryInfoCount(AdminHistoryDTO dto) {
		return sqlSession.selectOne("History.getHistoryInfoCount", dto);
	}
	
	@Override
	public ArrayList<String> getHistoryYearList() {
		return (ArrayList)sqlSession.selectList("History.getHistoryYearList");
	}
	
	@Override
	public ArrayList<AdminHistoryDTO> getHistoryList() {
		return (ArrayList)sqlSession.selectList("History.getHistoryList");
	}
	
	@Override
	public AdminHistoryDTO getHistoryInfo(AdminHistoryDTO dto) {
		return sqlSession.selectOne("History.getHistoryInfo", dto);
	}
	
	@Override
	public void adminHistoryInfoInsert(AdminHistoryDTO dto) {
		sqlSession.insert("History.adminHistoryInfoInsert", dto);
	}
	
	@Override
	public void adminHistoryInfoUpdate(AdminHistoryDTO dto) {
		sqlSession.update("History.adminHistoryInfoUpdate", dto);
	}
	
	@Override
	public void adminHistoryDetailInsert(AdminHistoryDTO dto) {
		sqlSession.insert("History.adminHistoryDetailInsert", dto);
	}
	
	@Override
	public void historyDelete(AdminHistoryDTO dto) {
		sqlSession.update("History.historyDelete", dto);
	}

	@Override
	public void historyYearDelete(AdminHistoryDTO dto) {
		sqlSession.update("History.historyYearDelete", dto);		
	}

	@Override
	public void historyYearDeleteCascade(AdminHistoryDTO dto) {
		sqlSession.update("History.historyYearDeleteCascade", dto);	
	}

	//update
	@Override
	public int updateCount(CommPageDTO dto) {
		return sqlSession.selectOne("Update.updateCount", dto);
	}

	@Override
	public List<UpdateDTO> selectUpdate(CommPageDTO dto) {
		return sqlSession.selectList("Update.selectUpdate", dto);
	}

	@Override
	public UpdateDTO updateDetail(UpdateDTO dto) {
		return sqlSession.selectOne("Update.updateDetail", dto);
	}

	@Override
	public int updateInsert(UpdateDTO dto) {
		return sqlSession.insert("Update.updateInsert", dto);
	}

	@Override
	public int updateModify(UpdateDTO dto) {
		return sqlSession.update("Update.updateModify", dto);
	}

	@Override
	public int updateDel(UpdateDTO dto) {
		return sqlSession.delete("Update.updateDel", dto);
	}

	@Override
	public String updateFileName(UpdateDTO dto) {
		return sqlSession.selectOne("Update.updateFileName", dto);
	}

	@Override
	public int downloadReset(String adLanguage) {
		return sqlSession.update("Update.downloadReset", adLanguage);
	}

	@Override
	public int downloadChk(UpdateDTO dto) {
		return sqlSession.update("Update.downloadChk", dto);
	}
	
	/////////////////
}
