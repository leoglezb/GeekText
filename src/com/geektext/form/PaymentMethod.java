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

@Entity
@Table(name = "PaymentMethod")
public class PaymentMethod implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -4769748653701863186L;

	@Id
	@Column(name = "PaymentMethodId")
	@GeneratedValue
	private int paymentid;
	
	@Column(name = "CardNumber")
	private int cardnumber;

	@Column(name = "Cvv")
	private int cvv;

	@Column(name = "ExpirationMonth")
	private int expirationMonth;

	@Column(name = "ExpirationYear")
	private int expirationYear;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	private Userdetails username;
	
	//CHECK
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "AddressId")
	private Address billingaddress;

	public Address getAddressid() {
		return billingaddress;
	}
	
	public int getPaymentid() {
		return paymentid;
	}

	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}

	public int getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(int cardnumber) {
		this.cardnumber = cardnumber;
	}

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}

	public int getExpirationMonth() {
		return expirationMonth;
	}

	public void setExpirationMonth(int expirationMonth) {
		this.expirationMonth = expirationMonth;
	}

	public int getExpirationYear() {
		return expirationYear;
	}

	public void setExpirationYear(int expirationYear) {
		this.expirationYear = expirationYear;
	}

	public Userdetails getUsername() {
		return username;
	}
	
}
