package com.geektext.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.geektext.form.Book;
import com.geektext.service.BookService;

@Controller
public class BookController {

	@Autowired
	private BookService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/browsebooks", method = RequestMethod.GET)
	public String browsebooks(HttpServletRequest request, Model model) {
		List<Book> bookList = service.listBook();
		model.addAttribute("bookList", bookList);
		return "browsebooks";
	}
}
