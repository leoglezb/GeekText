package com.geektext.dao.impl;

import java.util.List;

import javax.management.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.RatingDao;
import com.geektext.form.Rating;

@Repository
public class RatingDaoImpl implements RatingDao{
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public Rating getRating(Rating id) {
		Session session = sessionFactory.getCurrentSession();
		Rating r = (Rating) session.get(Rating.class, id) ;
		return r ;
	}

	@Override
	public void addRating(Rating rate) {
		sessionFactory.getCurrentSession().save(rate) ;
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Rating> listRating() {
		return sessionFactory.getCurrentSession().createQuery("from BookRating").list();
	}

	@Override
	public void removeRating(Rating id) {
		Session session = sessionFactory.getCurrentSession();
		Rating rating = (Rating) session.load(Rating.class, id) ;
		if(null != rating)
		{
			sessionFactory.getCurrentSession().delete(rating) ;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Rating> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Rating.class) ;
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]) ;
		return criteria.list() ;
	}

	@Transactional(readOnly = true)
	public boolean exist(Rating id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Rating.class, id) != null;
		return result;
	}
	
	@Transactional(readOnly = true)
	public Rating ratingById(int rateId)
	{
		org.hibernate.Query query = sessionFactory.getCurrentSession().createQuery("from BookRating where BookRatingId = :rateId") ;
		query.setParameter("rateId", rateId) ;
		return (Rating) query.list().get(0) ;
	}
	
}
