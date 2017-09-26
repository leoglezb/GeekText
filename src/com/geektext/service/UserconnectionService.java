package com.geektext.service;

import java.util.List;

import com.geektext.form.Userconnection;
 
public interface UserconnectionService {
	public Userconnection getUserconnection(String userId, String providerId, String providerUserId);
    public void addUserconnection(Userconnection userconnection);
    public List<Userconnection> listUserconnection();
    public void removeUserconnection(String userId, String providerId, String providerUserId);
    
}