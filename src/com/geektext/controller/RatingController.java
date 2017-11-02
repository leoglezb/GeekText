package com.geektext.controller;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
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

import com.geektext.form.Book;
import com.geektext.form.Rating;
import com.geektext.form.Genre;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.BookService;
import com.geektext.service.RatingService;
import com.geektext.service.GenreService;
import com.geektext.service.UserService;
import com.geektext.service.UserdetailsService;

public class RatingController {
	
	@Autowired
	private RatingService rateService;

	@RequestMapping(value = "/bookdetails", method = RequestMethod.GET)
	public String bookratingdetails(HttpServletRequest request, Model model) {
		int rateId = Integer.parseInt(request.getParameter("bookratingid"));
		Rating rate = rateService.ratingById(rateId);
		boolean loginCheck = loggedInUserName() ;
		if(loginCheck == true)
		{	
			model.addAttribute("rating", rate);
		}	
		return "bookdetails";
	}
	
	//Checks if user is logged in
	private Boolean loggedInUserName() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth instanceof AnonymousAuthenticationToken) {
			return false ; //Not logged in
		} 
		return true;
	}
}
