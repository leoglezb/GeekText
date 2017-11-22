package com.geektext.dao;

import com.geektext.form.Book;
import com.geektext.form.ShoppingCart;

public interface CartItemDao {
	
    public void addBook(Book book, ShoppingCart shoppingcart);
}