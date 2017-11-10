package com.geektext.service;

import java.util.List;

import com.geektext.form.Address;

public interface AddressService {
	public Address getAddress(Address id);
    public void addAddress(Address address);
    public List<Address> listAddress();
    public void removeAddress(Address id);
    public boolean exist(Address id);   
}
