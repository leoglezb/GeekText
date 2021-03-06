package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.geektext.dao.BookDao;
import com.geektext.form.Book;
import com.geektext.pojo.Filter;
import com.geektext.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BookDao BookDAO;

	@Transactional
	public Book getBook(Book id) {
		return BookDAO.getBook(id);
	}

	@Transactional
	public void addBook(Book book) {
		BookDAO.addBook(book);

	}

	@Transactional
	public List<Book> listBook(Filter filter) {
		return BookDAO.listBook(filter);
	}
	
	@Transactional
	public List<Book> listTopSellers() {
		return BookDAO.listTopSellers();
	}

	@Transactional
	public void removeBook(Book id) {
		BookDAO.removeBook(id);

	}

	@Transactional
	public boolean exist(Book id) {
		return BookDAO.exist(id);
	}

	@Override
	public Book bookById(int bookId) {
		return BookDAO.bookById(bookId);
	}
	
	@Transactional
	public boolean canComment(String username, int bookId) {
		return BookDAO.canComment(username, bookId);
	}	
	
	@Transactional
	public void updateBook(Book book) {
		BookDAO.updateBook(book);
	}
}
