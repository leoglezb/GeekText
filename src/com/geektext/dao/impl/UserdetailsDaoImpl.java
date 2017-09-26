package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.UserdetailsDao;
import com.geektext.form.Userdetails;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class UserdetailsDaoImpl implements UserdetailsDao {

	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public Userdetails getUserdetails(String id) {
        Session session = sessionFactory.getCurrentSession();
        Userdetails u = (Userdetails) session.get(Userdetails.class, id);
        return u;
    }

    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<Userdetails> listUserdetails() {
        return sessionFactory.getCurrentSession().createQuery("from Userdetails").list();
    }
    
    public void addUserdetails(Userdetails userdetails) {
        sessionFactory.getCurrentSession().save(userdetails);
    }

    public void updateUserdetails(Userdetails userdetails) {
        sessionFactory.getCurrentSession().update(userdetails);
    }
 
    public void removeUserdetails(String id) {
        Session session = sessionFactory.getCurrentSession();
        Userdetails Userdetails = (Userdetails) session.load(Userdetails.class, id);
        if (null != Userdetails) {
            sessionFactory.getCurrentSession().delete(Userdetails);
        }
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<Userdetails> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Userdetails.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
}