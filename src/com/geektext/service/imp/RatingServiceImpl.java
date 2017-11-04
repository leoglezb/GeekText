package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.RatingDao;
import com.geektext.form.Book;
import com.geektext.form.BookRating;
import com.geektext.form.Userdetails;
import com.geektext.service.RatingService;

@Service
public class RatingServiceImpl implements RatingService{
	@Autowired
	private RatingDao ratingDao ;

	@Transactional
	public BookRating getRating(BookRating id) {
		return ratingDao.getRating(id);
	}

	@Transactional
	public void addRating(Book book, Userdetails user, int rating, String comment) {
		ratingDao.addRating(book, user, rating, comment);
	}

	@Transactional
	public List<BookRating> listRating(int bookid) {
		return ratingDao.listRating( bookid) ;
	}

	@Transactional
	public void removeRating(BookRating id) {
		ratingDao.removeRating(id);
	}

	@Transactional
	public boolean exist(BookRating id) {
		return ratingDao.exist(id);
	}
	
	@Transactional
	public BookRating ratingById(int ratingId)
	{
		return ratingDao.ratingById(ratingId) ;
	}
	
}
