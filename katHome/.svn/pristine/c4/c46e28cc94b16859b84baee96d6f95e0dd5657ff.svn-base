package com.kat.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJacksonJsonView;

import ch.qos.logback.classic.Logger;

import com.kat.home.commons.CommPageDTO;
import com.kat.home.commons.CommPaging;
import com.kat.home.dto.NoticeDTO;
import com.kat.home.service.BoardService;

@Controller
@RequestMapping("/katCmnt")
public class BoardController {
	private static final Logger logger = (Logger) LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService boardService;
	
	@Value("#{config['recordSize']}")
	int recordSize;
	
	@Value("#{config['blockSize']}")
	int blockSize;
	
	@Value("#{config['URL_FILE_NOTICE']}")
	String filePath;
	
	@Autowired
	LocaleResolver localeResolver;
	
	@Resource
	private MappingJacksonJsonView ajaxJsonView;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView dash(HttpServletRequest request
								,@RequestParam(value = "subMenu", defaultValue = "cmnt") String subMenu) {
		ModelAndView model = new ModelAndView("katCmnt");
		model.addObject("subMenu", subMenu);
		model.addObject("language", localeResolver.resolveLocale(request).getLanguage());
		return model;
	}
	
	// 게시글 목록
	@RequestMapping(value="/noticeView", method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(defaultValue="") String startDate
									,@RequestParam(defaultValue="") String endDate
									,@RequestParam(defaultValue="") String searchValue
									,@RequestParam(defaultValue="1") int nowPage
									,HttpServletRequest request) {
									// ,@RequestParam(value="sel_up_language", defaultValue="K") String language
		CommPageDTO pDto = new CommPageDTO();
		String language = "";
		if(localeResolver.resolveLocale(request).getLanguage()=="en") {
			language = "E";
		} else {
			language = "K";
		}
		pDto.setStartDate(startDate);
		pDto.setEndDate(endDate);
		pDto.setSearchValue(searchValue);
		pDto.setLanguage(language);
		
		int totalCount = boardService.countNotice(pDto);
		
		pDto.setNowPage(nowPage);
		pDto.setTotalCount(totalCount);
		CommPaging commPage = new CommPaging(pDto, recordSize, blockSize, "openNotice");
		
		List<NoticeDTO> list = boardService.listAll(pDto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String mobileCk = "N";
		String userAgent = (String)request.getHeader("User-Agent");
		String[] mobileos = {"iPhone", "iPod", "Android", "BlackBerry", "Windows CE", "Nokia", "Webos", "Opera Mini", "SonyEricsson", "Opera Mobi", "IEMobile"};
		int j = -1;
		if(userAgent != null && !userAgent.equals("")) {
			for(int i=0; i<mobileos.length; i++) {
				j = userAgent.indexOf(mobileos[i]);
				if(j>-1) {
					mobileCk = "Y";
				}
			}
		}
		map.put("lang", language);
		map.put("mobileCk", mobileCk);
		map.put("pDto", pDto);
		map.put("resultList", list);
		map.put("paging", commPage.resultString());

		return new ModelAndView(ajaxJsonView ,map);
	}
	
	// 게시글 팝업, 조회수 증가 처리
	@RequestMapping(value="/noticePup", method=RequestMethod.GET)
	public ModelAndView boardView(@RequestParam int adSeq) {
		
		// 조회수 증가
//		boardService.increaseViewcnt(adSeq);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", boardService.boardRead(adSeq));
		
		return new ModelAndView(ajaxJsonView ,map);
	}

    // 파일 다운로드
	@RequestMapping(value="/fileDownload", method=RequestMethod.GET)
	public void fileDownLoad(HttpServletRequest request
									 ,HttpServletResponse response
									 ,@RequestParam String fileName
									 ,@RequestParam String orgFileName) {
		boardService.fileDownLoad(request, response, filePath, fileName, orgFileName);
	}
		

}//class