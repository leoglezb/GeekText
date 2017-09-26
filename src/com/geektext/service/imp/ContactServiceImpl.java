package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.ContactDao;
import com.geektext.form.Contact;
import com.geektext.service.ContactService;
 
@Service
public class ContactServiceImpl implements ContactService {
 
    @Autowired
    private ContactDao contactDAO;
     
    @Transactional
    public Contact getContact(Integer id) {
        return contactDAO.getContact(id);
    }

    @Transactional
    public void addContact(Contact contact) {
        contactDAO.addContact(contact);
    }
 
    @Transactional
    public List<Contact> listContact() {
        return contactDAO.listContact();
    }
 
    @Transactional
    public void removeContact(Integer id) {
        contactDAO.removeContact(id);
    }
}