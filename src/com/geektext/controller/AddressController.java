package com.geektext.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.geektext.form.Address;
import com.geektext.form.BeanRegisterUser;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.AddressService;
import com.geektext.service.UserService;
import com.geektext.service.UserdetailsService;

@Controller
public class AddressController {

	@Autowired
	private UserdetailsService serviceuser;

	@Autowired
	private AddressService addressService;
		
	@RequestMapping(value="/address", method=RequestMethod.GET)
	public String updateUser(HttpServletRequest request, Model model) {
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		
		return "address";
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/address", method = RequestMethod.POST)
	public String addAddress(@ModelAttribute("command") BeanRegisterUser bean,
			BindingResult result, MultipartHttpServletRequest request, Model model) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());

		//MAP FROM JSP ID AND NAME
		String address1 = request.getParameter("address1");
		String address2 = request.getParameter("address2");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String zip = request.getParameter("zip");

		Address address = addressService.addAddress(address1, address2, city, state, country, Integer.parseInt(zip));
		
		userdetails.setHomeAddress(address);
		
		serviceuser.updateUserdetails(userdetails);
		model.addAttribute("userdetails", userdetails);
		
		
		return "profilemanagement";
	}

	/*Checks if user is logged in*/
	private String loggedInUserName() {
		String result = null;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof AnonymousAuthenticationToken) {
			result = "GeekTextUserNotLoggedIn";
		} else {
			result = auth.getName();
		}
		return result;
	}

}
