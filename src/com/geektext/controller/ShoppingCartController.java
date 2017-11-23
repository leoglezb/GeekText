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

import com.geektext.form.Book;
import com.geektext.form.Genre;
import com.geektext.form.ShoppingCart;
import com.geektext.form.BookRating;
import com.geektext.form.CartItem;
import com.geektext.form.Userdetails;
import com.geektext.pojo.Filter;
import com.geektext.service.BookService;
import com.geektext.service.GenreService;
import com.geektext.service.RatingService;
import com.geektext.service.UserService;
import com.geektext.service.UserdetailsService;
import com.geektext.service.imp.ShoppingCartServiceImpl;

@Controller
public class ShoppingCartController {

	@Autowired
	private BookService bookService;

	@Autowired
	private UserdetailsService serviceuser;

	@Autowired
	private ShoppingCartServiceImpl cartService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/addCart", method = RequestMethod.GET)
	public String addCartItem(HttpServletRequest request, Model model) {

		Userdetails userdetails = serviceuser.getUserdetails(loggedInUserName());

		ShoppingCart cart = cartService.getShoppingCartByUser(loggedInUserName());

		String strBookId = request.getParameter("bookId");
		int bookId = Integer.parseInt(strBookId);

		Book book = bookService.bookById(bookId);

		CartItem item = new CartItem();
		item.setBook(book);
		item.setQuantity(1);
		item.setSavedForLater(false);
		item.setCart(cart);
		
		cart.addCartItem(item);
		
		cartService.updateShoppingCart(cart);
		
		double total = cart.getTotal();
		
		List<CartItem> items = cart.getItemsInCart();
		List<CartItem> saved = cart.getItemsSaved();
		
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("cart", cart);
		model.addAttribute("inCart", items);
		model.addAttribute("saved", saved);
		model.addAttribute("total", total);

		return "shoppingcart";
	}
	
	@RequestMapping(value = "/shoppingcart", method = RequestMethod.GET)
	public String shoppingCart(HttpServletRequest request, Model model) {

		String user = loggedInUserName();
		
		if(user.equals("GeekTextUserNotLoggedIn"))
			return "logIn";
		
		Userdetails userdetails = serviceuser.getUserdetails(user);
		ShoppingCart cart = cartService.getShoppingCartByUser(user);

		double total = cart.getTotal();
		
		List<CartItem> items = cart.getItemsInCart();
		List<CartItem> saved = cart.getItemsSaved();
		
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("cart", cart);
		model.addAttribute("inCart", items);
		model.addAttribute("saved", saved);
		model.addAttribute("total", total);
		
		return "shoppingcart";
	}
	
	@RequestMapping(value = "/updateQty", method = RequestMethod.GET)
	public String updateQty(HttpServletRequest request, Model model, @RequestParam(value = "itemId") int itemId, @RequestParam(value = "qty") int qty) {

		String user = loggedInUserName();
		
		Userdetails userdetails = serviceuser.getUserdetails(user);
		ShoppingCart cart = cartService.getShoppingCartByUser(user);
		cart.updateQty(itemId, qty);
		
		cartService.updateShoppingCart(cart);
		
		double total = cart.getTotal();
		
		List<CartItem> items = cart.getItemsInCart();
		List<CartItem> saved = cart.getItemsSaved();
		
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("cart", cart);
		model.addAttribute("inCart", items);
		model.addAttribute("saved", saved);
		model.addAttribute("total", total);
		
		return "refreshcart";
	}
	
	@RequestMapping(value = "/saveForLater", method = RequestMethod.GET)
	public String saveForLater(HttpServletRequest request, Model model, @RequestParam(value = "itemId") int itemId) {

		String user = loggedInUserName();
		
		Userdetails userdetails = serviceuser.getUserdetails(user);
		ShoppingCart cart = cartService.getShoppingCartByUser(user);
		
		cart.saveForLater(itemId);
		cartService.updateShoppingCart(cart);
		
		double total = cart.getTotal();
		
		List<CartItem> items = cart.getItemsInCart();
		List<CartItem> saved = cart.getItemsSaved();
		
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("cart", cart);
		model.addAttribute("inCart", items);
		model.addAttribute("saved", saved);
		model.addAttribute("total", total);
		
		return "refreshcart";
	}
	
	@RequestMapping(value = "/backToCart", method = RequestMethod.GET)
	public String backToCart(HttpServletRequest request, Model model, @RequestParam(value = "itemId") int itemId) {

		String user = loggedInUserName();
		
		Userdetails userdetails = serviceuser.getUserdetails(user);
		ShoppingCart cart = cartService.getShoppingCartByUser(user);
		
		cart.backToCart(itemId);
		cartService.updateShoppingCart(cart);
		
		double total = cart.getTotal();
		
		List<CartItem> items = cart.getItemsInCart();
		List<CartItem> saved = cart.getItemsSaved();
		
		model.addAttribute("userdetails", userdetails);
		model.addAttribute("cart", cart);
		model.addAttribute("inCart", items);
		model.addAttribute("saved", saved);
		model.addAttribute("total", total);
		
		return "refreshcart";
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
