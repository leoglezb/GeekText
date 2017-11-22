package com.geektext.dao.impl;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.geektext.dao.CartItemDao;
import com.geektext.form.Book;
import com.geektext.form.CartItem;
import com.geektext.form.ShoppingCart;

@Repository
public class CartItemDaoImpl implements CartItemDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addBook(Book book, ShoppingCart shoppingCart) {
		CartItem cartItem = new CartItem();
	
		cartItem.setBook(book);
		//cartItem.setShoppingCart(shoppingCart);
		
		sessionFactory.getCurrentSession().save(cartItem);
		
	}

}