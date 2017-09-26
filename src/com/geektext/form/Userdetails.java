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
@Table(name="tbl_user_details")
public class Userdetails {
	@Id
    @Column(name="username")
    private String username;

    @Column(name="name")
    private String name;
	
    @Column(name="lastname")
    private String lastname;

    @Column(name="phone")
    private String phone;

    @Column(name="fax")
    private String fax;
	
    @Column(name="de")
    private String de;

    @Column(name="activationcode")
    private String activationcode;

    @Column(name="active")
    private String active;
	
    @Column(name="date_add")
    private Timestamp date_add;

    @Column(name="id_state")
    private String id_state;

    @Column(name="id_city")
    private String id_city;

    @Column(name="date_last_visit")
    private Timestamp date_last_visit;

    @Column(name="baja")
    private String baja;

    @Column(name="home_adress")
    private String home_adress;

    @Column(name="latitude")
    private String latitude;

    @Column(name="longitude")
    private String longitude;

    @Column(name="email")
    private String email;

    @Column(name="descrip")
    private String descrip;

    @Column(name="visible_options")
    private String visible_options;

    @Column(name="ocupation")
    private String ocupation;

    @Column(name="county")
    private String county;

    @Column(name="country")
    private String country;

    @Column(name="zipcode")
    private String zipcode;

    @OneToMany(mappedBy="userdetails", cascade=CascadeType.ALL)  
    private Set <Generaldetails> generaldetails;  
    
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getDe() {
		return de;
	}

	public void setDe(String de) {
		this.de = de;
	}

	public String getActivationcode() {
		return activationcode;
	}

	public void setActivationcode(String activationcode) {
		this.activationcode = activationcode;
	}


	public String getId_state() {
		return id_state;
	}

	public void setId_state(String id_state) {
		this.id_state = id_state;
	}

	public String getId_city() {
		return id_city;
	}

	public void setId_city(String id_city) {
		this.id_city = id_city;
	}

	public String getBaja() {
		return baja;
	}

	public void setBaja(String baja) {
		this.baja = baja;
	}

	public String getHome_adress() {
		return home_adress;
	}

	public void setHome_adress(String home_adress) {
		this.home_adress = home_adress;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescrip() {
		return descrip;
	}

	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public String getVisible_options() {
		return visible_options;
	}

	public void setVisible_options(String visible_options) {
		this.visible_options = visible_options;
	}

	public String getOcupation() {
		return ocupation;
	}

	public void setOcupation(String ocupation) {
		this.ocupation = ocupation;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public Timestamp getDate_add() {
		return date_add;
	}

	public void setDate_add(Timestamp date_add) {
		this.date_add = date_add;
	}

	public Timestamp getDate_last_visit() {
		return date_last_visit;
	}

	public void setDate_last_visit(Timestamp date_last_visit) {
		this.date_last_visit = date_last_visit;
	}
    public Set<Generaldetails> getGeneraldetails() {  
        return generaldetails;  
    }  
  
    public void setPlayers(Set<Generaldetails> generaldetails) {  
        this.generaldetails = generaldetails;  
    } 
    public void writeSubimage(String path, String photosFolder, int w, int h, int x1, int y1, int x2, int y2){
    	try {
	    	File file = new File(path + photosFolder + getUsername()+ "-temp.jpg");
			ResizeImages ri = new ResizeImages();
			ri.createProfileImg(file, w, h, x1, y1, x2, y2);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
	public void writeImageFiles(MultipartFile file, String path, String photosFolder, int w, int h, int x1, int y1, int x2, int y2) {
		try {
			String contentType = file.getContentType();
			String fileName = file.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			File fileNametoCreate = new File(path + photosFolder + getUsername()+ extension);
			FileUtils.writeByteArrayToFile(fileNametoCreate, file.getBytes());
			ResizeImages ri = new ResizeImages();
			ri.createProfileImg(fileNametoCreate, w, h, x1, y1, x2, y2);
			ri.createIconoImg(fileNametoCreate);
			ri.createThumbImg(fileNametoCreate);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Picture writeImageProfileTemp(MultipartFile file, String path, String photosFolder) {
		Picture picture=null;
		try {
			String contentType = file.getContentType();
			String fileName = file.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			File fileNametoCreate = new File(path + photosFolder + getUsername()+ extension);
			FileUtils.writeByteArrayToFile(fileNametoCreate, file.getBytes());
			ResizeImages ri = new ResizeImages();
			picture = ri.createProfileImgTemp(fileNametoCreate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return picture;
	}	
	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
}
