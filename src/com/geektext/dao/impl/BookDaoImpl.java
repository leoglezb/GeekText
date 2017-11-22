package com.geektext.dao.impl;

import java.math.BigInteger;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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
		double minRating = filter.getMinRating();
		Integer[] genres = filter.getGenres();
		String sortBy = filter.getSortBy();
		String order = filter.getOrder();
		String searchCrit = filter.getSearchCrit();
		
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(Book.class);
		crit.createAlias("author", "a");
		crit.createAlias("genre", "g");
		if(authorId > 0)
			crit.add(Restrictions.eq( "a.authorid", new Integer(authorId) ));
		if(genres != null && genres.length > 0 && !(genres.length == 1 && genres[0] == 0))
			crit.add(Restrictions.in( "g.genreid", genres));
		crit.add(Restrictions.ge( "avgrating", new Double(minRating)));
		if(!sortBy.equals("")) {
			if(order.equals("ASC"))
				crit.addOrder(Order.asc(sortBy.equals("firstname")?"a.firstname":sortBy));
			else
				crit.addOrder(Order.desc(sortBy.equals("firstname")?"a.firstname":sortBy));
		}
		if(!searchCrit.equals("")) {
			crit.add(Restrictions.disjunction()
					.add(Restrictions.ilike("title", searchCrit, MatchMode.ANYWHERE))
					.add(Restrictions.ilike("a.firstname", searchCrit, MatchMode.ANYWHERE))
					.add(Restrictions.ilike("a.lastname", searchCrit, MatchMode.ANYWHERE))
					.add(Restrictions.ilike("g.name", searchCrit, MatchMode.ANYWHERE))
					);
		}
		return crit.list();
	}
	
	
	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<Book> listTopSellers() {
		Criteria crit = sessionFactory.getCurrentSession().createCriteria(Book.class);
		crit.addOrder(Order.desc("sold"));
		crit.setMaxResults(10);
		return crit.list();
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
	
	@Transactional(readOnly = true)
	public boolean canComment(String username, int bookId) {
		Session session = sessionFactory.getCurrentSession();
	    Query query = session
	            .createSQLQuery("CALL CanComment(:username,:bookId)");
	    query.setParameter("username", username);
	    query.setParameter("bookId", bookId);
	    BigInteger result = (BigInteger) query.uniqueResult();	
	    return result.equals(BigInteger.valueOf(1)) ? true : false;
	}
}
