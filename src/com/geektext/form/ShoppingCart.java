package com.geektext.form;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.geektext.dao.impl.BookDaoImpl;
import com.geektext.service.BookService;
import com.geektext.service.imp.BookServiceImpl;

import javax.persistence.GeneratedValue;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "ShoppingCart")
public class ShoppingCart implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7802390665240716517L;

	@Id
    @Column(name="ShoppingCartId")
	@GeneratedValue
	private int shoppingCartId ;
	
	@Column(name = "Subtotal")
	private double subtotal;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username", insertable = false, updatable = false)
	private Userdetails user;
	
	/**
	@OneToMany(fetch=FetchType.EAGER, cascade=CascadeType.ALL, mappedBy ="shoppingCart")//, fetch=FetchType.EAGER)
	private List<CartItem> cartItems = new ArrayList<CartItem>();	
	
	
	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}
**/
	
	@OneToMany(
	        mappedBy = "cart", 
	        cascade = CascadeType.ALL, 
	        orphanRemoval = true ,
	        fetch = FetchType.EAGER
	    )
	@Fetch(value = FetchMode.SUBSELECT)
	    private List<CartItem> items = new ArrayList<>();
	
	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public Userdetails getUser() {
		return user;
	}

	public void setUser(Userdetails user) {
		this.user = user;
	}

	public int getShoppingCartId() {
		return shoppingCartId;
	}

	public void setShoppingCartId(int shoppingCartId) {
		this.shoppingCartId = shoppingCartId;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	
	
	public void addCartItem(CartItem item) {
		boolean newItem = true;
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(item.getBook().getBookid() == current.getBook().getBookid()) {
				newItem = false;
				int qty = current.getQuantity();
				current.setQuantity(++qty);
				break;
			}
		}
		if(newItem)
			this.items.add(item);
	}
	
	public double getTotal() {
		double total = 0;
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(!current.isSavedForLater())
				total += current.getQuantity() * current.getBook().getPrice();
		}
		return total;
	}
	
	public void updateQty(int itemId, int qty) {
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(current.getCartItemId() == itemId) {
				current.setQuantity(qty);
				return;
			}	
		}
	}
	
	public List<CartItem> getItemsInCart(){
		List<CartItem> inCart = new ArrayList<CartItem>();
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(!current.isSavedForLater())
				inCart.add(current);
		}
		return inCart;
	}
	
	public List<CartItem> getItemsSaved(){
		List<CartItem> inCart = new ArrayList<CartItem>();
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(current.isSavedForLater())
				inCart.add(current);
		}
		return inCart;
	}
	
	public void saveForLater(int itemId) {
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(current.getCartItemId() == itemId)
				current.setSavedForLater(true);
		}
	}
	
	public void backToCart(int itemId) {
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(current.getCartItemId() == itemId)
				current.setSavedForLater(false);
		}
	}
	
	public void removeFromCart(int itemId) {
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(current.getCartItemId() == itemId) {
				items.remove(i);
				return;
			}
		}
	}
	
	public void confirmOrder() {
		BookService bookdao = new BookServiceImpl();
		
		for(int i = 0; i < items.size(); i++) {
			CartItem current = items.get(i);
			if(!current.isSavedForLater()) {
				Book b = current.getBook();
				b.setSold(current.getQuantity());
				bookdao.updateBook(b);
				items.remove(i);
				return;
			}
		}
	}
	
}

