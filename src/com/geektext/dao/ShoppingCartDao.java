package com.geektext.dao;

import java.util.List;

import com.geektext.form.CartItem;
import com.geektext.form.ShoppingCart;

public interface ShoppingCartDao {
	
	public ShoppingCart getShoppingCart(int id);
	public ShoppingCart getShoppingCartByUser(String username);
	public void updateShoppingCart(ShoppingCart cart);
	public List<CartItem> getCartItems(int id);
}