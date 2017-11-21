package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.AddressDao;
import com.geektext.form.Address;

@Repository
public class AddressDaoImpl implements AddressDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public Address getAddress(Address id) {
		Session session = sessionFactory.getCurrentSession();
		Address u = (Address) session.get(Address.class, id);
		return u;
	}

	@Override
	public Address addAddress(String address1, String address2, String city,  String state, String country, int zipCode) {
		Address address = new Address() ;
		address.setAddress1(address1);
		address.setAddress2(address2);
		address.setCity(city);
		address.setCountry(country);
		address.setZipCode(zipCode) ;
		
		sessionFactory.getCurrentSession().save(address);
	
		return address;
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Address> listAddress() {
		return sessionFactory.getCurrentSession().createQuery("from Address").list();

	}

	@Override
	public void removeAddress(Address id) {
		Session session = sessionFactory.getCurrentSession();
		Address Address = (Address) session.load(Address.class, id);
		if (null != Address) {
			sessionFactory.getCurrentSession().delete(Address);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Address> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Address.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(Address id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Address.class, id) != null;
		return result;
	}
	
}

