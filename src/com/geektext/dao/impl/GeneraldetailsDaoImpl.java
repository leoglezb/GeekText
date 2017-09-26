package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.geektext.dao.GeneraldetailsDao;
import com.geektext.form.Generaldetails;
import com.geektext.form.MyList;
import com.geektext.service.imp.BeanSpring;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
@Repository
public class GeneraldetailsDaoImpl implements GeneraldetailsDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private BeanSpring beanSpring;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    public Generaldetails getDetail(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Generaldetails u = (Generaldetails) session.get(Generaldetails.class, id);
        return u;
    }

    @SuppressWarnings("unchecked")
	public MyList<Generaldetails> listDetails() {
    	MyList<Generaldetails> list = new MyList<Generaldetails>();
        //return sessionFactory.getCurrentSession().createQuery("from Exchange").list();
    	Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Generaldetails.class);
		criteria.addOrder(Order.desc("id"));
		list.setList(criteria.list());
		criteria.setProjection(Projections.rowCount());
		Number recordsCount = (Number)criteria.uniqueResult();
		list.setCount(recordsCount.intValue());
    	return list;
    }

    @SuppressWarnings("unchecked")
	public MyList<Generaldetails> listDetails(Integer page, Integer pageSize, String[] fieldFilter, Object[] valueFilter, String _orderField, String asc_desc, Integer numLinks) {
    	MyList<Generaldetails> list = new MyList<Generaldetails>();
    	list.setPage(page);
    	Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Generaldetails.class);
		Criteria criteriaCount = session.createCriteria(Generaldetails.class);
		if (fieldFilter != null && valueFilter != null && fieldFilter.length == valueFilter.length ) {
			for (int i = 0 ; i < fieldFilter.length ; i++) {
				criteria.add(Restrictions.eq(fieldFilter[i], valueFilter[i]));
				criteriaCount.add(Restrictions.eq(fieldFilter[i], valueFilter[i]));
	        }		
		}
		if (asc_desc!=null){
			if(asc_desc.equals("DESC")){
				criteria.addOrder(Order.desc(_orderField));
			} else {
				criteria.addOrder(Order.asc(_orderField));
			}
		}
		if (page!=null && pageSize!=null){
			criteria.setFirstResult(page*pageSize);
			criteria.setMaxResults(pageSize);
		}
		list.setList(criteria.list());
	    criteriaCount.setProjection(Projections.rowCount());
		Number uniqueResult = (Number)criteriaCount.uniqueResult();
		Integer recordsCount = 0;
		Integer pageCount = 0;
		if (uniqueResult!=null){
			recordsCount = uniqueResult.intValue();
			list.setCount(recordsCount.intValue());		
			if (recordsCount % pageSize == 0) {
				pageCount = recordsCount / pageSize;
			} else {
				pageCount = (recordsCount / pageSize) + 1;
			}
		}
		list.setPageCount(pageCount);
		list.setPageStart(page);
		Integer pageNext=0;
		if (page<pageCount){
			pageNext= page+1;
		} else {
			pageNext= -1;
		}
		list.setPageNext(pageNext);
		list.setPageSize(pageSize);
    	return list;
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Generaldetails> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Generaldetails.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
    public void addDetail(Generaldetails detail) {
        sessionFactory.getCurrentSession().save(detail);
    }


    public void updateDetail(Generaldetails detail) {
        sessionFactory.getCurrentSession().update(detail);
    }
 
    public void removeDetail(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        Generaldetails detail = (Generaldetails) session.load(Generaldetails.class, id);
        if (null != detail) {
            sessionFactory.getCurrentSession().delete(detail);
        }
    }

    @Override
    public Number count() {
    	Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Generaldetails.class);
		criteria.setProjection(Projections.rowCount());
		return (Number)criteria.uniqueResult();
    }

    @Override
    public List<Generaldetails> select(String where, String[] orders) {
      return select(where, orders, null);
    }
    
    @SuppressWarnings("unchecked")
    @Override
    public List<Generaldetails> select(String where, String[] orders, int[] range) {
    	Criteria c = sessionFactory.getCurrentSession().createCriteria(Generaldetails.class);      
    	if (where != null && where.length() != 0) {
    		c.add(Restrictions.sqlRestriction(where));
    	}

    	String[] _order = null;
    	if (orders != null) {
    		for (String order : orders) {
    			if (order.contains(" ")) {
    				_order = order.split(" ");
    				if (_order[1].equals("desc")) {
    				  c.addOrder(Order.desc(_order[0]));
    				} else if (_order[1].equals("asc")) {
    					c.addOrder(Order.asc(_order[0]));
    				}
    			} else {
    				c.addOrder(Order.asc(order));
    			}
    		}
    	}

    	if (range != null) {
    		c.setMaxResults(range[1] - range[0]);
    		c.setFirstResult(range[0]);
    	}
    	return c.list();
    }

}