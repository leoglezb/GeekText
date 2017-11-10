package com.geektext.dao;

import java.util.List;

import com.geektext.form.ShippingAddress;

public interface ShippingAddressDao {
	
	public ShippingAddress getShippingAddress(ShippingAddress id);
    public void addShippingAddress(ShippingAddress address);
    public List<ShippingAddress> listShippingAddress();
    public void removeShippingAddress(ShippingAddress id);
    public List<ShippingAddress> paginate(int[] range);
    public boolean exist(ShippingAddress id);
	
}
