package com.geektext.form;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Genre")
public class Genre implements Serializable {
	
	private static final long serialVersionUID = -1460199869238167060L;

	/**
	 * 
	 */
	

	@Id
    @Column(name="GenreId")
	@GeneratedValue
    private int genreid;

    @Column(name="name")
    private String name;
	
	public int getGenreid() {
		return genreid;
	}

	public void setGenreid(int genreid) {
		this.genreid = genreid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
