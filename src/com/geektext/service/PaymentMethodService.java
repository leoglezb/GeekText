package com.geektext.service;

import java.util.List;

import com.geektext.form.PaymentMethod;

public interface PaymentMethodService {
	public PaymentMethod getPaymentMethod(PaymentMethod id);
	public PaymentMethod addPaymentMethod(String cardHolderName, String cardnumber, int cvv,  int expirationMonth, int expirationYear);
    public List<PaymentMethod> listPaymentMethod();
    public void removePaymentMethod(PaymentMethod id);
    public boolean exist(PaymentMethod id);   
}
