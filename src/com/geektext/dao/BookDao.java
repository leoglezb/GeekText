package com.geektext.dao;

import java.util.List;

import com.geektext.form.Book;

public interface BookDao {
	public Book getBook(Book id);
    public void addBook(Book book);
    public List<Book> listBook(int authorId);
    public void removeBook(Book id);
    public List<Book> paginate(int[] range);
    public boolean exist(Book id);
    public Book bookById(int bookId);
}
