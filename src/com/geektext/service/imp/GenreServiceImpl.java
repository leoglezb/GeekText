package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.GenreDao;
import com.geektext.form.Genre;
import com.geektext.service.GenreService;

@Service
public class GenreServiceImpl implements GenreService{

	@Autowired
	private GenreDao GenreDAO;
	
	@Transactional
	public Genre getGenre(Genre id) {
		return GenreDAO.getGenre(id);
	}

	@Transactional
	public void addGenre(Genre genre) {
		GenreDAO.addGenre(genre);
		
	}

	@Transactional
	public List<Genre> listGenre() {
		return GenreDAO.listGenre();
	}

	@Transactional
	public void removeGenre(Genre id) {
		GenreDAO.removeGenre(id);
		
	}

	@Transactional
	public boolean exist(Genre id) {
		return GenreDAO.exist(id);
	}

}
