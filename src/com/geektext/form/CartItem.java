package com.geektext.form;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "CartItem")
public class CartItem implements Serializable{
 
    /**
	 * 
	 */
	private static final long serialVersionUID = -7390007568904871744L;

	@Id
    @Column(name="CartItemId")
    @GeneratedValue
	private Long cartItemId;
	
	
    @OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "BookId")
	private Book book;
	
	@Column(name="Quantity")
	private int quantity;
	
	@Column(name="SavedForLater")
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean savedForLater;
	
	/**
	@ManyToOne//(fetch=FetchType.EAGER)
	@JoinColumn(name="ShoppingCartId", referencedColumnName="ShoppingCartId")
	private ShoppingCart shoppingCart;


	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}

	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
**/
	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "ShoppingCartId")
    private ShoppingCart cart;
	
	public ShoppingCart getCart() {
		return cart;
	}

	public void setCart(ShoppingCart cart) {
		this.cart = cart;
	}

	public Long getCartItemId() {
		return cartItemId;
	}

	public void setCartItemId(Long cartItemId) {
		this.cartItemId = cartItemId;
	}


	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public boolean isSavedForLater() {
		return savedForLater;
	}

	public void setSavedForLater(boolean savedForLater) {
		this.savedForLater = savedForLater;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}