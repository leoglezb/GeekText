package com.geektext.controller;


import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;
import java.util.Map;

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

import com.geektext.form.Author;
import com.geektext.form.Book;
import com.geektext.form.Genre;
import com.geektext.form.BookRating;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.AuthorService;
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
	
	@Autowired
	private AuthorService authorService;

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
		if (strAuthorId != null)
			filter.setAuthorId(Integer.parseInt(strAuthorId));

		List<Genre> genreList = genreService.listGenre();

		PagedListHolder<Book> productList = null;
		List<Book> bookList = bookService.listBook(filter);

		productList = new PagedListHolder<Book>();
		productList.setSource(bookList);
		productList.setPageSize(10);
		model.addAttribute("bookList", productList);

		model.addAttribute("genreList", genreList);
		return "browsebooks";
	}

	@RequestMapping(value = "/topsellers", method = RequestMethod.GET)
	public String topsellers(HttpServletRequest request, Model model) {
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		
		List<Book> bookList = bookService.listTopSellers();
		model.addAttribute("bookList", bookList);
		
		return "booksTop";
	}

	@RequestMapping(value = "/author", method = RequestMethod.GET)
	public String author(HttpServletRequest request, Model model) {
		Filter filter = new Filter();
		
		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		model.addAttribute("userdetails", userdetails);
		
		String strAuthorId = request.getParameter("authorid");
		filter.setAuthorId(Integer.parseInt(strAuthorId));
		
		List<Book> bookList = bookService.listBook(filter);
		model.addAttribute("bookList", bookList);
		
		Author author = authorService.getAuthor(Integer.parseInt(strAuthorId));
		model.addAttribute("author", author);
		
		return "author";
	}
	
	@RequestMapping(value = "/filterbooks", method = RequestMethod.GET)
	public String filterbooks(HttpServletRequest request, Model model,
			@RequestParam(value = "genres[]") Integer[] genres, @RequestParam(value = "minRating") int minRating,
			@RequestParam(value = "sortBy") String sortBy, @RequestParam(value = "order") String order, @RequestParam(value = "pageSize") int pageSize,
			@RequestParam(value = "searchCrit") String searchCrit) {

		Filter filter = new Filter();
		filter.setGenres(genres);
		filter.setMinRating(minRating);
		filter.setSortBy(sortBy);
		filter.setOrder(order);
		filter.setSearchCrit(searchCrit);
		
		PagedListHolder<Book> productList = null;
		List<Book> bookList = bookService.listBook(filter);
		
		productList = new PagedListHolder<Book>();
		productList.setSource(bookList);
		productList.setPageSize(pageSize);
		

		model.addAttribute("bookList", productList);
		return "filterbooks";
	}

	
	@RequestMapping(value = "/page", method = RequestMethod.GET)
	public String page(HttpServletRequest request, Model model,
			@RequestParam(value = "genres[]") Integer[] genres, @RequestParam(value = "minRating") int minRating,
			@RequestParam(value = "sortBy") String sortBy, @RequestParam(value = "order") String order, 
			@RequestParam(value = "page") String page, 
			@RequestParam(value = "pageSize") int pageSize) {

		Filter filter = new Filter();
		filter.setGenres(genres);
		filter.setMinRating(minRating);
		filter.setSortBy(sortBy);
		filter.setOrder(order);
		
		PagedListHolder<Book> productList = null;
		List<Book> bookList = bookService.listBook(filter);
		
		productList = new PagedListHolder<Book>();
		productList.setSource(bookList);
		productList.setPageSize(pageSize);
		
		if("prev".equals(page)) {
			productList.previousPage();
		}
		else if("next".equals(page)) {
			productList.nextPage();
		}
		else {
			int pageNum = Integer.parseInt(page);
            
            productList.setPage(pageNum);
		}

		model.addAttribute("bookList", productList);
		return "filterbooks";
	}

	
	@RequestMapping(value = "/bookdetails", method = RequestMethod.GET)
	public String bookdetails(HttpServletRequest request, Model model) {
		int bookId = Integer.parseInt(request.getParameter("bookid"));

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Book book = bookService.bookById(bookId);
		List<BookRating> ratingList = ratingService.listRating(bookId);
		
		boolean canComment = bookService.canComment(loggedInUserName(), bookId);

		model.addAttribute("book", book);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("ratingList", ratingList);
		model.addAttribute("canComment", canComment);
		return "bookdetails";
	}

	@RequestMapping(value = "/addRating", method = RequestMethod.POST)
	public String addrating(HttpServletRequest request, Model model, @RequestParam(value = "bookid") int bookid,
			@RequestParam(value = "comment") String comment, @RequestParam(value = "rating") int rating) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());
		Book book = bookService.bookById(bookid);
		
		/**
		ratingService.addRating(book, userdetails, rating, comment);
		**/
		book.addRating(userdetails, rating, comment);
		bookService.updateBook(book);
		
		List<BookRating> ratingList = ratingService.listRating(bookid);
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("ratingList", ratingList);
		model.addAttribute("book", book);
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
