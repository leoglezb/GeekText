package com.geektext.form;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Userdetails")
public class Userdetails {
	/*
	private Set<Address> billingAddresses = new HashSet<Address>(0);
	*/
	@Id
    @Column(name="username") //column name
    private String username; //variable of our object

    @Column(name="firstname")
    private String firstname;
	
    @Column(name="lastname")
    private String lastname;

    @Column(name="email")
    private String email;

    @Column(name="nickname")
    private String nickname;
    
    @Column(name="anonymous")
    private int anonymous;
    
    
    //NEEDS TO BE FIXED, THIS BREAKS THE CODE
    /*
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "HomeAddressId")
	private Address homeAddress ;
    
    @ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "ShippingAddress", joinColumns = { @JoinColumn(name = "username") }, inverseJoinColumns = { @JoinColumn(name = "addressId") })
	public Set<Address> getBillingAddresses() {
		return this.billingAddresses;
	}

    public void setHomeAddress(Set<Address> billingAddresses) {
		this.billingAddresses = billingAddresses;
	}

	public Address getHomeAddress() {
		return homeAddress;
	}

	public void setHomeAddress(Address homeAddress) {
		this.homeAddress = homeAddress;
	}
*/
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}
}    	