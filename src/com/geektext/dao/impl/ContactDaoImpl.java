package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.ContactDao;
import com.geektext.form.Contact;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class ContactDaoImpl implements ContactDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public Contact getContact(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Contact u = (Contact) session.get(Contact.class, id);
        return u;
    }

    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<Contact> listContact() {
        return sessionFactory.getCurrentSession().createQuery("from Contact").list();
    }
    
    public void addContact(Contact contact) {
        sessionFactory.getCurrentSession().save(contact);
    }
 
    public void removeContact(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Contact contact = (Contact) session.load(Contact.class, id);
        if (null != contact) {
            sessionFactory.getCurrentSession().delete(contact);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Contact> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Contact.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
}