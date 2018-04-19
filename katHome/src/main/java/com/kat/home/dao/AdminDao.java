package com.kat.home.dao;

import java.util.ArrayList;
import java.util.List;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.AdminDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.NoticeDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;


public interface AdminDao {

	//history
	public ArrayList<String> getHistoryYearList();
	public ArrayList<AdminHistoryDTO> getHistoryList();
	public int getHistoryInfoCount(AdminHistoryDTO dto);
	public AdminHistoryDTO getHistoryInfo(AdminHistoryDTO dto);
	public void adminHistoryInfoInsert(AdminHistoryDTO dto);
	public void adminHistoryInfoUpdate(AdminHistoryDTO dto);
	public void adminHistoryDetailInsert(AdminHistoryDTO dto);
	public void historyDelete(AdminHistoryDTO dto);
	public void historyYearDelete(AdminHistoryDTO dto);
	public void historyYearDeleteCascade(AdminHistoryDTO dto);
	
	//Affiliate
	public AffiliateDTO affDetail(AffiliateDTO dto);
	public int affInsert(AffiliateDTO dto);
	public int affUpdate(AffiliateDTO dto);
	public int affDelete(AffiliateDTO dto);
	
	//File
	public int insertFile(FileDTO dto);
	public String fileSelect(int fileSeq);
	public int selFileSeq(FileDTO dto);
	
	//update
	public int updateCount(CommPageDTO dto);
	public List<UpdateDTO> selectUpdate(CommPageDTO dto);
	public UpdateDTO updateDetail(UpdateDTO dto);
	public int updateInsert(UpdateDTO dto);
	public int updateModify(UpdateDTO dto);
	public int updateDel(UpdateDTO dto);
	public String updateFileName(UpdateDTO dto);
	public int downloadReset(String adLanguage);
	public int downloadChk(UpdateDTO dto);
}
