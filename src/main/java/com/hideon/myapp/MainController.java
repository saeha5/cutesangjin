package com.hideon.myapp;

import java.util.List;
import java.util.Locale;

import com.hideon.myapp.main_share.Entity.MSEntity;
import com.hideon.myapp.main_share.MSRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	@Autowired
	MSRepository msRepository;
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/share")
	public String main1(Locale locale, Model model) {
	    return "share";
	}
	
	@RequestMapping(value = "/recruitment")
	public String main2(Locale locale, Model model) {
	    return "recruitment";
	}
	
	@RequestMapping(value = "/vote")
	public String main3(Locale locale, Model model) {
	    return "vote";
	}
	

	
}
