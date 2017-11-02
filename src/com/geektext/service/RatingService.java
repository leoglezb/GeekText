package com.geektext.service;

import java.util.List;

import com.geektext.form.Rating;;

public interface RatingService {
	public Rating getRating(Rating id) ;
	public void addRating(Rating rating) ;
	public List<Rating> listRating() ;
	public void removeRating(Rating id) ;
	public boolean exist(Rating id) ;
	public Rating ratingById(int BookRatingId) ;
}
