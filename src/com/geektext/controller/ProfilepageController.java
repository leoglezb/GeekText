package com.geektext.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geektext.form.Userdetails;
import com.geektext.service.UserdetailsService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ProfilepageController {
	@Autowired
	private UserdetailsService serviceuser;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfilepageController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/profilepage", method = RequestMethod.GET)
	public String profilepage(Locale locale, Model model) {
		logger.info("Index page! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);		
		model.addAttribute("serverTime", formattedDate );
		return "profilepage";
	}
	private String loggedInUserName() {
		String result=null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof AnonymousAuthenticationToken) {
			result = "ZooWaaUserNotLoggedIn";
		} else {
			result = auth.getName();
		}
		return result;
	}
	
}
