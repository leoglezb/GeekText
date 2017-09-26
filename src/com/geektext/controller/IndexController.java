package com.geektext.controller;

import java.util.Locale;
import java.text.DateFormat;
import java.util.Date;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geektext.form.Userdetails;
import com.geektext.pojo.Location;
import com.geektext.service.UserdetailsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;


/**
 * Handles requests for the application home page.
 */
@Controller
public class IndexController {
	@Autowired
	private UserdetailsService serviceuser;
	
	private static final Logger logger = LoggerFactory.getLogger(IndexController.class);

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Locale locale, Model model) throws Exception{
		/*(SecurityContext.userSignedIn()) {
			new RedirectView("/login", true).render(null, request, response);
		}*/
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());		
		model.addAttribute("userdetails", userdetails);
		logger.info("Index page! The client locale is {}.", locale);
        final String userIpAddress = request.getRemoteAddr();
        final String userAgent = request.getHeader("user-agent");
		final String userHost = request.getRemoteHost();
		Date date = new Date();
		String urlStr=null;
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		if (userIpAddress.equals("127.0.0.1")){
			urlStr="http://freegeoip.net/xml/98.203.51.54";
		} else{
			urlStr="http://freegeoip.net/xml/"+userIpAddress;
		}
		Location location = new Location(urlStr);
		model.addAttribute("location",location);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		return "index";
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
