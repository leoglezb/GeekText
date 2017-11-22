package com.geektext.dao;

import com.geektext.form.ShoppingCart;

public interface ShoppingCartDao {
	
	public ShoppingCart getShoppingCart(int id);
	public ShoppingCart getShoppingCartByUser(String username);
	public void updateShoppingCart(ShoppingCart cart);
  
}