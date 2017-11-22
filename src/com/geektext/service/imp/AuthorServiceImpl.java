package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.AuthorDao;
import com.geektext.form.Author;
import com.geektext.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService{
	@Autowired
	private AuthorDao AuthorDAO;

	@Transactional
	public Author getAuthor(int id) {
		return AuthorDAO.getAuthor(id);
	}

	@Transactional
	public void addAuthor(Author author) {
		AuthorDAO.addAuthor(author);

	}

	@Transactional
	public List<Author> listAuthor() {
		return AuthorDAO.listAuthor();
	}

	@Transactional
	public void removeAuthor(Author id) {
		AuthorDAO.removeAuthor(id);

	}

	@Transactional
	public boolean exist(Author id) {
		return AuthorDAO.exist(id);
	}

}
