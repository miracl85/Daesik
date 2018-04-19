package com.kat.home.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.dao.IntroDao;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;

@Service
public class IntroServiceImp implements IntroService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private IntroDao introDao;

	@Override
	public int affTotalCount(AffiliateDTO affDto) {
		return introDao.affTotalCount(affDto);
	}

	@Override
	public List<AffiliateDTO> affList(CommPageDTO pageDto) {
		return introDao.affList(pageDto);
	}

	@Override
	public UpdateDTO getFileInfo(UpdateDTO updateDto) {
		return introDao.getFileInfo(updateDto);
	}

	@Override
	public boolean fileChk(FileDTO dto) {
		boolean result = false;
		int rtCount = 0;
		rtCount = introDao.fileChk(dto);
		if(rtCount > 0) {
			result = true;
		}
		return result;
	}

	@Override
	public List<AdminHistoryDTO> historyList() {
		return introDao.getHistoryList();
	}
	
}//class