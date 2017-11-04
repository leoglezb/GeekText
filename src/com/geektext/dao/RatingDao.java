package com.geektext.dao;

import java.util.List;

import com.geektext.form.Book;
import com.geektext.form.BookRating;
import com.geektext.form.Userdetails;

public interface RatingDao {
	public BookRating getRating(BookRating id) ;
	public void addRating(Book book, Userdetails user, int rating, String comment) ;
	public List<BookRating> listRating(int bookid) ;
	public void removeRating(BookRating id) ;
	public List<BookRating> paginate(int[] range) ;
	public boolean exist(BookRating id) ;
	public BookRating ratingById(int ratingId) ;
}
