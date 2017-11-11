package com.geektext.form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.CascadeType;

import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;

import javax.persistence.TemporalType;

import java.io.Serializable;
//FIX ALL OF IT

@Entity
@Table(name = "ShippingAddress")
public class ShippingAddress implements Serializable {

	private static final long serialVersionUID = -4769748653701863186L;	 

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	private Userdetails username;

	//many to many
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "AddressId")
	private Address address;

	
	public Userdetails getUsername() {
		return username;
	}

	public Address getAddressId() {
		return address;
	}
}