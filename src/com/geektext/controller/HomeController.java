package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.social.facebook.api.Reference;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.CursoredList;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.social.twitter.api.TwitterProfile;
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
import com.geektext.pojo.Location;
import com.geektext.service.GeneraldetailsService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Integer BUTTONPAGINATION=1;	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private GeneraldetailsService service;
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
        final String userIpAddress = request.getRemoteAddr();
        final String userAgent = request.getHeader("user-agent");
		final String userHost = request.getRemoteHost();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		model.addAttribute("userdetails", userdetails);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate );
		String paramPageIssues = request.getParameter("page");
		Integer pageIssues = 0;
		if (paramPageIssues != null) {
			pageIssues = Integer.parseInt(paramPageIssues);
		}
        String[] fieldFilter = new String[]{"codope"};
        Object[] valueFilter = new Object[]{beanSpring.getOp_issues()};
		MyList<Generaldetails> listIssues = service.listDetails(pageIssues, 10, fieldFilter, valueFilter, "id", "DESC",5);
		model.addAttribute("listIssues", listIssues);
		Integer pageEvents = 0;
        fieldFilter = new String[]{"codope"};
        valueFilter = new Object[]{beanSpring.getOp_events()};
		MyList<Generaldetails> listEvents = service.listDetails(pageEvents, 10, fieldFilter, valueFilter, "id", "DESC",5);
		model.addAttribute("listEvents", listEvents);
		Integer pageNewsfeeds = 0;
        fieldFilter = new String[]{"codope"};
        valueFilter = new Object[]{beanSpring.getOp_newsfeed()};
		MyList<Generaldetails> list = service.listDetails(pageNewsfeeds, 10, fieldFilter, valueFilter, "id", "DESC",1);
		model.addAttribute("list", list);
		List<Userdetails> listZoowaaUsers = serviceuser.listUserdetails();
		model.addAttribute("listZoowaaUsers", listZoowaaUsers);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "home";
	}

	@RequestMapping(value = "/homepag", method = RequestMethod.POST)
	public String homepag(Model model, HttpServletRequest request)
			throws Exception {

		String paramPage = request.getParameter("page");
		Integer page = 0;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
        String[] fieldFilter = new String[]{"codope"};
        String[] valueFilter = new String[]{beanSpring.getOp_newsfeed()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",BUTTONPAGINATION);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("loggedInUserName", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "homepag";
	}
	
	@RequestMapping(value = "/addNewsFeed", method = RequestMethod.POST)
	public String addNewsFeed(@ModelAttribute("command") MultiPartFileUploadBean bean, BindingResult result, MultipartHttpServletRequest request) {
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Generaldetails newsfeed = new Generaldetails();
		newsfeed.setCodope(beanSpring.getOp_newsfeed());
		newsfeed.setUserdetails(userdetails);
		newsfeed.setEstado("A");
		newsfeed.setTitle(bean.getTitle());
		newsfeed.setDescrip(bean.getDescrip());
		if (bean.getTags()!=null){
			String tags = "";
			for (String s : bean.getTags()) {
			    tags += s+" ";
			}
			newsfeed.setTags(tags.trim());
		}
		newsfeed.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
		service.addDetail(newsfeed);
		return "redirect:/";
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
