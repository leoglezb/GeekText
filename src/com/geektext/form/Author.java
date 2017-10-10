package com.geektext.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import java.io.Serializable;

@Entity
@Table(name="Author")
public class Author implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 5695508249077407311L;
	
	@Id
    @Column(name="AuthorId")
	@GeneratedValue
    private int authorid;

    @Column(name="LastName")
    private String lastname;
	
    @Column(name="FirstName")
    private String firstname;
    
    @Column(name="Biography")
    private String biography;

	public int getAuthorid() {
		return authorid;
	}

	public void setAuthorid(int authorid) {
		this.authorid = authorid;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}
}
