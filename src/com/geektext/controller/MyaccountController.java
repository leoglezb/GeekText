package com.geektext.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
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
import com.google.code.geocoder.Geocoder;
import com.google.code.geocoder.GeocoderRequestBuilder;
import com.google.code.geocoder.model.GeocodeResponse;
import com.google.code.geocoder.model.GeocoderAddressComponent;
import com.google.code.geocoder.model.GeocoderRequest;
import com.google.code.geocoder.model.LatLng;
import com.geektext.form.City;
import com.geektext.form.Country;
import com.geektext.form.State;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Location;
import com.geektext.service.CityService;
import com.geektext.service.CountryService;
import com.geektext.service.StateService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.BeanSpring;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MyaccountController {
	@Autowired
	private UserdetailsService serviceuser;
	@Autowired
	private CountryService servicecountry;
	@Autowired
	private CityService servicecity;
	@Autowired
	private StateService servicestate;

	@Autowired
	private BeanSpring beanSpring;
	
	private static final Logger logger = LoggerFactory.getLogger(EventsController.class);
	
	@RequestMapping(value = "/myaccount", method = RequestMethod.GET)
	public String myaccount(Model model, Locale locale, HttpServletRequest request)throws Exception {
        final String userIpAddress = request.getRemoteAddr();
        final String userAgent = request.getHeader("user-agent");
		final String userHost = request.getRemoteHost();
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("currentTimestamp", new Timestamp(java.lang.System.currentTimeMillis()));
		return "myaccount";
	}
	
	@RequestMapping(value = "/updateMyaccount", method = RequestMethod.POST)
	public String addMyaccount(@ModelAttribute("command") Userdetails bean, BindingResult result, MultipartHttpServletRequest request) throws Exception {
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		final Geocoder geocoder = new Geocoder();
		userdetails.setFirstname(bean.getFirstname());
		userdetails.setLastname(bean.getLastname());
		userdetails.setEmail(bean.getEmail());
		serviceuser.updateUserdetails(userdetails);
		return "redirect:/myaccount";
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
