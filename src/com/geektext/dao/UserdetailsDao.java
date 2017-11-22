package com.geektext.dao;

import java.util.List;

import com.geektext.form.Address;
import com.geektext.form.Userdetails;

 
public interface UserdetailsDao {
	public Userdetails getUserdetails(String username); 
    public void addUserdetails(Userdetails userdetails);
    public void updateUserdetails(Userdetails userdetails);
    public List<Userdetails> listUserdetails();
    public void removeUserdetails(String username);
    public List<Userdetails> paginate(int[] range);
}