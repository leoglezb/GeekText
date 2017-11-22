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
	@JoinColumn(name = "username")
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
	        //orphanRemoval = true ,
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
		this.items.add(item);
	}
	
}

