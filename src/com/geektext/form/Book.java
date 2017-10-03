package com.geektext.form;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import java.io.Serializable;

@Entity
@Table(name="Book")
public class Book implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="BookId")
	@GeneratedValue
    private int bookid;

    @Column(name="title")
    private String title;
	
    @Column(name="price")
    private double price;

    @Column(name="paperback")
    private int paperback;

    @Column(name="releasedate")
    private Date releasedate;
    
    @Column(name="description")
    private String description;
    
    @OneToOne(mappedBy = "book")
    private Genre genre;
    
    @OneToOne(mappedBy = "book")
    private Publisher publisher;

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

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}
}
