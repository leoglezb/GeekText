package com.geektext.service;

import java.util.List;

import com.geektext.form.Contact;
 
public interface ContactService {
	public Contact getContact(Integer id); 
    public void addContact(Contact contact);
    public List<Contact> listContact();
    public void removeContact(Integer id);
}