package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.CountryDao;
import com.geektext.form.Country;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class CountryDaoImpl implements CountryDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public Country getCountry(String id) {
        Session session = sessionFactory.getCurrentSession();
        Country u = (Country) session.get(Country.class, id);
        return u;
    }

    @Transactional(readOnly = true)
    public boolean exist(String id) {
        Session session = sessionFactory.getCurrentSession();
        boolean result = session.get(Country.class, id) != null;
        /*Integer count = (Integer) session.createQuery("select count 1 from tbl_country c where c.id = :Id")
        		.setString("Id", id)
                .uniqueResult();
        boolean result = count > 0;*/        
        return result;
    }

    
    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<Country> listCountry() {
        return sessionFactory.getCurrentSession().createQuery("from Country").list();
    }
    
    public void addCountry(Country country) {
        sessionFactory.getCurrentSession().save(country);
    }
 
    public void removeCountry(String id) {
        Session session = sessionFactory.getCurrentSession();
        Country country = (Country) session.load(Country.class, id);
        if (null != country) {
            sessionFactory.getCurrentSession().delete(country);
        }
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<Country> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Country.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
}