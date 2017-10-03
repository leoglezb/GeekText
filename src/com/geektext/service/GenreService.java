package com.geektext.service;

import java.util.List;

import com.geektext.form.Genre;

public interface GenreService {
	public Genre getGenre(Genre id);
    public void addGenre(Genre genre);
    public List<Genre> listGenre();
    public void removeGenre(Genre id);
    public boolean exist(Genre id); 
}
