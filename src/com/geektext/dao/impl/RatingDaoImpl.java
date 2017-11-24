package com.geektext.dao.impl;

import java.util.List;

import org.hibernate.Query;

import org.hibernate.Criteria;
import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.RatingDao;
import com.geektext.form.Book;
import com.geektext.form.BookRating;
import com.geektext.form.Userdetails;

@Repository
public class RatingDaoImpl implements RatingDao {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly = true)
	public BookRating getRating(BookRating id) {
		Session session = sessionFactory.getCurrentSession();
		BookRating r = (BookRating) session.get(BookRating.class, id);
		return r;
	}

	@Transactional
	public void addRating(Book book, Userdetails user, int rating, String comment) {
		BookRating r = new BookRating();
		r.setBook(book);
		r.setUser(user);
		r.setRating(rating);
		r.setComment(comment);

		Session session = sessionFactory.getCurrentSession();
		session.setFlushMode(FlushMode.COMMIT);

		session.save(r);
		//session.flush();
		//session.clear();
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<BookRating> listRating(int bookid) {
		Query query = sessionFactory.getCurrentSession().createQuery("from BookRating where bookid = :bookid");
		query.setParameter("bookid", bookid);

		return query.list();
	}

	@Override
	public void removeRating(BookRating id) {
		Session session = sessionFactory.getCurrentSession();
		BookRating rating = (BookRating) session.load(BookRating.class, id);
		if (null != rating) {
			sessionFactory.getCurrentSession().delete(rating);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<BookRating> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(BookRating.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(BookRating id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(BookRating.class, id) != null;
		return result;
	}

	@Transactional(readOnly = true)
	public BookRating ratingById(int rateId) {
		org.hibernate.Query query = sessionFactory.getCurrentSession()
				.createQuery("from BookRating where BookRatingId = :rateId");
		query.setParameter("rateId", rateId);
		return (BookRating) query.list().get(0);
	}

}
