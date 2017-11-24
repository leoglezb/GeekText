package com.geektext.form;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.CascadeType;

import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.io.Serializable;

@Entity
@Table(name = "Book")
public class Book implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4769748653701863186L;

	/**
	 * 
	 */

	@Id
	@Column(name = "BookId")
	@GeneratedValue
	private int bookid;

	@Column(name = "title")
	private String title;

	@Column(name = "price")
	private double price;

	@Column(name = "paperback")
	private int paperback;

	@Temporal(TemporalType.DATE)
	@Column(name = "releasedate")
	private Date releasedate;

	@Column(name = "description")
	private String description;

	@OneToOne
	@JoinColumn(name = "authorid",insertable = false, updatable = false)
	private Author author;

	@OneToOne
	@JoinColumn(name = "genreid",insertable = false, updatable = false)
	private Genre genre;

	@OneToOne
	@JoinColumn(name = "publisherid",insertable = false, updatable = false)
	private Publisher publisher;
	
	@Column(name = "sold")
	private int sold;
	
	@Column(name = "avgrating")
	private double avgrating;
	
	@OneToMany(
	        mappedBy = "book", 
	        cascade = CascadeType.ALL, 
	        orphanRemoval = true ,
	        fetch = FetchType.EAGER
	    )
	@Fetch(value = FetchMode.SUBSELECT)
    private List<BookRating> ratings = new ArrayList<>();

	public List<BookRating> getRatings() {
		return ratings;
	}

	public void setRatings(List<BookRating> ratings) {
		this.ratings = ratings;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPaperback() {
		return paperback;
	}

	public void setPaperback(int paperback) {
		this.paperback = paperback;
	}

	public Date getReleasedate() {
		return releasedate;
	}

	public void setReleasedate(Date releasedate) {
		this.releasedate = releasedate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Author getAuthor() {
		return author;
	}

	public Genre getGenre() {
		return genre;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public int getSold() {
		return sold;
	}

	public void setSold(int sold) {
		this.sold = sold;
	}

	public double getAvgrating() {
		return avgrating;
	}

	public void setAvgrating(double avgrating) {
		this.avgrating = avgrating;
	}

	public void addRating(Userdetails user, int rating, String comment) {
		BookRating r = new BookRating();
		r.setBook(this);
		r.setComment(comment);
		r.setRating(rating);
		r.setUser(user);
		ratings.add(r);
		
	}
}
