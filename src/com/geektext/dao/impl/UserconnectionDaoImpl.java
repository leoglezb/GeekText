package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.UserconnectionDao;
import com.geektext.form.Userconnection;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class UserconnectionDaoImpl implements UserconnectionDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public Userconnection getUserconnection(String userId, String providerId, String providerUserId) {
        Session session = sessionFactory.getCurrentSession();
        Userconnection u = (Userconnection) session.get(Userconnection.class, userId+providerId+providerUserId);
        return u;
    }

    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<Userconnection> listUserconnection() {
        return sessionFactory.getCurrentSession().createQuery("from Userconnection").list();
    }
    
    public void addUserconnection(Userconnection Userconnection) {
        sessionFactory.getCurrentSession().save(Userconnection);
    }
 
    public void removeUserconnection(String userId, String providerId, String providerUserId) {
        Session session = sessionFactory.getCurrentSession();
        Userconnection userconnection = (Userconnection) session.load(Userconnection.class, userId+providerId+providerUserId);
        if (null != userconnection) {
            sessionFactory.getCurrentSession().delete(userconnection);
        }
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<Userconnection> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Userconnection.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
}