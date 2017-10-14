package com.geektext.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.geektext.form.Book;
import com.geektext.form.Genre;
import com.geektext.service.BookService;
import com.geektext.service.GenreService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;
	
	@Autowired
	private GenreService genreService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/browsebooks", method = RequestMethod.GET)
	public String browsebooks(HttpServletRequest request, Model model) {
		int authorId = 0;
		String strAuthorId = request.getParameter("authorid");
		if(strAuthorId != null)
			authorId = Integer.parseInt(strAuthorId);
		List<Book> bookList = bookService.listBook(authorId);
		List<Genre> genreList = genreService.listGenre();
		
		
		model.addAttribute("bookList", bookList);
		model.addAttribute("genreList", genreList);
		return "browsebooks";
	}
	
	@RequestMapping(value = "/bookdetails", method = RequestMethod.GET)
	public String bookdetails(HttpServletRequest request, Model model) {
		int bookId = Integer.parseInt(request.getParameter("bookid"));
		Book book = bookService.bookById(bookId);
		
		model.addAttribute("book", book);
		return "bookdetails";
	}
}
