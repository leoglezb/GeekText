package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.AddressDao;
import com.geektext.form.Address;
import com.geektext.service.AddressService;

@Service
public class AddressServiceImpl {

	@Autowired
	private AddressDao AddressDAO;

	@Transactional
	public Address getAddress(Address id) {
		return AddressDAO.getAddress(id);
	}

	@Transactional
	public void addAddress(Address address) {
		AddressDAO.addAddress(address);

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
