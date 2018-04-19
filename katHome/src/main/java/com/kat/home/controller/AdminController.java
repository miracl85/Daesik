package com.kat.home.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.commons.CommPaging;
import com.kat.home.commons.Common;
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.dto.FileDTO;
import com.kat.home.dto.NoticeDTO;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.service.AdminService;
import com.kat.home.service.BoardService;
import com.kat.home.service.IntroService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	LocaleResolver localeResolver;
	
	@Inject
	private BoardService boardService;
	
	@Value("#{config['URL_FILE_COMPANY']}")
	private String companyPath;
	
	@Value("#{config['URL_FILE_AFF']}")
	private String affPath;
	
	@Value("#{config['URL_FILE_NOTICE']}")
	private String noticePath;

	@Resource
	private MappingJacksonJsonView ajaxJsonView;
	
	@Value("#{config['recordSize']}")
	private int recordSize;
	
	@Value("#{config['blockSize']}")
	private int blockSize;
	
	@Inject
	AdminService adminService;
	
	@Inject
	IntroService introService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		logger.info("admin login");
		ModelAndView mav = new ModelAndView("admin/login");
		return mav;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) {
		logger.info("admin logout");
		session.invalidate();
		ModelAndView mav = new ModelAndView("admin/login");
		return mav;
	}
	
	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public ModelAndView dashBoard(HttpSession session) {
		logger.info("dashBoard");
		ModelAndView mav = new ModelAndView("admin.dash");
		return mav;
	}
	
	@RequestMapping(value = "/notice")
	public ModelAndView notice(HttpSession session
									,@RequestParam(value="cur_page", defaultValue="1") String curPage
									,@RequestParam(value="min_date", defaultValue="") String minDate
									,@RequestParam(value="max_date", defaultValue="") String maxDate
									,@RequestParam(value="search_text", defaultValue="") String searchValue
									,@RequestParam(value="sel_up_language", defaultValue="K") String language) {
		ModelAndView mav = new ModelAndView("admin.notice");
		logger.info("admin notice");
		List<NoticeDTO> rtList = new ArrayList<NoticeDTO>();
		CommPageDTO pDto = new CommPageDTO();
		int nPage = 0;
		
		pDto.setLanguage(language);
		pDto.setStartDate(minDate);
		pDto.setEndDate(maxDate);
		pDto.setSearchValue(searchValue);
		
		if(curPage.equals("")) {
			nPage = 1;
		} else {
			nPage = Integer.parseInt(curPage);
		}
		
		int totalCnt = boardService.countNotice(pDto); 
		
		pDto.setTotalCount(totalCnt);
		pDto.setNowPage(nPage);
		
		CommPaging commPage = new CommPaging(pDto, recordSize, blockSize, "adminNoticePage");
		
		rtList = boardService.listAll(pDto);
		
		mav.addObject("language",language);
		mav.addObject("searchValue", searchValue);
		mav.addObject("nowPage", pDto.getNowPage());
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("recordCnt", recordSize);
		mav.addObject("minDate", pDto.getStartDate());
		mav.addObject("maxDate", pDto.getEndDate());
		mav.addObject("resultList", rtList);
		mav.addObject("pageTag", commPage.resultString());
		
		return mav;
	}
	
	@RequestMapping(value = "/noticeInsertView")
	public ModelAndView noticeInsertView(@RequestParam(value="sel_up_language", defaultValue="K") String language) {
		ModelAndView mav = new ModelAndView("admin.notice.detail");
		logger.info("admin noticeInsertView");
		mav.addObject("language",language);
		mav.addObject("nowPage",0);
		mav.addObject("seq", 0);
		mav.addObject("type", "I");
		return mav;
	}
	
	@RequestMapping(value = "/noticeDetail")
	public ModelAndView adminNoticeModifyView(HttpServletRequest request
											,@RequestParam(value="now_page", defaultValue="0") String now_page
											,@RequestParam(value="seq",defaultValue="0") int adSeq
											,@RequestParam(value="sel_up_language", defaultValue="K") String language
											) {
		NoticeDTO resultDto = new NoticeDTO();
	
		resultDto = boardService.boardRead(adSeq);
		
		/* type 'I' Insert 
		 * type 'M' Modify
		 * */
		
		ModelAndView mav = new ModelAndView("admin.notice.detail");
		mav.addObject("resultDto", resultDto);
		mav.addObject("type", "M");
		mav.addObject("nowPage",now_page);
		mav.addObject("seq", adSeq);
		mav.addObject("language", language);
		return mav;
	}
	
	@RequestMapping(value = "/noticeInsert", method = RequestMethod.POST)
	public ModelAndView noticeInsert(HttpServletRequest request
									,HttpServletResponse response
									,HttpSession session
									,@RequestParam(value="cur_page", defaultValue="1") int curPage
									,@RequestParam(value="seq", defaultValue="0") int adSeq
									,@RequestParam(value="sel_up_language", defaultValue="K") String language
									,@RequestParam(value="notice_title", defaultValue="") String noticeTitle
									,@RequestParam(value="notice_type", defaultValue="") String noticeType
									,@RequestParam(value="editor", defaultValue="") String editor
									,@RequestParam(value="file_update_chk", defaultValue="") String fileUpdateChk
									,@RequestParam(value="type", defaultValue="I") String type
									,FileDTO fileDto) {
		ModelAndView mav = new ModelAndView("redirect:/admin/notice?sel_up_language=" + language);
		logger.info("admin noticeInsert");
		Common common = new Common();
		NoticeDTO noticeDto = new NoticeDTO();
		HashMap<String, String> returnMap = null;
		String userId = (String)session.getAttribute("userId");
		boolean fileChk = false;
		
		if(request.getParameter("notice_top") != null) {
			boardService.noticeTopUpdate(language);
		}
		
		noticeDto.setAdTitle(noticeTitle);
		noticeDto.setAdType(noticeType);
		noticeDto.setAdContents(editor);
		noticeDto.setAdLanguage(language);
		noticeDto.setCreateUserId(userId);
		noticeDto.setAdTop(request.getParameter("notice_top"));
		
		if(fileDto.getFile().getOriginalFilename() != "") {
			returnMap = common.fileUpload(request, response, noticePath, fileDto);
			fileChk = true;
		}
		
		if(type.equals("I")) {
			if(fileChk == true) {
				noticeDto.setAdOrgFileName(returnMap.get("orgFileName"));
				noticeDto.setAdFileName(returnMap.get("fileName"));
			}
			
			boardService.boardInsert(noticeDto);
			
		} else {
			String deleteFileName = "";
			noticeDto.setAdSeq(adSeq);
			
			if(fileChk == true && fileUpdateChk.equals("Y")) {
				noticeDto.setAdOrgFileName(returnMap.get("orgFileName"));
				noticeDto.setAdFileName(returnMap.get("fileName"));
			} else if(fileChk == false &&  fileUpdateChk.equals("Y")) {
				deleteFileName = boardService.getAdminNoticeFile(noticeDto);
				common.fileDelete(deleteFileName, noticePath);
				noticeDto.setAdOrgFileName(null);
				noticeDto.setAdFileName(null);
			} else {
				noticeDto.setAdOrgFileName("");
				noticeDto.setAdFileName("");
			}
			
			boardService.updateBoard(noticeDto);
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/noticeContDelete")
	public ModelAndView noticeContDelete(HttpServletRequest request
											,@RequestParam(value="now_page", defaultValue="1") String curPage
											,@RequestParam(value="seq", defaultValue="0") int adSeq
											,@RequestParam(value="sel_up_language", defaultValue="K") String language
											) {
		NoticeDTO dto = new NoticeDTO();
		Common common = new Common();
		
		dto.setAdSeq(adSeq);
		dto.setAdLanguage(language);
		
		String fileName = boardService.getAdminNoticeFile(dto);
		
		common.fileDelete(fileName, noticePath);
		boardService.deleteBoard(adSeq);
		
		ModelAndView mav = new ModelAndView("redirect:/admin/notice?cur_page=" + curPage + "&sel_up_language=" + language);
		return mav;
	}
	
	@RequestMapping(value = "/dashBoard")
	public ModelAndView adminStatistics(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("admin.statistics");
		logger.info("admin dashBoard");
		return mav;
	}
	
	@RequestMapping(value = "/affiliate")
	public ModelAndView affiliate(@RequestParam(value="curPage", defaultValue="1") int curPage) {
		logger.info("admin affiliate");
		ModelAndView mav = new ModelAndView("admin.affiliate");
		AffiliateDTO affDto = new AffiliateDTO();
		CommPageDTO pDto = new CommPageDTO();
		List<AffiliateDTO> rtList = new ArrayList<AffiliateDTO>();
		int totalCnt = 0; 
		
		totalCnt = introService.affTotalCount(affDto);
		
		pDto.setTotalCount(totalCnt);
		pDto.setNowPage(curPage);
		
		CommPaging commPage = new CommPaging(pDto, recordSize, blockSize, "adminAffPage");
		
		rtList = introService.affList(pDto);
		
		mav.addObject("nPage", pDto.getNowPage());
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("recordCnt", recordSize);
		mav.addObject("rtList", rtList);
		mav.addObject("pageTag", commPage.resultString());
		
		return mav;
	}
	
	@RequestMapping(value = "/affInsert", method = RequestMethod.POST)
	public ModelAndView affInsert(HttpServletRequest request
								,HttpServletResponse response
								,HttpSession session
								,@RequestParam(value="pup_aff_type", defaultValue="insert") String type
								,@RequestParam(value="pup_aff_seq", defaultValue="0") int affSeq
								,@RequestParam(value="pup_file_seq", defaultValue="0") int fileSeq
								,@RequestParam(value="pup_aff_url", defaultValue="none") String affUrl
								,@RequestParam(value="pup_aff_title", defaultValue="none") String affTitle
								,@RequestParam(value="pup_aff_intro", defaultValue="none") String affIntro
								,@RequestParam(value="file_update_chk", defaultValue="N") String fileUpdateChk
								,FileDTO fileDto) {
		Common common = new Common();
		AffiliateDTO dto = new AffiliateDTO();
		String userId = "";
		String url = "redirect:/admin/affiliate";
		String deleteFileNm = "";
		int result = 0;
		boolean fileChk = false;
		HashMap<String, String> returnMap = null;
		
		dto.setAffSeq(affSeq);
		dto.setFileSeq(fileSeq);
		dto.setAffTitle(affTitle);
		dto.setAffUrl(affUrl);
		dto.setAffIntro(affIntro);
		
		if((String)session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");
		} else {
			userId = "system";
		}
		dto.setCreateUserId(userId);
		
		if(fileDto.getFile().getOriginalFilename() != "") {
			returnMap = common.fileUpload(request, response, affPath, fileDto);
			fileChk = true;
		}
		
		switch(type) {
			case "insert" : 
							if(fileChk) {
								fileDto.setFileOrgNm(returnMap.get("orgFileName"));
								fileDto.setFileStrNm(returnMap.get("fileName"));
								fileDto.setCreateUserId(userId);
								fileSeq = adminService.insertFile(fileDto);
							}
							
							dto.setFileSeq(fileSeq);
							result = adminService.affInsert(dto);
							break;
			case "update" :
							if(fileChk == true && fileUpdateChk.equals("Y")) {
								String updateFileNm = adminService.fileSelect(fileSeq);
								common.fileDelete(updateFileNm, affPath);
								fileDto.setFileOrgNm(returnMap.get("orgFileName"));
								fileDto.setFileStrNm(returnMap.get("fileName"));
								fileDto.setCreateUserId(userId);
								fileSeq = adminService.insertFile(fileDto);
							} else if(fileChk == false && fileUpdateChk.equals("Y")) {
								deleteFileNm = adminService.fileSelect(fileSeq);
								common.fileDelete(deleteFileNm, affPath);
								fileSeq = 0;
							}
							
							dto.setFileSeq(fileSeq);
							result = adminService.affUpdate(dto);
							break;
			case "delete" : 
							if(fileSeq != 0) {
								deleteFileNm = adminService.fileSelect(fileSeq);
								common.fileDelete(deleteFileNm, affPath);
							}
							result = adminService.affDelete(dto);
							break;
		}
		
		url += "?result=" + result;
		
		return new ModelAndView(url);
	}
	
	@RequestMapping(value = "/affDetail")
	public ModelAndView affDetail(@RequestParam(value="affSeq") int affSeq) {
		logger.info("admin affDetail");
		Map<String, AffiliateDTO> map = new HashMap<String, AffiliateDTO>();
		AffiliateDTO dto = new AffiliateDTO();
		dto.setAffSeq(affSeq);
		map.put("result", adminService.affDetail(dto));
		
		return new ModelAndView(ajaxJsonView, map);
	}
	
	@RequestMapping(value = "/history")
	public ModelAndView history(@RequestParam(value="type", defaultValue="add") String type) {
		logger.info("admin history");
		ArrayList<String> yearList = adminService.getHistoryYearList();
		ArrayList<AdminHistoryDTO> resultList = adminService.getHistoryList();
				
		ModelAndView mav = new ModelAndView("admin.history");
		mav.addObject("type", type);
		mav.addObject("yearList", yearList);
		mav.addObject("resultList", resultList);
		return mav;
	}
	
	@RequestMapping(value = "/historyInsert")
	public ModelAndView historyInsert(HttpServletRequest request
									,@RequestParam(value="add_rowNum", defaultValue="0") int addRowNum
									,@RequestParam(value="sel_year", defaultValue="0") String hsYear) {
		
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		
		String month = "";
		String historyKo = "";
		String historyEn = "";
		String userId = "";
		
		for(int idx = 1; idx <= addRowNum; idx++) {
			
			month = request.getParameter("add_month"+idx);
			historyKo = request.getParameter("add_ko"+idx);
			historyEn = request.getParameter("add_en"+idx);
			
			if(historyKo == null || historyEn == null) {
				continue;
			}
			
			dto.setHsYear(hsYear);
			dto.setHsDtYymm(hsYear + String.format("%02d", Integer.parseInt(month)).toString());
			dto.setHsDtKo(historyKo);
			dto.setHsDtEn(historyEn);
			
			if((String)session.getAttribute("userId") != null) {
				userId = (String)session.getAttribute("userId");
			} else {
				userId = "system";
			}
			dto.setCreateUserId(userId);
			
			adminService.adminHistroyInsert(dto);
			
		}		

		return new ModelAndView("redirect:/admin/history?type=his");
	}
	
	@RequestMapping(value = "/historyDelete")
	public ModelAndView historyDelete(HttpServletRequest request
									,@RequestParam(value="hs_dt_seq_val", defaultValue="0") int hsDtSeq) {
		
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setHsDtSeq(hsDtSeq);
		dto.setModifyUserId((String)session.getAttribute("SS_USER_ID"));
		
		adminService.historyDelete(dto);
		
		return new ModelAndView("redirect:/admin/history?type=his");
	}

	@RequestMapping(value = "/historyYearDelete")
	public ModelAndView historyYearDelete(HttpServletRequest request
										,@RequestParam(value="hs_year_val", defaultValue="0") String hsYear) {
		
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setHsYear(hsYear);
		dto.setModifyUserId((String)session.getAttribute("SS_USER_ID"));
		
		adminService.historyYearDelete(dto);
		adminService.historyYearDeleteCascade(dto);
		return new ModelAndView("redirect:/admin/history?type=his");
	}
	
	@RequestMapping(value = "/update")
	public ModelAndView adminUpdate(HttpSession session
									,@RequestParam(value="cur_page", defaultValue="1") String curPage
									,@RequestParam(value="min_date", defaultValue="") String minDate
									,@RequestParam(value="max_date", defaultValue="") String maxDate
									,@RequestParam(value="search_text", defaultValue="") String searchValue
									,@RequestParam(value="sel_up_language", defaultValue="K") String language) {
		ModelAndView mav = new ModelAndView("admin.update");
		List<UpdateDTO> resultList = new ArrayList<UpdateDTO>();
		CommPageDTO pageDto = new CommPageDTO();
		int totalCnt = 0;
		int nPage = 0;
		
		logger.info("admin update");
		
		if(curPage.equals("")) {
			nPage = 1;
		} else {
			nPage = Integer.parseInt(curPage);
		}
		
		pageDto.setSearchValue(searchValue);
		pageDto.setLanguage(language);
		pageDto.setStartDate(minDate);
		pageDto.setEndDate(maxDate);
		pageDto.setNowPage(nPage);
		
		totalCnt = adminService.updateCount(pageDto);
		
		pageDto.setTotalCount(totalCnt);
		
		CommPaging commPage = new CommPaging(pageDto, recordSize, blockSize, "adminUpdatePage");
		
		resultList =  adminService.selectUpdate(pageDto);
		
		
		mav.addObject("language",language);
		mav.addObject("searchValue", searchValue);
		mav.addObject("curPage", pageDto.getNowPage());
		mav.addObject("totalCnt", totalCnt);
		mav.addObject("recordCnt", recordSize);
		mav.addObject("minDate", pageDto.getStartDate());
		mav.addObject("maxDate", pageDto.getEndDate());
		mav.addObject("resultList", resultList);
		mav.addObject("pageTag", commPage.resultString());
		
		logger.info(resultList.toString());
		
		return mav;
	}
	
	@RequestMapping(value = "/updateInsert")
	public ModelAndView updateInsert(HttpServletRequest request
									,HttpServletResponse response
									,HttpSession session
									,@RequestParam(value="pup_update_seq", defaultValue="0") String upSeq
									,@RequestParam(value="pup_update_title", defaultValue="") String upTitle
									,@RequestParam(value="pup_update_cont", defaultValue="") String upCont
									,@RequestParam(value="pup_up_download", defaultValue="N") String upDownload
									,@RequestParam(value="pup_lang", defaultValue="K") String language
									,@RequestParam(value="file_update_chk", defaultValue="N") String fileUpdateChk
									,@RequestParam(value="type", defaultValue="insert") String type
									,FileDTO fileDto) {
		ModelAndView notice = new ModelAndView("redirect:/admin/update?sel_up_language=" + language);
		Common common = new Common();
		UpdateDTO upDto = new UpdateDTO();
		String userId = (String)session.getAttribute("userId");
		HashMap<String, String> returnMap = null;
		boolean fileChk = false; 
		int seq = Integer.parseInt(upSeq);
		String fileName = "";
		
		if((String)session.getAttribute("userId") != null) {
			userId = (String)session.getAttribute("userId");
		} else {
			userId = "system";
		}
		
		if(fileDto.getFile().getOriginalFilename() != "") {
			returnMap = common.fileUpload(request, response, companyPath, fileDto);
			fileChk = true;
		}
		
		upDto.setUpSeq(seq);
		upDto.setUpTitle(upTitle);
		upDto.setUpContents(upCont);
		upDto.setUpLanguage(language);
		upDto.setCreateUserId(userId);
		upDto.setUpDownload(upDownload);
		
		logger.info("upDto :" + upDto.toString());
		
		switch(type) {
			case "insert" :
							if(fileChk == true) {
								upDto.setUpOrgFileName(returnMap.get("orgFileName"));
								upDto.setUpFileName(returnMap.get("fileName"));
							}
							
							adminService.updateInsert(upDto);
							break;
			case "update" :
							if(fileChk == true && fileUpdateChk.equals("Y")) {
								upDto.setUpOrgFileName(returnMap.get("orgFileName"));
								upDto.setUpFileName(returnMap.get("fileName"));
								fileName = adminService.updateFileName(upDto);
								common.fileDelete(fileName, companyPath);
							} else if(fileChk == false && fileUpdateChk.equals("Y")) { //파일 삭제만 했을때
								upDto.setUpOrgFileName(null);
								upDto.setUpFileName(null);
								fileName = adminService.updateFileName(upDto);
								common.fileDelete(fileName, companyPath);
							} else {
								upDto.setUpOrgFileName("");
								upDto.setUpFileName("");
							}
							//파일있지만 변화가 없을때
							
							adminService.updateModify(upDto);
							break;
			case "delete" : 
							fileName = adminService.updateFileName(upDto);
							common.fileDelete(fileName, companyPath);
							adminService.updateDel(upDto);
							break;
		}
		
		return notice;
	}
	
	@RequestMapping(value = "/updataDetail")
	public ModelAndView updataDetail(@RequestParam(value="up_seq", defaultValue="0") String upSeq
									,@RequestParam(value="sel_up_language", defaultValue="K") String language) {
		logger.info("admin updataDetail");
		Map<String, Object> map = new HashMap<String, Object>();
		UpdateDTO dto = new UpdateDTO();
		dto.setUpSeq(Integer.parseInt(upSeq));
		dto = adminService.updateDetail(dto);
		
		map.put("dto", dto);
		return new ModelAndView(ajaxJsonView, map);
	}
	
	@RequestMapping(value = "/updateDownChk")
	public ModelAndView updateDownChk(@RequestParam(value="up_seq", defaultValue="1") String upSeq
									,@RequestParam(value="download_chk", defaultValue="N") String downloadChk
									,@RequestParam(value="sel_up_language", defaultValue="K") String language) {
		ModelAndView notice = new ModelAndView("redirect:/admin/update?sel_up_language=" + language);
		UpdateDTO dto = new  UpdateDTO();
		dto.setUpSeq(Integer.parseInt(upSeq));
		adminService.downloadReset(language);
		logger.info("downloadChk : " + downloadChk);
		if(downloadChk.equals("Y")) {
			dto.setUpDownload("N");
		} else {
			dto.setUpDownload("Y");
		}
		adminService.downloadChk(dto);
		logger.info("admin updateDownChk");
		return notice;
	}
	
	@RequestMapping(value = "/statisticsOs")
	public ModelAndView adminStatisticsOS(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin.os");
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setModifyUserId((String)session.getAttribute("userId"));
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
	
	@RequestMapping(value = "/statisticsDevice")
	public ModelAndView adminStatisticsDevice(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin.device");
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setModifyUserId((String)session.getAttribute("userId"));
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
	
	@RequestMapping(value = "/statisticsMobile")
	public ModelAndView adminStatisticsMobile(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin.mobile");
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setModifyUserId((String)session.getAttribute("userId"));
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
	
	@RequestMapping(value = "/statisticsCountry")
	public ModelAndView adminStatisticsCountry(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin.country");
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setModifyUserId((String)session.getAttribute("userId"));
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
	
	@RequestMapping(value = "/statisticsPage")
	public ModelAndView adminStatisticsPage(HttpServletRequest request){
		ModelAndView mav = new ModelAndView("admin.page");
		HttpSession session = request.getSession();
		AdminHistoryDTO dto = new AdminHistoryDTO();
		dto.setModifyUserId((String)session.getAttribute("userId"));
		mav.addObject("userId", session.getAttribute("userId"));
		return mav;
	}
}
