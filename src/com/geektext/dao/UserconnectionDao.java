package com.geektext.dao;

import java.util.List;

import com.geektext.form.Userconnection;
 
public interface UserconnectionDao{
	public Userconnection getUserconnection(String userId, String providerId, String providerUserId);
    public void addUserconnection(Userconnection userconnection);
    public List<Userconnection> listUserconnection();
    public void removeUserconnection(String userId, String providerId, String providerUserId);
    public List<Userconnection> paginate(int[] range);
    
}