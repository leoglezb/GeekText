package com.geektext.service;

import java.util.List;

import com.geektext.form.Address;

public interface AddressService {
	public Address getAddress(Address id);
	public Address addAddress(String address1, String address2, String city,  String state, String country, int zipCode) ;
    public List<Address> listAddress();
    public void removeAddress(Address id);
    public boolean exist(Address id);   
}
