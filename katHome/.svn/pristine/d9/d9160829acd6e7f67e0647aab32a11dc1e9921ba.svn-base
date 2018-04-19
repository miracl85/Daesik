package com.kat.home.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kat.home.commons.Common;

@Controller
public class SmartEditorController {
	
	private static final Logger logger = LoggerFactory.getLogger(SmartEditorController.class);
	
	@Value("#{config['URL_EDITOR_FILE_PATH']}")
	private String filePath;
	
	@Value("#{config['URL_RESPANSE_EDITOR_FILE_PATH']}")
	private String editorFilePath;

/*	@RequestMapping(value = "/smartEditor")
	public String smartEditro() {
		return "simple/smartEditor";
	}
	
	@RequestMapping(value = "/submit")
	public void submit(HttpServletRequest request) {
		logger.info("editor : " + request.getParameter("editor"));
	}*/
	
	@RequestMapping(value = "/fileUpload" ,method = RequestMethod.POST)
	@ResponseBody
	public String multiplePhotoUpload(HttpServletRequest request) {
	   Common common = new Common();
	   logger.info("filePath : " + filePath);
	   logger.info("editorFilePath : " + editorFilePath);
	   return common.smartEditorMultiplePhotoUpload(request ,filePath ,editorFilePath); 
	}
}


