package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.BookDao;
import com.geektext.form.Book;
import com.geektext.pojo.Filter;

@Repository
public class BookDaoImpl implements BookDao {
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Transactional(readOnly = true)
	public Book getBook(Book id) {
		Session session = sessionFactory.getCurrentSession();
		Book u = (Book) session.get(Book.class, id);
		return u;
	}

	@Override
	public void addBook(Book book) {
		sessionFactory.getCurrentSession().save(book);

	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Book> listBook(Filter filter) {
		int authorId = filter.getAuthorId();
		Integer[] genres = filter.getGenres();
		String queryStr = "from Book where (:authorid = 0 or authorid = :authorid)";
		if(genres != null && genres.length > 0 && !(genres.length == 1 && genres[0] == 0)) {
			String allGenre = "(";
			for(int i = 0; i < genres.length; i++) {
				allGenre += genres[i] + ",";
			}
			allGenre = allGenre.substring(0, allGenre.length()-1) + ")";
			queryStr += " and (genreid in " + allGenre + ")";
		}
		Query query = sessionFactory.getCurrentSession().createQuery(queryStr);
		query.setParameter("authorid", authorId);
		return query.list();
	}
	
	@Transactional(readOnly = true)
	public Book bookById(int bookId) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Book where bookid = :bookid");
		query.setParameter("bookid", bookId);
		return (Book) query.list().get(0);
	}

	@Override
	public void removeBook(Book id) {
		Session session = sessionFactory.getCurrentSession();
		Book Book = (Book) session.load(Book.class, id);
		if (null != Book) {
			sessionFactory.getCurrentSession().delete(Book);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Book> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Book.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(Book id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(Book.class, id) != null;
		return result;
	}

}
