package com.geektext.dao;

import java.util.List;

import com.geektext.form.PaymentMethod;

public interface PaymentMethodDao {

	public PaymentMethod getPaymentMethod(PaymentMethod id);
    public void addPaymentMethod(PaymentMethod paymentMethod);
    public List<PaymentMethod> listPaymentMethod();
    public void removePaymentMethod(PaymentMethod id);
    public List<PaymentMethod> paginate(int[] range);
    public boolean exist(PaymentMethod id);
	
}
