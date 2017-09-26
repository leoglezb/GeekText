package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.UserdetailsDao;
import com.geektext.form.Userdetails;
import com.geektext.service.UserdetailsService;
 
@Service
public class UserdetailsServiceImpl implements UserdetailsService {
 
    @Autowired
    private UserdetailsDao UserdetailsDAO;
     
    @Transactional
    public Userdetails getUserdetails(String id) {
        return UserdetailsDAO.getUserdetails(id);
    }

    @Transactional
    public void addUserdetails(Userdetails userdetails) {
        UserdetailsDAO.addUserdetails(userdetails);
    }

    @Transactional
    public void updateUserdetails(Userdetails userdetails) {
        UserdetailsDAO.updateUserdetails(userdetails);
    }
    
    @Transactional
    public List<Userdetails> listUserdetails() {
        return UserdetailsDAO.listUserdetails();
    }
 
    @Transactional
    public void removeUserdetails(String id) {
        UserdetailsDAO.removeUserdetails(id);
    }
}