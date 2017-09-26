package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
public class CommunityserviceController {
	private static final Integer BUTTONPAGINATION=1;
	@Autowired
	private BeanSpring beanSpring;
	@Autowired
	private GeneraldetailsService service;
	@Autowired
	private UserdetailsService serviceuser;
	
	
	private static final Logger logger = LoggerFactory.getLogger(EventsController.class);
	
	@RequestMapping(value = "/communityservice", method = RequestMethod.GET)
	public String communityservice(Model model, HttpServletRequest request)
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
        Object[] valueFilter = new Object[]{beanSpring.getOp_services()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",5);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
        fieldFilter = new String[]{"codope", "userdetails"};
        valueFilter = new Object[]{beanSpring.getOp_services(), userdetails};
		MyList<Generaldetails> myList = service.listDetails(myPage, 3, fieldFilter, valueFilter, "id", "DESC",5);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("myList", myList);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "communityservice";
	}
	@RequestMapping(value = "/communityservicepag", method = RequestMethod.POST)
	public String communityservicepag(Model model, HttpServletRequest request)
			throws Exception {

		String paramPage = request.getParameter("page");
		Integer page = 0;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
        String[] fieldFilter = new String[]{"codope"};
        String[] valueFilter = new String[]{beanSpring.getOp_services()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",BUTTONPAGINATION);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("loggedInUserName", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "communityservicepag";
	}
		
	@RequestMapping(value = "/addCommunityservice", method = RequestMethod.POST)
	public String addEvent(
			@ModelAttribute("command") MultiPartFileUploadBean bean,
			BindingResult result, MultipartHttpServletRequest request) throws Exception {
		Generaldetails comunservice = new Generaldetails();
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		comunservice.setCodope(beanSpring.getOp_services());
		comunservice.setUserdetails(userdetails);
		comunservice.setAddress("");
		comunservice.setId_state("FL");
		comunservice.setId_city("Hialeah");
		comunservice.setLatitud("");
		comunservice.setLongitud("");
		comunservice.setEstado("A");
		comunservice.setTitle(bean.getTitle());
		comunservice.setDescrip(bean.getDescrip());
		comunservice.setLocation(bean.getLocation());
		if (bean.getTags()!=null){
			String tags = "";
			for (String s : bean.getTags()) {
			    tags += s+" ";
			}
			comunservice.setTags(tags.trim());
		}
		comunservice.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
		service.addDetail(comunservice);
		return "redirect:/communityservice";
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
