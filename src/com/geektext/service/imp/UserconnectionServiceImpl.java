package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.UserconnectionDao;
import com.geektext.form.Userconnection;
import com.geektext.service.UserconnectionService;
 
@Service
public class UserconnectionServiceImpl implements UserconnectionService {
 
    @Autowired
    private UserconnectionDao UserconnectionDAO;
     
    @Transactional
    public Userconnection getUserconnection(String userId, String providerId, String providerUserId) {
        return UserconnectionDAO.getUserconnection(userId,providerId,providerUserId);
    }

    @Transactional
    public void addUserconnection(Userconnection Userconnection) {
        UserconnectionDAO.addUserconnection(Userconnection);
    }
 
    @Transactional
    public List<Userconnection> listUserconnection() {
        return UserconnectionDAO.listUserconnection();
    }
 
    @Transactional
    public void removeUserconnection(String userId, String providerId, String providerUserId) {
        UserconnectionDAO.removeUserconnection(userId,providerId,providerUserId);
    }
}