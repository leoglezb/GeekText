package com.geektext.dao.impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.ShoppingCartDao;
import com.geektext.form.Book;
import com.geektext.form.CartItem;
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

	
	public List<CartItem> getCartItems(int id) {
		
		Session session = sessionFactory.getCurrentSession();    
		Transaction trans = session.beginTransaction();
	        ShoppingCart sc = (ShoppingCart)session.get(ShoppingCart.class, id);
	        trans.commit();
	        List<CartItem> items = sc.getItems();
	        return items;
	}

	
	public void updateShoppingCart(ShoppingCart cart) {
        sessionFactory.getCurrentSession().saveOrUpdate(cart);
    }
	
	public void insertOrderItem(CartItem item, Userdetails user) {
		Session session = sessionFactory.getCurrentSession(); 
		Query query = session.createSQLQuery("select orderid from salesorder where username = :username");
		query.setParameter("username", user.getUsername());
		Integer result = (Integer) query.uniqueResult();	
		
		
		query = session.createSQLQuery("insert orderitem (orderid, bookid, qty) values (:orderid, :bookid, :qty)");
		query.setParameter("orderid", result);
		query.setParameter("bookid", item.getBook().getBookid());
		query.setParameter("qty", 1);
		query.executeUpdate();
		
	}

}