package com.geektext.dao;

import java.util.List;

import com.geektext.form.Rating;

public interface RatingDao {
	public Rating getRating(Rating id) ;
	public void addRating(Rating rate) ;
	public List<Rating> listRating() ;
	public void removeRating(Rating id) ;
	public List<Rating> paginate(int[] range) ;
	public boolean exist(Rating id) ;
	public Rating ratingById(int ratingId) ;
}
