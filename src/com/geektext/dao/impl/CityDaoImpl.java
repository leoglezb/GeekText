package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.CityDao;
import com.geektext.form.City;
import com.geektext.form.Country;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class CityDaoImpl implements CityDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public City getCity(City id) {
        Session session = sessionFactory.getCurrentSession();
        City u = (City) session.get(City.class, id);
        return u;
    }

    @Transactional(readOnly = true)
    public boolean exist(City id) {
        Session session = sessionFactory.getCurrentSession();
        boolean result = session.get(City.class, id) != null;
        return result;
    }

    public void addCity(City City) {
        sessionFactory.getCurrentSession().save(City);
    }
 
    public void removeCity(City id) {
        Session session = sessionFactory.getCurrentSession();
        City City = (City) session.load(City.class, id);
        if (null != City) {
            sessionFactory.getCurrentSession().delete(City);
        }
    }
    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<City> listCity() {
        return sessionFactory.getCurrentSession().createQuery("from City").list();
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<City> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(City.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
}