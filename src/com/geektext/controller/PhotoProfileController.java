package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.geektext.form.MultiPartUserdetails;
import com.geektext.form.MultipartPhoto;
import com.geektext.form.Picture;
import com.geektext.form.Userdetails;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;

/**
 * Handles requests for the application home page.
 */
@Controller
public class PhotoProfileController {
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private BeanSpring beanSpring;
	
	private static final Logger logger = LoggerFactory.getLogger(PhotoProfileController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/photoprofile", method = RequestMethod.GET)
	public String photoprofile(Locale locale, Model model) {
		logger.info("Index page! The client locale is {}.", locale);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);		
		model.addAttribute("currentTimestamp", new Timestamp(java.lang.System.currentTimeMillis()));
		return "photoprofile";
	}

	@RequestMapping(value = "/changephotoprofile", method = RequestMethod.POST)
	public String changephotoprofile(@ModelAttribute("command") MultiPartUserdetails bean, Locale locale, Model model, MultipartHttpServletRequest request) {
		Userdetails userdetails= new Userdetails();
		userdetails.setUsername(loggedInUserName());
		ServletContext context = RequestContextUtils.getWebApplicationContext(request).getServletContext();
		String path = context.getRealPath("/");
		int w = Math.round(bean.getW());
		int h = Math.round(bean.getH());
		int x1 = Math.round(bean.getX1());
		int y1 = Math.round(bean.getY1());
		int x2 = Math.round(bean.getX2());
		int y2 = Math.round(bean.getY2());
		userdetails.writeSubimage(path, beanSpring.getProfilesFolder(), w, h, x1,y1, x2, y2);
		return "redirect:/myaccount";
	}

	@RequestMapping(value = "/uploadphotoprofile", method = RequestMethod.POST)
	public String uploadphotoprofile(@ModelAttribute("command") MultipartPhoto bean, Locale locale, Model model, MultipartHttpServletRequest request) {
		MultipartFile file = bean.getImage_file();
		Userdetails userdetails= new Userdetails();
		userdetails.setUsername(loggedInUserName());
		if (file != null && file.getSize()>0){
			ServletContext context = RequestContextUtils.getWebApplicationContext(
					request).getServletContext();
			String path = context.getRealPath("/");
			Picture picture = userdetails.writeImageProfileTemp(file, path, beanSpring.getProfilesFolder());
			model.addAttribute("picture", picture);
		}		
		return "uploadphotoprofile";
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
