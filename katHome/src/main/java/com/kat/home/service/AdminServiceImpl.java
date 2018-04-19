package com.kat.home.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dao.AdminDao;
import com.kat.home.dto.AdminDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;


@Service
public class AdminServiceImpl implements AdminService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AdminDao adminDao;
	
	//history
	@Override
	public ArrayList<String> getHistoryYearList() {
		return (ArrayList<String>)adminDao.getHistoryYearList();
	}
	
	@Override
	public ArrayList<AdminHistoryDTO> getHistoryList() {
		return (ArrayList<AdminHistoryDTO>)adminDao.getHistoryList();
	}
	
	@Override
	public void adminHistoryInfoUpdate(AdminHistoryDTO dto) {
		adminDao.adminHistoryInfoUpdate(dto);
	}
	
	@Override
	public int adminHistroyInsert(AdminHistoryDTO dto) {
		int result = 0;
		//선택한 historyinfo 존재 갯수 반환
		int historyInfoCount = adminDao.getHistoryInfoCount(dto);
		
		//선택한 year이 없을때 insert
		if(historyInfoCount == 0) {
			adminDao.adminHistoryInfoInsert(dto);
		}
		
		AdminHistoryDTO historyInfo = adminDao.getHistoryInfo(dto);
		dto.setHsSeq(historyInfo.getHsSeq());
		adminDao.adminHistoryDetailInsert(dto);
		
		return result;
	}
	
	@Override
	public void historyDelete(AdminHistoryDTO dto) {
		adminDao.historyDelete(dto);
	}

	@Override
	public void historyYearDelete(AdminHistoryDTO dto) {
		adminDao.historyYearDelete(dto);
	}

	@Override
	public void historyYearDeleteCascade(AdminHistoryDTO dto) {
		adminDao.historyYearDeleteCascade(dto);
	}

	//Affiliate
	@Override
	public AffiliateDTO affDetail(AffiliateDTO dto) {
		return adminDao.affDetail(dto);
	}
	
	@Override
	public int affInsert(AffiliateDTO dto) {
		return adminDao.affInsert(dto);
	}

	@Override
	public int affUpdate(AffiliateDTO dto) {
		return adminDao.affUpdate(dto);
	}

	@Override
	public int affDelete(AffiliateDTO dto) {
		return adminDao.affDelete(dto);
	}

	@Override
	public int insertFile(FileDTO dto) {
		int rtVal = adminDao.insertFile(dto);
		int rt = 0;
		if(rtVal == 1) {
			rt = adminDao.selFileSeq(dto);
		}
		return rt;
	}
	
	@Override
	public String fileSelect(int fileSeq) {
		return adminDao.fileSelect(fileSeq);
	}
	
	//update
	@Override
	public int downloadChk(UpdateDTO dto) {
		return adminDao.downloadChk(dto);
	}

	@Override
	public int updateCount(CommPageDTO dto) {
		return adminDao.updateCount(dto);
	}

	@Override
	public List<UpdateDTO> selectUpdate(CommPageDTO dto) {
		return adminDao.selectUpdate(dto);
	}

	@Override
	public UpdateDTO updateDetail(UpdateDTO dto) {
		return adminDao.updateDetail(dto);
	}

	@Override
	public int updateInsert(UpdateDTO dto) {
		return adminDao.updateInsert(dto);
	}

	@Override
	public int updateModify(UpdateDTO dto) {
		return adminDao.updateModify(dto);
	}

	@Override
	public int updateDel(UpdateDTO dto) {
		return adminDao.updateDel(dto);
	}

	@Override
	public String updateFileName(UpdateDTO dto) {
		return adminDao.updateFileName(dto);
	}

	@Override
	public int downloadReset(String adLanguage) {
		return adminDao.downloadReset(adLanguage);
	}
	
}
