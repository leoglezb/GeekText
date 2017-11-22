package com.geektext.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.ShoppingCartDao;
import com.geektext.form.Book;
import com.geektext.form.ShoppingCart;
import com.geektext.form.Userdetails;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public ShoppingCart getShoppingCart(int id) {
		Session session = sessionFactory.getCurrentSession();
		ShoppingCart u = (ShoppingCart) session.get(ShoppingCart.class, id);
		return u;
	}
	
	@Override
	public ShoppingCart getShoppingCartByUser(String username) {
		Query query = sessionFactory.getCurrentSession().createQuery("from ShoppingCart where username = :username");
		query.setParameter("username", username);
		return (ShoppingCart) query.list().get(0);
	}

	public void updateShoppingCart(ShoppingCart cart) {
        sessionFactory.getCurrentSession().saveOrUpdate(cart);
    }
	

}