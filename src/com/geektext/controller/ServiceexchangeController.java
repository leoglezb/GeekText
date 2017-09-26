package com.geektext.controller;

import java.sql.Timestamp;
import javax.servlet.ServletContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.validation.BindingResult;
import com.geektext.service.GeneraldetailsService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;
import com.geektext.form.Generaldetails;
import com.geektext.form.MyList;
import com.geektext.form.Userdetails;

import org.springframework.beans.factory.annotation.Autowired;
import com.geektext.form.MultiPartFileUploadBean;
import javax.servlet.http.HttpServletRequest;
//import org.springframework.web.multipart.MultipartFile;
/**
 * Handles requests for the application home page.
 */
@Controller
public class ServiceexchangeController {
	private static final Logger logger = LoggerFactory.getLogger(ServiceexchangeController.class);
	private static final Integer BUTTONPAGINATION=1;
	@Autowired
	private GeneraldetailsService service;
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private BeanSpring beanSpring;

	@RequestMapping(value = "/serviceexchange", method = RequestMethod.GET)
	public String serviceexchange(Model model, HttpServletRequest request)
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
        Object[] valueFilter = new Object[]{beanSpring.getOp_exchange()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",BUTTONPAGINATION);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		fieldFilter = new String[]{"codope", "userdetails"};
        valueFilter = new Object[]{beanSpring.getOp_exchange(), userdetails};
		MyList<Generaldetails> myList = service.listDetails(myPage, 3, fieldFilter, valueFilter, "id", "DESC",5);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("myList", myList);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "serviceexchange";
	}

	@RequestMapping(value = "/serviceexchangepag", method = RequestMethod.POST)
	public String serviceexchangepag(Model model, HttpServletRequest request)
			throws Exception {

		String paramPage = request.getParameter("page");
		Integer page = 0;
		if (paramPage != null) {
			page = Integer.parseInt(paramPage);
		}
        String[] fieldFilter = new String[]{"codope"};
        String[] valueFilter = new String[]{beanSpring.getOp_exchange()};
		MyList<Generaldetails> list = service.listDetails(page, 10, fieldFilter, valueFilter, "id", "DESC",BUTTONPAGINATION);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("loggedInUserName", userdetails);
		model.addAttribute("list", list);
		model.addAttribute("photosFolder", beanSpring.getPhotosFolder());
		return "serviceexchangepag";
	}
	
	@RequestMapping(value = "/addExchange", method = RequestMethod.POST)
	public String addExchange(@ModelAttribute("command") MultiPartFileUploadBean bean, BindingResult result, MultipartHttpServletRequest request) {
		MultipartFile file = bean.getFile();
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Generaldetails exchange = new Generaldetails();
		exchange.setCodope(beanSpring.getOp_exchange());
		exchange.setUserdetails(userdetails);
		exchange.setAddress(userdetails.getHome_adress());
		exchange.setId_state(userdetails.getId_state());
		exchange.setId_city(userdetails.getId_city());
		exchange.setLatitud(userdetails.getLatitude());
		exchange.setLongitud(userdetails.getLongitude());
		exchange.setEstado("A");
		exchange.setTitle(bean.getTitle());
		exchange.setDescrip(bean.getDescrip());
		if (bean.getTags()!=null){
			String tags = "";
			for (String s : bean.getTags()) {
			    tags += s+" ";
			}
			exchange.setTags(tags.trim());
		}
		exchange.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
		service.addDetail(exchange);
		if (file.getSize()>0){
			ServletContext context = RequestContextUtils.getWebApplicationContext(
					request).getServletContext();
			String path = context.getRealPath("/");
			exchange=exchange.writeImageFiles(file, path, beanSpring.getPhotosFolder());
		} else {
			exchange.setPic_height(120);
		}
		
		service.updateDetail(exchange);
		return "redirect:/serviceexchange";
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
