/*
 * Copyright 2013 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.geektext.user;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.GrantedAuthorityImpl;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.savedrequest.DefaultSavedRequest;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;

import com.geektext.form.Userdetails;
import com.geektext.service.UserdetailsService;

public final class SimpleSignInAdapter implements SignInAdapter {
	@Autowired
	private UserDetailsManager userDetailsManager;
	@Autowired
	private UserdetailsService service;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private SaltSource saltSource;
	
	
	public static final String USER_KEY = "currentUserForm";
	public static final String GUESTUSER = "guest";
	private final UserCookieGenerator userCookieGenerator = new UserCookieGenerator();
	
 
	public String signIn(String username, Connection<?> connection, NativeWebRequest request) {
		String password ="";
		String user_firstname = connection.fetchUserProfile().getFirstName();
		String user_email = connection.fetchUserProfile().getEmail();
		if (!userDetailsManager.userExists(username)) {
			List<GrantedAuthority> authorites = new ArrayList<GrantedAuthority>();
			authorites.add(new GrantedAuthorityImpl("ROLE_USER"));
			User user = new User(username, password, true, false, false, false, authorites);
			User saltedUser = new User(username, passwordEncoder.encodePassword(password, saltSource.getSalt(user)),true, false, false, false, authorites);
			userDetailsManager.createUser(saltedUser);
			Userdetails userdetails= new Userdetails();
			userdetails.setUsername(username);
			userdetails.setEmail(user_email);
			userdetails.setName(user_firstname);
			userdetails.setLastname(connection.fetchUserProfile().getLastName());
			//userdetails.setLastname(connection.getImageUrl());
			userdetails.setActivationcode("1");
			userdetails.setDe("P");
			userdetails.setDate_add(new Timestamp(java.lang.System.currentTimeMillis()));
			service.addUserdetails(userdetails);
		}
		UserDetails user = userDetailsManager.loadUserByUsername(username);
	    Authentication auth = new UsernamePasswordAuthenticationToken(user, password,user.getAuthorities());
	    SecurityContextHolder.getContext().setAuthentication(auth);
	    userCookieGenerator.addCookie(username, request.getNativeResponse(HttpServletResponse.class));
	    request.setAttribute(USER_KEY, user, RequestAttributes.SCOPE_SESSION); 
	    DefaultSavedRequest savedRequest = (DefaultSavedRequest) request.getAttribute(WebAttributes.SAVED_REQUEST,RequestAttributes.SCOPE_SESSION); 
	    if(savedRequest != null) 
	        return savedRequest.getRedirectUrl(); 
	    return null; 
	}    

}
