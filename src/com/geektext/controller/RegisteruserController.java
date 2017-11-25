package com.geektext.controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.geektext.service.AddressService;
import com.geektext.service.UserdetailsService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.userdetails.User;

import com.geektext.form.Address;
import com.geektext.form.BeanRegisterUser;
import com.geektext.form.Userdetails;
/**
 * Handles requests for the application home page.
 */
@Controller
public class RegisteruserController {
	
	@Autowired
	private UserDetailsManager userDetailsManager;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SaltSource saltSource;
	@Autowired
	private UserdetailsService service;
	@Autowired
	private AddressService addressService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	//FIX REGISTERUSER2 TO /registeruser
	
	@RequestMapping(value = "/registeruser", method = RequestMethod.GET)
	public String registeruser(HttpServletRequest request, Model model) {
		String user_email = request.getParameter("user_email");
		model.addAttribute("user_email", user_email);
		model.addAttribute("loggedInUserName", loggedInUserName());
		return "registeruser";
	}
	
	/**
	 * Checks if password is a min of 8 characters in length, contains one uppercase character,
	 * one lowercase character, and a numerical value. 
	 */
	public boolean passwordCheck(String password)
	{
		boolean hasUpperCase = !password.equals(password.toLowerCase()) ;
		boolean hasLowerCase = !password.equals(password.toUpperCase()) ;
		boolean hasSpecial   = password.matches(".*\\d+.*");;
		
		if(password.length() > 8){
			return false ;
		}
		else {
			return true ;	
		}
	}
	
	@RequestMapping(value="/createuser", method=RequestMethod.POST)
	public String createUser(@ModelAttribute("command") BeanRegisterUser bean,
			BindingResult result, MultipartHttpServletRequest request, Model model) {
		String username = bean.getUser();
		String password = bean.getPassword();
		String user_firstname = bean.getUser_firstname();
		String user_lastname = bean.getUser_lastname();
		String user_nickname = bean.getUser_nickname();
		if (!userDetailsManager.userExists(username)) {
			if(passwordCheck(password))
			{	
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
				userdetails.setNickname(user_nickname);
				service.addUserdetails(userdetails);
				model.addAttribute("registered", "1" );
			}
		} else {
			model.addAttribute("registered", "0" );
		}
		return "registeruser";
	}	

	@RequestMapping(value = "/editpassword", method = RequestMethod.GET)
	public String editUserPassword(HttpServletRequest request, Model model) {
		Userdetails userdetails = service.getUserdetails(loggedInUserName());
		
		model.addAttribute("userdetails", userdetails);
		
		return "editpassword";
	}
	
	@RequestMapping(value="/updatepassword", method=RequestMethod.POST)
	public String updateUserPass(HttpServletRequest request, Model model, @RequestParam(value = "password") String password){

	
		userDetailsManager.changePassword("password", password);
		model.addAttribute(password) ;
		//model.addAttribute("password", password) ;
				
		return "editpassword";
	}	
	
	@RequestMapping(value = "/editprofile", method = RequestMethod.GET)
	public String editUser(HttpServletRequest request, Model model) {
		Userdetails userdetails = service.getUserdetails(loggedInUserName());
		
		
		model.addAttribute("userdetails", userdetails);
		
		return "editprofile";
	}
	
	@RequestMapping(value="/updateuser", method=RequestMethod.POST)
	//@ResponseStatus(value = HttpStatus.OK)
	public String updateUser(HttpServletRequest request, Model model, @RequestParam(value = "user_firstname") String user_firstname,
			@RequestParam(value = "user_lastname") String user_lastname, @RequestParam(value = "user_nickname") String user_nickname,
			@RequestParam(value = "user_addressId") int user_addressId, @RequestParam(value = "user_anonymous") boolean user_anonymous){
	
		Userdetails userdetails= service.getUserdetails(loggedInUserName()) ;

		userdetails.setFirstname(user_firstname);
		userdetails.setLastname(user_lastname);
		userdetails.setNickname(user_nickname);
		userdetails.setAnonymous(user_anonymous ? 1 : 0);
		
		Address a = addressService.getAddress(user_addressId);
		userdetails.setHomeAddress(a);
		
		service.updateUserdetails(userdetails);
		model.addAttribute("userdetails", userdetails);
				
		return "editprofile";
	}	
	
	@RequestMapping(value="/profilemanagement", method=RequestMethod.GET)
	public String updateUser(HttpServletRequest request, Model model) {
		Userdetails userdetails = service.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		
		return "profilemanagement";
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
