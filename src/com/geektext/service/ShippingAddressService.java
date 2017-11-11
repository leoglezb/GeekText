package com.geektext.service;

import java.util.List;

import com.geektext.form.ShippingAddress;

public interface ShippingAddressService {
	public ShippingAddress getShippingAddress(ShippingAddress id);
    public void addShippingAddress(ShippingAddress address);
    public List<ShippingAddress> listShippingAddress();
    public void removeShippingAddress(ShippingAddress id);
    public boolean exist(ShippingAddress id);   
}
