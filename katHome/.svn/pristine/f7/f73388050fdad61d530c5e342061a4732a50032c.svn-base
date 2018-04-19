package com.kat.home.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/katCivilian")
public class CiviController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView dash(@RequestParam(value = "subMenu", defaultValue = "smt") String subMenu) {
		ModelAndView model = new ModelAndView("katCivilian");
		model.addObject("subMenu", subMenu);
		return model;
	}
}
