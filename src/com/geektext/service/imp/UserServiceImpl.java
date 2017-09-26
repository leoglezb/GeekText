package com.geektext.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
 
import com.geektext.dao.UserDao;
import com.geektext.user.User;
import com.geektext.service.UserService;
 
@Service
public class UserServiceImpl implements UserService {
 
    @Autowired
    private UserDao UserDAO;
     
    @Transactional
    public User getUser(Integer id) {
        return UserDAO.getUser(id);
    }

    @Transactional
    public void addUser(User User) {
        UserDAO.addUser(User);
    }
 
    @Transactional
	public List<User> getAllUsers() {
        return UserDAO.getAllUsers();
    }
 
    @Transactional
    public void removeUser(User id) {
        UserDAO.removeUser(id);
    }
}