package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.RatingDao;
import com.geektext.form.Rating;
import com.geektext.service.RatingService;

@Service
public class RatingServiceImpl implements RatingService{
	@Autowired
	private RatingDao ratingDao ;

	@Transactional
	public Rating getRating(Rating id) {
		return ratingDao.getRating(id);
	}

	@Transactional
	public void addRating(Rating rating) {
		ratingDao.addRating(rating);
	}

	@Transactional
	public List<Rating> listRating() {
		return ratingDao.listRating() ;
	}

	@Transactional
	public void removeRating(Rating id) {
		ratingDao.removeRating(id);
	}

	@Transactional
	public boolean exist(Rating id) {
		return ratingDao.exist(id);
	}
	
	@Transactional
	public Rating ratingById(int ratingId)
	{
		return ratingDao.ratingById(ratingId) ;
	}
	
}
