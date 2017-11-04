package com.geektext.form;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import java.io.Serializable;

@Entity
@Table(name = "BookRating")
public class BookRating implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2184517058814198643L;

	@Id
    @Column(name="BookRatingId")
	@GeneratedValue
	private int bookRatingId ;
	
	@Column(name = "Rating")
	private int rating ;
	
	@Column(name = "Comment")
	private String comment ;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "bookid")
	private Book book;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	private Userdetails user;
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public Userdetails getUser() {
		return user;
	}

	public void setUser(Userdetails user) {
		this.user = user;
	}

	public int getBookRatingId(){
		return bookRatingId ;
	}
	
	public void setBookRatingId(int bookRatingId) {
		this.bookRatingId = bookRatingId ;
	}
	
	public int getRating() {
		return rating ;
	}
	
	public void setRating(int rating) {
		this.rating = rating ;
	}
	
	public String getComment() {
		return comment ;
	}
	
	public void setComment(String comment) {
		this.comment = comment ;
	}
	
}
