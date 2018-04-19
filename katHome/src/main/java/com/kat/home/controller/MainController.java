package com.kat.home.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.kat.home.commons.Common;
import com.kat.home.dto.UpdateDTO;
import com.kat.home.dto.FileDTO;
import com.kat.home.service.IntroService;

@Controller
public class MainController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	LocaleResolver localeResolver;
	
	@Value("#{config['URL_FILE_COMPANY']}")
	private String companyPath;

	@Resource
	private MappingJacksonJsonView ajaxJsonView;
	
	@Inject
	IntroService introService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView dash(HttpServletRequest request) {
		ModelAndView model = new ModelAndView("main_default");
		
		model.addObject("language", localeResolver.resolveLocale(request).getLanguage());
		return model;
	}
	
	@RequestMapping(value = "/fileChk", method = RequestMethod.POST)
	public ModelAndView fileChk(@RequestParam(value="fileSeq", defaultValue="0") int fileSeq) {
		Map<String, Object> map = new HashMap<String, Object>();
		FileDTO dto = new FileDTO();
		dto.setFileSeq(fileSeq);
		map.put("fileChked", introService.fileChk(dto));
		
		return new ModelAndView(ajaxJsonView ,map);
	}
	
	@RequestMapping(value = "/companyFile", method = RequestMethod.GET)
	public void companyIntroDownload(HttpServletRequest request
										,HttpServletResponse response) {
		
		UpdateDTO dto = new UpdateDTO();
		UpdateDTO resultDto = new UpdateDTO();
		String now_language = localeResolver.resolveLocale(request).getLanguage();
		String upLang = "K";
		
		if(now_language.equals("en")) {
			upLang = "E";
		} else if(now_language.equals("ch")) {
			upLang = "C";
		}
		dto.setUpLanguage(upLang);
		resultDto = introService.getFileInfo(dto);
		
		String fileName = resultDto.getUpFileName();
		String orgFileName = resultDto.getUpOrgFileName();
		
		Common downloadFile = new Common();
		downloadFile.fileDownLoad(request, response, companyPath, fileName, orgFileName);
		
	}
	
	@RequestMapping(value = "/ciDownload", method = RequestMethod.GET)
	public void ciDownload(HttpServletRequest request
						,HttpServletResponse response
						,@RequestParam(value="fileName") String fileName) {
		String orgFileName = fileName;
		Common downloadFile = new Common();
		downloadFile.fileDownLoad(request, response, companyPath, fileName, orgFileName);
		
	}
}
