package com.geektext.service;

import java.util.List;

import com.geektext.form.Book;
import com.geektext.pojo.Filter;

public interface BookService {
	public Book getBook(Book id);
    public void addBook(Book book);
    public List<Book> listBook(Filter filter);
    public void removeBook(Book id);
    public boolean exist(Book id);  
    public Book bookById(int bookId);
    public boolean canComment(String username, int bookId);
    public List<Book> listTopSellers();
    public void updateBook(Book book);
}
