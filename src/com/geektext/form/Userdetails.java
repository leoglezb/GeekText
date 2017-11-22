package com.geektext.form;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="Userdetails")
public class Userdetails {
	
	//private Set<Address> billingAddresses = new HashSet<Address>(0);
	
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
    
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "HomeAddressId")
	private Address homeAddress ;
	
	public void setHomeAddress(Address homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	public Address getHomeAddress() {
		return homeAddress;
	}
	
    @ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	@JoinTable(
		name = "ShippingAddress",
		joinColumns = { @JoinColumn(name = "username") }, 
		inverseJoinColumns = { @JoinColumn(name = "addressId") }
	)
	List<Address> shippingAddresses = new ArrayList<Address>();
	
	public String getUsername() {
		return username;
	}

	public List<Address> getShippingAddresses() {
		return shippingAddresses;
	}
	
	public void setShippingAddresses(List<Address> billingAddresses) {
		this.shippingAddresses = billingAddresses;
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
	
    public void addShippingAddress(Address address) {
    	this.shippingAddresses.add(address);
    }
}    	