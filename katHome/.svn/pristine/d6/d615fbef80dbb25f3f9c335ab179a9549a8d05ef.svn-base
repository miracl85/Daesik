package com.kat.home.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
import com.kat.home.dto.AdminHistoryDTO;
import com.kat.home.dto.AffiliateDTO;
import com.kat.home.service.IntroService;

@Controller
@RequestMapping("/katIntroduce")
public class IntroController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	private IntroService introService;
	
	@Resource
	private MappingJacksonJsonView ajaxJsonView;

	@Value("#{config['recordSize']}")
	private int recordSize;
	
	@Value("#{config['blockSize']}")
	private int blockSize;
	
	@Autowired
	LocaleResolver localeResolver;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView katIntro(HttpServletRequest request
										,@RequestParam(value = "subMenu", defaultValue = "intro") String subMenu) {
		ModelAndView model = new ModelAndView("katIntroduce");
				
		model.addObject("subMenu", subMenu);
		model.addObject("language", localeResolver.resolveLocale(request).getLanguage());
		return model;
	}
	
	@RequestMapping(value = "affList", method = RequestMethod.POST)
	public ModelAndView katAffiliate(HttpServletRequest request
									,@RequestParam(value="curPage", defaultValue="1") int curPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		AffiliateDTO affDto = new AffiliateDTO();
		List<AffiliateDTO> rtList = new ArrayList<AffiliateDTO>();
	
		CommPageDTO pDto = new CommPageDTO();
		int totalCnt = introService.affTotalCount(affDto); 
		pDto.setNowPage(curPage);
		pDto.setTotalCount(totalCnt);
		
		CommPaging commPage = new CommPaging(pDto, recordSize, blockSize, "affSelect");
		
		rtList = introService.affList(pDto);	
		map.put("language", localeResolver.resolveLocale(request).getLanguage());
		map.put("rtList", rtList);
		map.put("pageTag", commPage.resultString());
		
		return new ModelAndView(ajaxJsonView ,map);
	}
	
	@RequestMapping(value = "his", method = RequestMethod.POST)
	public ModelAndView historyList(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdminHistoryDTO> adHistoryDto = new ArrayList<AdminHistoryDTO>();
		
		adHistoryDto = introService.historyList();

		map.put("language", localeResolver.resolveLocale(request).getLanguage());	// 언어
		map.put("resultList", adHistoryDto);		// 전체
		
		return new ModelAndView(ajaxJsonView, map);
	}
	
}
