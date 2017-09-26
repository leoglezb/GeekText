package com.geektext.dao.impl;

import java.util.List;

import com.geektext.dao.LanguageDao;
import com.geektext.form.Language;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

 
@Repository
public class LanguageDaoImpl implements LanguageDao {
	@Autowired
	private SessionFactory sessionFactory;
	
    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
 
    @Transactional(readOnly = true)
    public Language getLanguage(String id) {
        Session session = sessionFactory.getCurrentSession();
        Language u = (Language) session.get(Language.class, id);
        return u;
    }

    @Transactional(readOnly = true) 
    @SuppressWarnings("unchecked")
	public List<Language> listLanguage() {
        return sessionFactory.getCurrentSession().createQuery("from Language").list();
    }
    
    public void addLanguage(Language Language) {
        sessionFactory.getCurrentSession().save(Language);
    }

    public void removeLanguage(String id) {
        Session session = sessionFactory.getCurrentSession();
        Language language = (Language) session.load(Language.class, id);
        if (null != language) {
            sessionFactory.getCurrentSession().delete(language);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Language> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Language.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1]-1)*range[0]);
		return criteria.list();
    }
   
}