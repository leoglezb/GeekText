package com.geektext.service;

import java.util.List;

import com.geektext.form.Author;

public interface AuthorService {
	public Author getAuthor(Author id);
    public void addAuthor(Author author);
    public List<Author> listAuthor();
    public void removeAuthor(Author id);
    public boolean exist(Author id);   
}
