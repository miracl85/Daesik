package com.kat.home.service;

import java.util.ArrayList;
import java.util.List;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.AdminDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;

public interface AdminService {

	//history
	public ArrayList<AdminHistoryDTO> getHistoryList();
	public ArrayList<String> getHistoryYearList();
	public int adminHistroyInsert(AdminHistoryDTO dto);
	public void adminHistoryInfoUpdate(AdminHistoryDTO dto);
	public void historyDelete(AdminHistoryDTO dto);
	public void historyYearDelete(AdminHistoryDTO dto);
	public void historyYearDeleteCascade(AdminHistoryDTO dto);
	
	//affiliate
	public int affInsert(AffiliateDTO dto);
	public int affUpdate(AffiliateDTO dto);
	public int affDelete(AffiliateDTO dto);
	public AffiliateDTO affDetail(AffiliateDTO dto);
	
	//file
	public int insertFile(FileDTO dto);
	public String fileSelect(int fileSeq);
	
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
