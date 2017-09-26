package com.geektext.service.imp;
import org.springframework.stereotype.Service;

@Service
public class BeanSpring {
	private String op_exchange;
	private String op_events;
	private String op_issues;
	private String op_business;
	private String op_heros;
	private String op_services;
	private String op_newsfeed;
	private String photosFolder;
	private String profilesFolder;
	// Actualizar root-context.xml
	
	public String getOp_exchange() {
		return op_exchange;
	}
	public void setOp_exchange(String op_exchange) {
		this.op_exchange = op_exchange;
	}
	public String getOp_events() {
		return op_events;
	}
	public void setOp_events(String op_events) {
		this.op_events = op_events;
	}
	public String getOp_issues() {
		return op_issues;
	}
	public void setOp_issues(String op_issues) {
		this.op_issues = op_issues;
	}
	public String getOp_business() {
		return op_business;
	}
	public void setOp_business(String op_business) {
		this.op_business = op_business;
	}
	public String getOp_heros() {
		return op_heros;
	}
	public void setOp_heros(String op_heros) {
		this.op_heros = op_heros;
	}
	public String getOp_services() {
		return op_services;
	}
	public void setOp_services(String op_services) {
		this.op_services = op_services;
	}
	public String getPhotosFolder() {
		return photosFolder;
	}
	public void setPhotosFolder(String photosFolder) {
		this.photosFolder = photosFolder;
	}
	public String getProfilesFolder() {
		return profilesFolder;
	}
	public void setProfilesFolder(String profilesFolder) {
		this.profilesFolder = profilesFolder;
	}
	public String getOp_newsfeed() {
		return op_newsfeed;
	}
	public void setOp_newsfeed(String op_newsfeed) {
		this.op_newsfeed = op_newsfeed;
	}
}

