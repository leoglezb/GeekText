package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.geektext.dao.PaymentMethodDao;
import com.geektext.form.PaymentMethod;
import com.geektext.service.PaymentMethodService;

@Service
public class PaymentMethodServiceImpl {

	@Autowired
	private PaymentMethodDao PaymentMethodDAO;

	@Transactional
	public PaymentMethod getPaymentMethod(PaymentMethod id) {
		return PaymentMethodDAO.getPaymentMethod(id);
	}

	@Transactional
	public PaymentMethod addPaymentMethod(String cardHolderName, int cardnumber, int cvv,  int expirationMonth, int expirationYear) {
		return PaymentMethodDAO.addPaymentMethod(cardHolderName, cardnumber, cvv, expirationMonth, expirationYear);

	}

	@Transactional
	public List<PaymentMethod> listPaymentMethod() {
		return PaymentMethodDAO.listPaymentMethod();
	}

	@Transactional
	public void removePaymentMethod(PaymentMethod id) {
		PaymentMethodDAO.removePaymentMethod(id);

	}

	@Transactional
	public boolean exist(PaymentMethod id) {
		return PaymentMethodDAO.exist(id);
	}	
}
