package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.ShippingAddressDao;
import com.geektext.form.ShippingAddress;
import com.geektext.service.ShippingAddressService;

@Service
public class ShippingAddressServiceImpl {
	
	@Autowired
	private ShippingAddressDao ShippingAddressDAO;

	@Transactional
	public ShippingAddress getShippingAddress(ShippingAddress id) {
		return ShippingAddressDAO.getShippingAddress(id);
	}

	@Transactional
	public void addShippingAddress(ShippingAddress address) {
		ShippingAddressDAO.addShippingAddress(address);

	}

	@Transactional
	public List<ShippingAddress> listShippingAddress() {
		return ShippingAddressDAO.listShippingAddress();
	}

	@Transactional
	public void removeShippingAddress(ShippingAddress id) {
		ShippingAddressDAO.removeShippingAddress(id);

	}

	@Transactional
	public boolean exist(ShippingAddress id) {
		return ShippingAddressDAO.exist(id);
	}	

}
