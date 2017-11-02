package com.geektext.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import java.io.Serializable;

@Entity
@Table(name = "BookRating")
public class Rating implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2184517058814198643L;

	@Id
    @Column(name="BookRatingId")
	@GeneratedValue
	private int BookRatingId ;
	
	@Column(name = "OrderItemId")
	private int OrderItemId ;
	
	@Column(name = "Rating")
	private int Rating ;
	
	@Column(name = "Comment")
	private String Comment ;
	
	public int getBookRatingId(){
		return BookRatingId ;
	}
	
	public void setBookRatingId(int bookRatingId) {
		this.BookRatingId = bookRatingId ;
	}
	
	public int getOrderItemId() {
		return OrderItemId ;
	}
	
	public void setOrderItemId(int orderItemId) {
		this.OrderItemId = orderItemId ;
	}
	
	public int getRating() {
		return Rating ;
	}
	
	public void setRating(int rating) {
		this.Rating = rating ;
	}
	
	public String getComment() {
		return Comment ;
	}
	
	public void setComment(String comment) {
		this.Comment = comment ;
	}
	
}
