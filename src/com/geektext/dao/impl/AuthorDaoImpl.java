package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.AuthorDao;
import com.geektext.form.Author;

@Repository
public class AuthorDaoImpl implements AuthorDao{
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly = true)
	public Author getAuthor(Author id) {
		Session session = sessionFactory.getCurrentSession();
		Author u = (Author) session.get(Author.class, id);
		return u;
	}

	@Override
	public void addAuthor(Author author) {
		sessionFactory.getCurrentSession().save(author);
		
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Author> listAuthor() {
		return sessionFactory.getCurrentSession().createQuery("from Author").list();
	}

	@Override
	public void removeAuthor(Author id) {
		Session session = sessionFactory.getCurrentSession();
		Author Author = (Author) session.load(Author.class, id);
		if (null != Author) {
			sessionFactory.getCurrentSession().delete(Author);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Author> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Author.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(Author id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Author.class, id) != null;
		return result;
	}

}
