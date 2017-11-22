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

import com.geektext.form.PaymentMethod;
import com.geektext.form.Address;
import com.geektext.form.BeanRegisterUser;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.AddressService;
import com.geektext.service.PaymentMethodService;
import com.geektext.service.UserService;
import com.geektext.service.UserdetailsService;

@Controller
public class PaymentMethodController {

	@Autowired
	private UserdetailsService serviceuser;

	@RequestMapping(value="/creditcard", method=RequestMethod.GET)
	public String updateUser(HttpServletRequest request, Model model) {
		
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		
		model.addAttribute("userdetails", userdetails);
		
		return "creditcard";
	}
	
	@RequestMapping(value="/addCreditCard", method=RequestMethod.POST)
	public String addPaymentMethod(HttpServletRequest request, Model model, @RequestParam(value = "cardHolderName") String cardHolderName,
			@RequestParam(value = "cardnumber") int cardnumber, @RequestParam(value = "cvv") int cvv, 
			@RequestParam(value = "expirationMonth") int expirationMonth, @RequestParam(value = "expirationYear") int expirationYear){
		
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		
		PaymentMethod payment = new PaymentMethod() ;
		payment.setcardHolderName(cardHolderName);
		payment.setCardnumber(cardnumber);
		payment.setCvv(cvv);
		payment.setExpirationMonth(expirationMonth);
		payment.setExpirationYear(expirationYear);
		payment.setExpirationYear(expirationYear);
		
		userdetails.addCards(payment);
		
		serviceuser.updateUserdetails(userdetails);
		model.addAttribute("userdetails", userdetails);
		
		
		return "creditcard";
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
