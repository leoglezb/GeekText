package com.geektext.form;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import com.geektext.utils.ResizeImages;

@Entity
@Table(name="Userdetails")
public class Userdetails {
	@Id
    @Column(name="username")
    private String username;

    @Column(name="firstname")
    private String firstname;
	
    @Column(name="lastname")
    private String lastname;

    @Column(name="email")
    private String email;

    @Column(name="nickname")
    private String nickname;
    
    @Column(name="anonymous")
    private int anonymous;
    
    //add homeaddressid

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}
    
	
}
