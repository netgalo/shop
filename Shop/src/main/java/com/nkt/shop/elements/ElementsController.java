package com.nkt.shop.elements;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nkt.shop.HomeController;

@Controller
public class ElementsController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/ele", method = RequestMethod.GET)
	public String elements(Locale locale, Model model) {
		
		return "elements/index";
	}
}
