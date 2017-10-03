package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.PublisherDao;
import com.geektext.form.Publisher;

@Repository
public class PublisherDaoImpl implements PublisherDao{
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly = true)
	public Publisher getPublisher(Publisher id) {
		Session session = sessionFactory.getCurrentSession();
		Publisher u = (Publisher) session.get(Publisher.class, id);
		return u;
	}

	@Override
	public void addPublisher(Publisher publisher) {
		sessionFactory.getCurrentSession().save(publisher);
		
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Publisher> listPublisher() {
		return sessionFactory.getCurrentSession().createQuery("from Publisher").list();
	}

	@Override
	public void removePublisher(Publisher id) {
		Session session = sessionFactory.getCurrentSession();
		Publisher Publisher = (Publisher) session.load(Publisher.class, id);
		if (null != Publisher) {
			sessionFactory.getCurrentSession().delete(Publisher);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Publisher> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Publisher.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(Publisher id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Publisher.class, id) != null;
		return result;
	}
}
