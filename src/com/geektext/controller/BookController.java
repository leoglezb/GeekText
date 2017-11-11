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

import com.geektext.form.Book;
import com.geektext.form.Genre;
import com.geektext.form.BookRating;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.BookService;
import com.geektext.service.GenreService;
import com.geektext.service.RatingService;
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

	@Autowired
	private RatingService ratingService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/browsebooks", method = RequestMethod.GET)
	public String browsebooks(HttpServletRequest request, Model model) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		Filter filter = new Filter();
		int authorId = 0;

		String strAuthorId = request.getParameter("authorid");
		String strPage = request.getParameter("page");
		if (strAuthorId != null)
			filter.setAuthorId(Integer.parseInt(strAuthorId));

		List<Genre> genreList = genreService.listGenre();

		PagedListHolder<Book> productList = null;
		List<Book> bookList = bookService.listBook(filter);

		productList = new PagedListHolder<Book>();
		productList.setSource(bookList);
		productList.setPageSize(5);
		model.addAttribute("bookList", productList);

		if ("next".equals(strPage)) {
			//productList = (PagedListHolder<Book>) request.getSession().getAttribute("bookList");

			productList.nextPage();

		} else if ("prev".equals(strPage)) {
			// Return previous set of list
			//productList = (PagedListHolder<Book>) request.getSession().getAttribute("bookList");

			productList.previousPage();

		} else if(strPage != null){
			//productList = (PagedListHolder<Book>) request.getSession().getAttribute("bookList");

			int pageNum = Integer.parseInt(strPage);

			productList.setPage(pageNum);
		}

		model.addAttribute("genreList", genreList);
		return "browsebooks";
	}

	@RequestMapping(value = "/filterbooks", method = RequestMethod.GET)
	public String filterbooks(HttpServletRequest request, Model model,
			@RequestParam(value = "genres[]") Integer[] genres, @RequestParam(value = "minRating") int minRating,
			@RequestParam(value = "sortBy") String sortBy, @RequestParam(value = "order") String order) {

		Filter filter = new Filter();
		filter.setGenres(genres);
		filter.setMinRating(minRating);
		filter.setSortBy(sortBy);
		filter.setOrder(order);
		List<Book> bookList = bookService.listBook(filter);

		model.addAttribute("bookList", bookList);
		return "filterbooks";
	}

	@RequestMapping(value = "/bookdetails", method = RequestMethod.GET)
	public String bookdetails(HttpServletRequest request, Model model) {
		int bookId = Integer.parseInt(request.getParameter("bookid"));

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Book book = bookService.bookById(bookId);
		List<BookRating> ratingList = ratingService.listRating(bookId);

		model.addAttribute("book", book);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("ratingList", ratingList);
		return "bookdetails";
	}

	@RequestMapping(value = "/addRating", method = RequestMethod.POST)
	public String addrating(HttpServletRequest request, Model model, @RequestParam(value = "bookid") int bookid,
			@RequestParam(value = "comment") String comment, @RequestParam(value = "rating") int rating) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Book book = bookService.bookById(bookid);

		ratingService.addRating(book, userdetails, rating, comment);

		List<BookRating> ratingList = ratingService.listRating(bookid);
		model.addAttribute("ratingList", ratingList);
		return "ratinglist";
	}

	@RequestMapping(value = "/logIn", method = RequestMethod.GET)
	public String logIng(HttpServletRequest request, Model model) {

		return "logIn";
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

}
