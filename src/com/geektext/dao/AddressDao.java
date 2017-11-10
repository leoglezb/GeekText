package com.geektext.dao;

import java.util.List;

import com.geektext.form.Address;

public interface AddressDao {
	
	public Address getAddress(Address id);
    public void addAddress(Address address);
    public List<Address> listAddress();
    public void removeAddress(Address id);
    public List<Address> paginate(int[] range);
    public boolean exist(Address id);
	
}
