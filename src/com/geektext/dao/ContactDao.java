package com.geektext.dao;

import java.util.List;

import com.geektext.form.Contact;
 
public interface ContactDao {
	public Contact getContact(Integer id); 
    public void addContact(Contact contact);
    public List<Contact> listContact();
    public void removeContact(Integer id);
    public List<Contact> paginate(int[] range);
}