package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.AddressDao;
import com.geektext.form.Address;
import com.geektext.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private AddressDao AddressDAO;

	@Transactional
	public Address getAddress(int id) {
		return AddressDAO.getAddress(id);
	}

	@Transactional
	public Address addAddress(String address1, String address2, String city,  String state, String country, int zipCode) {	
		return AddressDAO.addAddress( address1, address2, city, state, country, zipCode);

	}

	@Transactional
	public List<Address> listAddress() {
		return AddressDAO.listAddress();
	}

	@Transactional
	public void removeAddress(Address id) {
		AddressDAO.removeAddress(id);

	}

	@Transactional
	public boolean exist(Address id) {
		return AddressDAO.exist(id);
	}	
}
