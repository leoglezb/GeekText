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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.geektext.form.Book;
import com.geektext.form.Genre;
import com.geektext.form.Userdetails;
import com.geektext.service.BookService;
import com.geektext.service.GenreService;
import com.geektext.service.UserService;
import com.geektext.service.UserdetailsService;

@Controller
public class BookController {

	@Autowired
	private BookService bookService;

	@Autowired
	private GenreService genreService;

	@Autowired
	private UserdetailsService serviceuser;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/browsebooks", method = RequestMethod.GET)
	public String browsebooks(HttpServletRequest request, Model model) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		int authorId = 0;
		String strAuthorId = request.getParameter("authorid");
		if (strAuthorId != null)
			authorId = Integer.parseInt(strAuthorId);
		List<Book> bookList = bookService.listBook(authorId);
		List<Genre> genreList = genreService.listGenre();

		model.addAttribute("bookList", bookList);
		model.addAttribute("genreList", genreList);
		return "browsebooks";
	}

	@RequestMapping(value = "/filterbooks", method = RequestMethod.GET)
	public String filterbooks(HttpServletRequest request, Model model, @RequestParam("pName") String id,
			@RequestParam("lName") int pw) {
	
		List<Book> bookList = bookService.listBook(1);	

		model.addAttribute("bookList", bookList);
		return "filterbooks";
	}
	

	@RequestMapping(value = "/YourActionName", method = RequestMethod.GET)
	public String YourActionName(HttpServletRequest request, Model model, @RequestParam("memberId") String id,
			@RequestParam("memberPw") String pw) {
		List<Book> bookList = bookService.listBook(5);

		model.addAttribute("bookList", bookList);
		return "filterbooks";
	}

	@RequestMapping(value = "/bookdetails", method = RequestMethod.GET)
	public String bookdetails(HttpServletRequest request, Model model) {
		int bookId = Integer.parseInt(request.getParameter("bookid"));
		Book book = bookService.bookById(bookId);

		model.addAttribute("book", book);
		return "bookdetails";
	}

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

	class Search {
	    private String pName;
	    public String getpName() {
			return pName;
		}
		public void setpName(String pName) {
			this.pName = pName;
		}
		public String getlName() {
			return lName;
		}
		public void setlName(String lName) {
			this.lName = lName;
		}
		private String lName;

	    // getter and setters for above variables
	}
}
