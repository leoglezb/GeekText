package com.geektext.form;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;

@Entity
@Table(name="Publisher")
public class Publisher implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @Column(name="PublisherId")
	@GeneratedValue
    private int publisherid;

    @Column(name="name")
    private String name;

	public int getPublisherid() {
		return publisherid;
	}

	public void setPublisherid(int publisherid) {
		this.publisherid = publisherid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
