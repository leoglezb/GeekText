package com.geektext.form;

import org.springframework.web.multipart.MultipartFile;

public class MultiPartFileUploadBean {
    
    private String title;
    private String descrip;
    private String date;
    private String location;
    private String[] tags;
    private MultipartFile file;
    
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescrip() {
		return descrip;
	}
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}
	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
	}
	public String[] getTags() {
		return tags;
	}
	public void setTags(String[] tags) {
		this.tags = tags;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
    
}