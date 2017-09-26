/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.geektext.service;

import com.geektext.user.User;
import java.util.List;

public interface UserService {
    public User getUser(Integer id);
    public void addUser(User user);
    public void removeUser(User user);
    public List<User> getAllUsers();
}
