package com.kat.home.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LocaleChangeController {
	
	private static final Logger logger = LoggerFactory.getLogger(LocaleChangeController.class);
	
	@Autowired
	LocaleResolver localeResolver;
	
	@RequestMapping("/changeLanguage")
	public String change(@RequestParam(required = false) String lang
						,HttpServletRequest request
						,HttpServletResponse response
						) {
		Locale locale = null;
		String redirectURL = "redirect:" + request.getHeader("referer");
		if(lang.matches("en")) {
			locale = Locale.ENGLISH;
		} else if(lang.matches("ch")) {
			locale = Locale.CHINA;
		} else {
			locale = Locale.KOREAN;
		}
		
		localeResolver.setLocale(request, response, locale);
		localeResolver.resolveLocale(request);
		
		ModelAndView mav = new ModelAndView(redirectURL);
		mav.addObject("language" ,lang);
		
		return redirectURL;
	}

	
}
