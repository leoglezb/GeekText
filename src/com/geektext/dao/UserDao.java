/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.geektext.dao;

import com.geektext.user.User;
import java.util.List;

public interface UserDao {
    public User getUser(Integer id);
    public User addUser(User user);
    public User removeUser(User user);
    public List<User> getAllUsers();
}
