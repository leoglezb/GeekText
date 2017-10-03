package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.GenreDao;
import com.geektext.form.Genre;

@Repository
public class GenreDaoImpl implements GenreDao{
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public Genre getGenre(Genre id) {
		Session session = sessionFactory.getCurrentSession();
		Genre u = (Genre) session.get(Genre.class, id);
		return u;
	}

	@Override
	public void addGenre(Genre genre) {
		sessionFactory.getCurrentSession().save(genre);
		
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Genre> listGenre() {
		return sessionFactory.getCurrentSession().createQuery("from Genre").list();
	}

	@Override
	public void removeGenre(Genre id) {
		Session session = sessionFactory.getCurrentSession();
		Genre Genre = (Genre) session.load(Genre.class, id);
		if (null != Genre) {
			sessionFactory.getCurrentSession().delete(Genre);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Genre> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Genre.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(Genre id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Genre.class, id) != null;
		return result;
	}

}
