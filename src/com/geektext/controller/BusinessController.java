package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.geektext.form.Generaldetails;
import com.geektext.form.MultiPartFileUploadBean;
import com.geektext.form.MyList;
import com.geektext.form.Userdetails;
import com.geektext.service.GeneraldetailsService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BusinessController {
	private static final Integer BUTTONPAGINATION=1;
	@Autowired
	private GeneraldetailsService service;
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private BeanSpring beanSpring;
	
	private static final Logger logger = LoggerFactory.getLogger(EventsController.class);
	
	@RequestMapping(value = "/business", method = RequestMethod.GET)
	public String business(Model model, HttpServletRequest request)
			throws Exception {
		
		String paramPage = request.getParameter("page");
		String paramMyPage = request.getParameter("myPage");
		Integer page = 0;
		Integer myPage = 0;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
		if (paramMyPage != null) {
			myPage = Integer.parseInt(paramMyPage);
		}
        String[] fieldFilter = new String[]{"codope"};
        Object[] valueFilter = new Object[]{beanSpring.getOp_business()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",5);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
        fieldFilter = new String[]{"codope", "userdetails"};
        valueFilter = new Object[]{beanSpring.getOp_business(), userdetails};
		MyList<Generaldetails> myList = service.listDetails(myPage, 3, fieldFilter, valueFilter, "id", "DESC",5);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("myList", myList);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "business";
	}
	@RequestMapping(value = "/businesspag", method = RequestMethod.POST)
	public String businesspag(Model model, HttpServletRequest request)
			throws Exception {

		String paramPage = request.getParameter("page");
		Integer page = 0;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
        String[] fieldFilter = new String[]{"codope"};
        String[] valueFilter = new String[]{beanSpring.getOp_business()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",BUTTONPAGINATION);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("loggedInUserName", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "businesspag";
	}	
	@RequestMapping(value = "/addBusiness", method = RequestMethod.POST)
	public String addEvent(
			@ModelAttribute("command") MultiPartFileUploadBean bean,
			BindingResult result, MultipartHttpServletRequest request) throws Exception {
		Generaldetails  business = new Generaldetails();
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		business.setCodope(beanSpring.getOp_business());
		business.setUserdetails(userdetails);
		business.setAddress("");
		business.setId_state("FL");
		business.setId_city("Hialeah");
		business.setLatitud("");
		business.setLongitud("");
		business.setEstado("A");
		business.setTitle(bean.getTitle());
		business.setDescrip(bean.getDescrip());
		business.setLocation(bean.getLocation());
		if (bean.getTags()!=null){
			String tags = "";
			for (String s : bean.getTags()) {
			    tags += s+" ";
			}
			business.setTags(tags.trim());
		}
		business.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
		service.addDetail(business);
		return "redirect:/business";
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
