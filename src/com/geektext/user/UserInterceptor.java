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

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.Connection;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.twitter.api.Twitter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;


/**
 * Spring MVC Interceptor that exposes the Account identifying the currently signed in member as a well-known 
 * request attribute that can be used during the course of request processing.
 * Supports obtaining a reference to the current member Account from @Controllers and views.
 * @author Keith Donald
 */
public class UserInterceptor implements HandlerInterceptor {
	@Autowired
	private final UsersConnectionRepository connectionRepository;
	
	private final UserCookieGenerator userCookieGenerator = new UserCookieGenerator();

	public UserInterceptor(UsersConnectionRepository connectionRepository) {
		this.connectionRepository = connectionRepository;
	}
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		boolean result=false;
		rememberUser(request, response);
		if (SecurityContext.userSignedIn() || requestForSignIn(request)) {
			result =  true;
		} 
		if(handleSignOut(request, response)){
			result = doneSignOut(request, response);
		}
		return result;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {		    
	}
	// internal helpers

	private void rememberUser(HttpServletRequest request, HttpServletResponse response) {
		String userId = userCookieGenerator.readCookieValue(request);
		if (userId == null || userId.equals("")) {
			return;
		}
		if (!facebookConnected(userId) && !twitterConnected(userId)) {
			userCookieGenerator.removeCookie(response);
			return;
		}
		Connection<?> connection=null;
		if (facebookConnected(userId)){
			connection =connectionRepository.createConnectionRepository(userId).getPrimaryConnection(Facebook.class);
		} else if (twitterConnected(userId)){
			connection =connectionRepository.createConnectionRepository(userId).getPrimaryConnection(Twitter.class);
		}
		String firstName =  connection.fetchUserProfile().getFirstName();
		SecurityContext.setCurrentUser(new User(userId, firstName));
	}

	private boolean handleSignOut(HttpServletRequest request, HttpServletResponse response) {
		boolean result=false;
		if (request.getServletPath().startsWith("/signout")){
			if (SecurityContext.userSignedIn()) {
				if (facebookConnected(SecurityContext.getCurrentUser().getId())){
					connectionRepository.createConnectionRepository(SecurityContext.getCurrentUser().getId()).removeConnections("facebook");
				}
				if (twitterConnected(SecurityContext.getCurrentUser().getId())){
					connectionRepository.createConnectionRepository(SecurityContext.getCurrentUser().getId()).removeConnections("twitter");
				}
				userCookieGenerator.removeCookie(response);
				SecurityContext.remove();
			}
			Authentication temp3 = SecurityContextHolder.getContext().getAuthentication();
			if (!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser")){
				SecurityContextHolder.clearContext();
			}
			result = true;
		}
		return result;
	}
		
	private boolean requestForSignIn(HttpServletRequest request) {
		return request.getServletPath().startsWith("/");
	}

	private boolean doneSignOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		new RedirectView("/", true).render(null, request, response);
		return false;
	}

	
	private boolean facebookConnected(String userId) {
		boolean result = false;
	    List<Connection<?>> connections = connectionRepository.createConnectionRepository(userId).findConnections("facebook");
	    if (!connections.isEmpty()) {
	    	result = true;
	    }
	    return result;
	}

	private boolean twitterConnected(String userId) {
		boolean result = false;
	    List<Connection<?>> connections = connectionRepository.createConnectionRepository(userId).findConnections("twitter");
	    if (!connections.isEmpty()) {
	    	result = true;
	    }
	    return result;
	}
	
}
