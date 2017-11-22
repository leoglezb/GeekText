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
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Entity
@Table(name="Userdetails")
public class Userdetails {
	
	@Id
    @Column(name="username") //column name
    private String username; //variable of our object
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
    @Column(name="firstname")
    private String firstname;
    
	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
    @Column(name="lastname")
    private String lastname;
    
    public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	
    @Column(name="email")
    private String email;
    
    public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

    @Column(name="nickname")
    private String nickname;
    
    public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
    
    @Column(name="anonymous")
    private int anonymous;
    
    public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}
    
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "HomeAddressId")
	private Address homeAddress ;
	
	public void setHomeAddress(Address homeAddress) {
		this.homeAddress = homeAddress;
	}
	
	public Address getHomeAddress() {
		return homeAddress;
	}
	
	

	/**
	 * ADD A CREDIT CARD TO THE USER
	 */
   @OneToMany (mappedBy = "user", cascade=CascadeType.ALL, orphanRemoval = true, fetch=FetchType.EAGER)
   @Fetch(value = FetchMode.SUBSELECT)
   private List<PaymentMethod> cards = new ArrayList<PaymentMethod>();

	public List<PaymentMethod> getCards() {
		return cards;
	}

	public void setCards(List<PaymentMethod> cards) {
		this.cards = cards;
	}

    public void addCards(PaymentMethod card) {
    	this.cards.add(card);
    }
	
	@ManyToMany(fetch = FetchType.EAGER, cascade = {CascadeType.ALL})
	@JoinTable(
		name = "ShippingAddress",
		joinColumns = { @JoinColumn(name = "username") }, 
		inverseJoinColumns = { @JoinColumn(name = "addressId") }
	)
	List<Address> shippingAddresses = new ArrayList<Address>();
	 
	public List<Address> getShippingAddresses() {
		return shippingAddresses;
	}
	
	public void setShippingAddresses(List<Address> billingAddresses) {
		this.shippingAddresses = billingAddresses;
	}
	
    public void addShippingAddress(Address address) {
    	this.shippingAddresses.add(address);
    }

}    	