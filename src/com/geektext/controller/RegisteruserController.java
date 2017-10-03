package com.geektext.controller;

import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.geektext.service.UserdetailsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;

import com.geektext.form.BeanRegisterUser;
import com.geektext.form.Userdetails;
/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisteruserController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisteruserController.class);
	@Autowired
	private UserDetailsManager userDetailsManager;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SaltSource saltSource;
	@Autowired
	private UserdetailsService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/registeruser", method = RequestMethod.GET)
	public String registeruser(HttpServletRequest request, Model model) {
		String user_email = request.getParameter("user_email");
		model.addAttribute("user_email", user_email);
		model.addAttribute("loggedInUserName", loggedInUserName());
		return "registeruser";
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("command") BeanRegisterUser bean,
			BindingResult result, MultipartHttpServletRequest request, Model model) {
		String username = bean.getUser();
		String password = bean.getPassword();
		String user_firstname = bean.getUser_firstname();
		String user_lastname = bean.getUser_lastname();
		if (!userDetailsManager.userExists(username)) {
			List<GrantedAuthority> authorites = new ArrayList<GrantedAuthority>();
			authorites.add(new GrantedAuthorityImpl("ROLE_USER"));
			User user = new User(username, password, true, false, false, false, authorites);
			User saltedUser = new User(username, passwordEncoder.encodePassword(password, saltSource.getSalt(user)),true, false, false, false, authorites);
			userDetailsManager.createUser(saltedUser);
			Userdetails userdetails= new Userdetails();
			userdetails.setUsername(username);
			userdetails.setEmail(username);
			userdetails.setFirstname(user_firstname);
			userdetails.setLastname(user_lastname);
			service.addUserdetails(userdetails);
			model.addAttribute("registered", "1" );
		} else {
			model.addAttribute("registered", "0" );
		}
		return "registeruser";
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
