/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.geektext.dao.impl;

import com.geektext.user.User;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.geektext.dao.UserDao;


@Repository
public class UserDaoImpl implements UserDao{


	@Override
    public User getUser(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        User u = (User) session.get(User.class, id);
        return u;
    }

    @Override
    public User addUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
        return user;
    }

    @Override
    public User removeUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(user);
        return user;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<User> getAllUsers() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from User").list();
    }
    
    private SessionFactory sessionFactory;
    /**
     * @return the sessionFactory
     */
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    /**
     * @param sessionFactory the sessionFactory to set
     */
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
}
