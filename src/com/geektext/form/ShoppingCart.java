package com.geektext.form;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import java.io.Serializable;

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
	private double subtotal ;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	private Userdetails user;
	
	
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
	
}
