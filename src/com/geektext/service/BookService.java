package com.geektext.service;

import java.util.List;

import com.geektext.form.Book;

public interface BookService {
	public Book getBook(Book id);
    public void addBook(Book book);
    public List<Book> listBook();
    public void removeBook(Book id);
    public boolean exist(Book id);   
}
