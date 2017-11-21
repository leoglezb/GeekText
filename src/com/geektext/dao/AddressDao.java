package com.geektext.dao;

import java.util.List;

import com.geektext.form.Address;

public interface AddressDao {
	
	public Address getAddress(Address id);
	public Address addAddress(String address1, String address2, String city,  String state, String country, int zipCode) ;
    public List<Address> listAddress();
    public void removeAddress(Address id);
    public List<Address> paginate(int[] range);
    public boolean exist(Address id);
	
}
