package com.geektext.dao;

import java.util.List;

import com.geektext.form.Genre;

public interface GenreDao {
	public Genre getGenre(Genre id);
    public void addGenre(Genre genre);
    public List<Genre> listGenre();
    public void removeGenre(Genre id);
    public List<Genre> paginate(int[] range);
    public boolean exist(Genre id);
}
