package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.ShippingAddressDao;
import com.geektext.form.ShippingAddress;

@Repository
public class ShippingAddressDaoImpl implements ShippingAddressDao{

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public ShippingAddress getShippingAddress(ShippingAddress id) {
		Session session = sessionFactory.getCurrentSession();
		ShippingAddress u = (ShippingAddress) session.get(ShippingAddress.class, id);
		return u;
	}

	@Override
	public void addShippingAddress(ShippingAddress address) {
		sessionFactory.getCurrentSession().save(address);
		
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<ShippingAddress> listAddress() {
		return sessionFactory.getCurrentSession().createQuery("from Shipping Address").list();
	}

	@Override
	public void removeShippingAddress(ShippingAddress id) {
		Session session = sessionFactory.getCurrentSession();
		ShippingAddress ShippingAddress = (ShippingAddress) session.load(ShippingAddress.class, id);
		if (null != ShippingAddress) {
			sessionFactory.getCurrentSession().delete(ShippingAddress);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ShippingAddress> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(ShippingAddress.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(ShippingAddress id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(ShippingAddress.class, id) != null;
		return result;
	}

	@Override
	public List<ShippingAddress> listShippingAddress() {
		// TODO Auto-generated method stub
		return null;
	}
}
