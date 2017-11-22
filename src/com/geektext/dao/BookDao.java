package com.geektext.dao;

import java.util.List;


import com.geektext.form.Book;
import com.geektext.pojo.Filter;

public interface BookDao {
	public Book getBook(Book id);
    public void addBook(Book book);
    public List<Book> listBook(Filter filter);
    public void removeBook(Book id);
    public List<Book> paginate(int[] range);
    public boolean exist(Book id);
    public Book bookById(int bookId);
    public boolean canComment(String username, int bookId);
    public List<Book> listTopSellers();
}
