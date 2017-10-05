package com.geektext.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geektext.form.Userdetails;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private BeanSpring beanSpring;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Locale locale, Model model) throws Exception{
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		logger.info("Index page! The client locale is {}.", locale);
        Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		model.addAttribute("userdetails", userdetails);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		List<Userdetails> listUsers = serviceuser.listUserdetails();
		model.addAttribute("listUsers", listUsers);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "home";
	}
	
	private String loggedInUserName() {
		String result=null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof AnonymousAuthenticationToken) {
			result = "GeekTextUserNotLoggedIn";
		} else {
			result = auth.getName();
		}
		return result;
	}
	
}
