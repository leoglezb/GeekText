package com.geektext.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.PaymentMethodDao;
import com.geektext.form.PaymentMethod;

@Repository
public class PaymentMethodDaoImpl implements PaymentMethodDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Transactional(readOnly = true)
	public PaymentMethod getPaymentMethod(PaymentMethod id) {
		Session session = sessionFactory.getCurrentSession();
		PaymentMethod u = (PaymentMethod) session.get(PaymentMethod.class, id);
		return u;
	}

	@Override
	public PaymentMethod addPaymentMethod(String cardHolderName, int cardnumber, int cvv,  int expirationMonth, int expirationYear) {
		PaymentMethod payment = new PaymentMethod() ;
		payment.setcardHolderName(cardHolderName);
		payment.setCardnumber(cardnumber);
		payment.setCvv(cvv);
		payment.setExpirationMonth(expirationMonth);
		payment.setExpirationYear(expirationYear);
	
		sessionFactory.getCurrentSession().save(payment);
		
		return payment ;
	}

	@Transactional(readOnly = true)
	@SuppressWarnings("unchecked")
	public List<PaymentMethod> listPaymentMethod() {
		return sessionFactory.getCurrentSession().createQuery("from PaymentMethod").list();

	}

	@Override
	public void removePaymentMethod(PaymentMethod id) {
		Session session = sessionFactory.getCurrentSession();
		PaymentMethod PaymentMethod = (PaymentMethod) session.load(PaymentMethod.class, id);
		if (null != PaymentMethod) {
			sessionFactory.getCurrentSession().delete(PaymentMethod);
		}
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<PaymentMethod> paginate(int[] range) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(PaymentMethod.class);
		criteria.setMaxResults(range[0]).setFirstResult((range[1] - 1) * range[0]);
		return criteria.list();
	}

	@Transactional(readOnly = true)
	public boolean exist(PaymentMethod id) {
		Session session = sessionFactory.getCurrentSession();
		boolean result = session.get(PaymentMethod.class, id) != null;
		return result;
	}
	
}
