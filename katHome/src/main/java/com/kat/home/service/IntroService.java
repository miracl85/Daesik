package com.kat.home.service;

import java.util.List;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;

public interface IntroService {
    //주요고객사
	public int affTotalCount(AffiliateDTO affDto);
    public List<AffiliateDTO> affList(CommPageDTO pageDto);
    
    //파일
    public UpdateDTO getFileInfo(UpdateDTO updateDto);
    public boolean fileChk(FileDTO dto);
    public List<AdminHistoryDTO> historyList();
}