package com.geektext.service.imp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.ShoppingCartDao;
import com.geektext.form.ShoppingCart;
import com.geektext.form.Userdetails;

@Service
public class ShoppingCartServiceImpl {
	
	@Autowired
	private ShoppingCartDao shoppingCartDao;

	@Transactional
	public ShoppingCart getShoppingCart(int id) {
		return shoppingCartDao.getShoppingCart(id);
	}

	@Transactional
	public ShoppingCart getShoppingCartByUser(String username) {
		return shoppingCartDao.getShoppingCartByUser(username);

	}
	
	@Transactional
    public void updateShoppingCart(ShoppingCart cart) {
		shoppingCartDao.updateShoppingCart(cart);
    }

}