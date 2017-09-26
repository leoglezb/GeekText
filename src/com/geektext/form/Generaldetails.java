package com.geektext.form;

import java.io.File;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;
import com.geektext.form.Picture;
import com.geektext.utils.ResizeImages;
 
@Entity
@Table(name="tbl_generaldetails")
public class Generaldetails {
    @Id
    @Column(name="id")
    @GeneratedValue
    private Integer id;

    @Column(name="codope")
    private String codope;

    @ManyToOne
    @JoinColumn(name = "username")  
    private Userdetails userdetails;

    @Column(name="id_state")
    private String id_state;

    @Column(name="id_city")
    private String id_city;

    @Column(name="address")
    private String address;

    @Column(name="longitud")
    private String longitud;

    @Column(name="latitud")
    private String latitud;

    @Column(name="title")
    private String title;

    @Column(name="price")
    private float price;

    @Column(name="date_add")
    private Timestamp  date_add;

    @Column(name="phone")
    private String phone;

    @Column(name="pictures")
    private Integer pictures;

    @Column(name="estado")
    private String estado;

    @Column(name="date_f")
    private Timestamp date_f;

    @Column(name="fax")
    private String fax;

    @Column(name="main_thumbnail_url")
    private String main_thumbnail_url;
    
    @Column(name="main_picture_url")
    private String main_picture_url;

    @Column(name="date_modf")
    private Timestamp date_modf;

    @Column(name="id_fotos")
    private String id_fotos;

    @Column(name="descrip")
    private String descrip;

    @Column(name="tags")
    private String tags;
    
    @Column(name="location")
    private String location;
    
    @Column(name="pic_width")
    private Integer pic_width;

    @Column(name="pic_height")
    private Integer pic_height;
    
    
    public Userdetails getUserdetails() { 
    	return userdetails; 
    }

    public void setUserdetails(Userdetails userdetails) { 
    	this.userdetails = userdetails; 
    }
    
    public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getLongitud() {
		return longitud;
	}

	public void setLongitud(String longitud) {
		this.longitud = longitud;
	}

	public String getLatitud() {
		return latitud;
	}

	public void setLatitud(String latitud) {
		this.latitud = latitud;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public Timestamp getDate_add() {
		return date_add;
	}

	public void setDate_add(Timestamp date_add) {
		this.date_add = date_add;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getPictures() {
		return pictures;
	}

	public void setPictures(Integer pictures) {
		this.pictures = pictures;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public Timestamp getDate_f() {
		return date_f;
	}

	public void setDate_f(Timestamp date_f) {
		this.date_f = date_f;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getMain_thumbnail_url() {
		return main_thumbnail_url;
	}

	public void setMain_thumbnail_url(String main_thumbnail_url) {
		this.main_thumbnail_url = main_thumbnail_url;
	}

	public String getMain_picture_url() {
		return main_picture_url;
	}

	public void setMain_picture_url(String main_picture_url) {
		this.main_picture_url = main_picture_url;
	}

	public Timestamp getDate_modf() {
		return date_modf;
	}

	public void setDate_modf(Timestamp date_modf) {
		this.date_modf = date_modf;
	}

	public String getId_fotos() {
		return id_fotos;
	}

	public void setId_fotos(String id_fotos) {
		this.id_fotos = id_fotos;
	}

	public String getDescrip() {
		return descrip;
	}

	public String getShortDescrip() {
		return descrip;
	}
	
	public void setDescrip(String descrip) {
		this.descrip = descrip;
	}

	public Generaldetails writeImageFiles(MultipartFile file, String path, String photosFolder) {
		try {
			String contentType = file.getContentType();
			String fileName = file.getOriginalFilename();
			String extension = fileName.substring(fileName.lastIndexOf("."));
			File fileNametoCreate = new File(path + photosFolder + getId()+ extension);
			FileUtils.writeByteArrayToFile(fileNametoCreate, file.getBytes());
			ResizeImages ri = new ResizeImages();
			//ri.createProfileImg(fileNametoCreate);
			ri.createIconoImg(fileNametoCreate);
			Picture thumb = ri.createThumbImg(fileNametoCreate);
			this.setPic_height(thumb.getHeight());
			this.setPic_width(thumb.getWidth());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return this;
	}

	public String getCodope() {
		return codope;
	}

	public void setCodope(String codope) {
		this.codope = codope;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Integer getPic_width() {
		return pic_width;
	}

	public void setPic_width(Integer pic_width) {
		this.pic_width = pic_width;
	}

	public Integer getPic_height() {
		return pic_height;
	}

	public void setPic_height(Integer pic_height) {
		this.pic_height = pic_height;
	}
	
}