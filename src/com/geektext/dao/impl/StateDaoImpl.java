package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.StateDao;
import com.geektext.form.Country;
import com.geektext.form.State;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class StateDaoImpl implements StateDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public State getState(String id) {
        Session session = sessionFactory.getCurrentSession();
        State u = (State) session.get(State.class, id);
        return u;
    }

    @Transactional(readOnly = true)
    public boolean exist(String id) {
        Session session = sessionFactory.getCurrentSession();
        boolean result = session.get(State.class, id) != null;
        return result;
    }
    

    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<State> listState() {
        return sessionFactory.getCurrentSession().createQuery("from State").list();
    }
    
    public void addState(State State) {
        sessionFactory.getCurrentSession().save(State);
    }
 
    public void removeState(String id) {
        Session session = sessionFactory.getCurrentSession();
        State state = (State) session.load(State.class, id);
        if (null != state) {
            sessionFactory.getCurrentSession().delete(state);
        }
    }
    @SuppressWarnings("unchecked")
    @Override
    public List<State> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(State.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
    
}