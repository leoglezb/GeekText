package com.geektext.dao;

import java.util.List;

import com.geektext.form.CartItem;
import com.geektext.form.ShoppingCart;
import com.geektext.form.Userdetails;

public interface ShoppingCartDao {
	
	public ShoppingCart getShoppingCart(int id);
	public ShoppingCart getShoppingCartByUser(String username);
	public void updateShoppingCart(ShoppingCart cart);
	public List<CartItem> getCartItems(int id);
	public void insertOrderItem(CartItem item, Userdetails user);
}