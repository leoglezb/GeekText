package com.geektext.service;

import java.util.List;

import com.geektext.form.Userdetails;

 
public interface UserdetailsService {
	public Userdetails getUserdetails(String username); 
    public void addUserdetails(Userdetails userdetails);
    public void updateUserdetails(Userdetails userdetails);
    public List<Userdetails> listUserdetails();
    public void removeUserdetails(String username);
    
}