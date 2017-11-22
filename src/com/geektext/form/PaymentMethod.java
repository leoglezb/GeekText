package com.geektext.form;

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
import javax.persistence.ManyToOne;
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
	
	public int getPaymentid() {
		return paymentid;
	}
	
	public void setPaymentid(int paymentid) {
		this.paymentid = paymentid;
	}
	
	@Column(name = "CardholderName")
	private String cardHolderName;
	
	public String getcardHolderName() {
		return cardHolderName;
	}
	
	public void setcardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	
	@Column(name = "CardNumber")
	private int cardnumber;
	
	public int getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(int cardnumber) {
		this.cardnumber = cardnumber;
	}

	@Column(name = "Cvv")
	private int cvv;

	public int getCvv() {
		return cvv;
	}

	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	@Column(name = "ExpirationMonth")
	private int expirationMonth;
	
	public int getExpirationMonth() {
		return expirationMonth;
	}

	public void setExpirationMonth(int expirationMonth) {
		this.expirationMonth = expirationMonth;
	}

	@Column(name = "ExpirationYear")
	private int expirationYear;

	public int getExpirationYear() {
		return expirationYear;
	}

	public void setExpirationYear(int expirationYear) {
		this.expirationYear = expirationYear;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="username")
	private Userdetails user;

	public Userdetails getUser() {
		return user;
	}

	public void setUser(Userdetails user) {
		this.user = user;
	}
}
