package com.geektext.dao;

import java.util.List;

import com.geektext.form.Author;

public interface AuthorDao {
	public Author getAuthor(Author id);
    public void addAuthor(Author book);
    public List<Author> listAuthor();
    public void removeAuthor(Author id);
    public List<Author> paginate(int[] range);
    public boolean exist(Author id);
}
